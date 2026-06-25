// lib/core/network/auth_interceptor.dart

import 'dart:async';
import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  bool _isRefreshing = false;

  final List<({RequestOptions options, Completer<String> completer})>
      _pendingQueue = [];

  AuthInterceptor(this._dio);

  // ── onRequest ────────────────────────────────────────────────────────────
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isPublic = _isPublicRoute(options.path);

    if (!isPublic) {
      final token = await SecureStorage.readAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }


  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (_shouldRefresh(response.statusCode, response.data, response.requestOptions)) {
      final newToken = await _refreshOrClear();
      if (newToken == null) {
        // Refresh failed — pass the 401 through; router will redirect to /login
        return handler.next(response);
      }
      // Retry original request with fresh token
      try {
        final retried = await _retry(response.requestOptions, newToken);
        return handler.resolve(retried);
      } catch (e) {
        return handler.next(response);
      }
    }
    handler.next(response);
  }

  // ── onError ──────────────────────────────────────────────────────────────
  // This fires for network failures or status codes ≥ 500 (rejected by
  // validateStatus). Kept in sync with onResponse logic for safety.
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response != null &&
        _shouldRefresh(response.statusCode, response.data, err.requestOptions)) {
      final newToken = await _refreshOrClear();
      if (newToken == null) {
        return handler.reject(err);
      }
      try {
        final retried = await _retry(err.requestOptions, newToken);
        return handler.resolve(retried);
      } catch (e) {
        return handler.reject(err);
      }
    }
    handler.next(err);
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  bool _isPublicRoute(String path) => [
        ApiConstants.login,
        ApiConstants.refresh,
        ApiConstants.forgotPassword,
        ApiConstants.resetPasswordValidate,
        ApiConstants.resetPassword,
      ].any((route) => path.contains(route));

  bool _shouldRefresh(int? statusCode, dynamic data, RequestOptions options) {
    final isExpired =
        statusCode == 401 &&
        data is Map &&
        data['message'] == 'Token expired';
    final isAlreadyRetried = options.extra['_retry'] == true;
    final isPublic = _isPublicRoute(options.path);
    return isExpired && !isAlreadyRetried && !isPublic;
  }

  /// Performs the token refresh. Returns the new access token on success,
  /// or null if the refresh token is also expired (forces logout).
  /// Uses a queue so concurrent requests don't each trigger their own refresh.
  Future<String?> _refreshOrClear() async {
    if (_isRefreshing) {
      // Another refresh is in flight — wait for it to complete.
      final completer = Completer<String>();
      _pendingQueue.add((
        options: RequestOptions(path: ''), // placeholder; only completer matters
        completer: completer,
      ));
      try {
        return await completer.future;
      } catch (_) {
        return null;
      }
    }

    _isRefreshing = true;
    try {
      final refreshResponse = await _dio.post(
        ApiConstants.refresh,
        options: Options(extra: {'_retry': true}),
      );

      if (refreshResponse.statusCode != 200) {
        await SecureStorage.clearAll();
        _rejectPending();
        return null;
      }

      final newToken = refreshResponse.data['accessToken'] as String;
      await SecureStorage.saveAccessToken(newToken);
      _resolvePending(newToken);
      return newToken;
    } catch (_) {
      await SecureStorage.clearAll();
      _rejectPending();
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response> _retry(RequestOptions options, String newToken) {
    final retryOptions = options.copyWith(
      headers: {
        ...options.headers,
        'Authorization': 'Bearer $newToken',
      },
      extra: {
        ...options.extra,
        '_retry': true,
      },
    );
    return _dio.fetch(retryOptions);
  }

  void _resolvePending(String token) {
    for (final entry in _pendingQueue) {
      entry.completer.complete(token);
    }
    _pendingQueue.clear();
  }

  void _rejectPending() {
    for (final entry in _pendingQueue) {
      entry.completer.completeError('Refresh failed');
    }
    _pendingQueue.clear();
  }
}