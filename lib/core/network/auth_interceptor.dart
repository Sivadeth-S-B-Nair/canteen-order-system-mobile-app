// lib/core/network/auth_interceptor.dart

import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio
      _dio; // reference to the same Dio instance (for making the refresh call)
  bool _isRefreshing = false;

  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
      _queue = [];

  AuthInterceptor(this._dio);

  // ── onRequest ──────────────────────────────────────────────────────────
  // Runs BEFORE every request. We attach the access token here.
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token attachment for public routes (login, refresh, forgot-password)
    final isPublic = [
      ApiConstants.login,
      ApiConstants.refresh,
      ApiConstants.forgotPassword,
    ].any((route) => options.path.contains(route));

    if (!isPublic) {
      final token = await SecureStorage.readAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  // ── onError ────────────────────────────────────────────────────────────
  // Runs when any request gets a non-2xx response.
  // We intercept 401 "Token expired" and refresh silently.

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final options = err.requestOptions;

    final isExpired = response?.statusCode == 401 &&
        response?.data['message'] == 'Token expired';

    // Don't retry public routes or already-retried requests
    final isPublic = options.path.contains(ApiConstants.refresh) ||
        options.path.contains(ApiConstants.login);

    // options.extra is a Map<String, dynamic> we can use to store flags.
    final alreadyRetried = options.extra['_retry'] == true;

    if (isExpired && !isPublic && !alreadyRetried) {
      if (_isRefreshing) {
        // A refresh is already happening. Add this request to the queue.
        // It will be retried when the refresh completes.
        _queue.add((options: options, handler: handler));
        return;
      }

      _isRefreshing = true;

      try {
        // Call the refresh endpoint. Notice we use _dio directly,
        // not through the interceptor (would cause infinite loop).
        final refreshResponse = await _dio.post(
          ApiConstants.refresh,
          options: Options(extra: {'_retry': true}), // prevents re-intercepting
        );

        final newToken = refreshResponse.data['accessToken'] as String;
        await SecureStorage.saveAccessToken(newToken);

        // Retry all queued requests with the new token
        for (final queued in _queue) {
          queued.options.headers['Authorization'] = 'Bearer $newToken';
          queued.options.extra['_retry'] = true;
          try {
            final retryResponse = await _dio.fetch(queued.options);
            queued.handler.resolve(retryResponse);
          } catch (e) {
            queued.handler.reject(e as DioException);
          }
        }
        _queue.clear();

        // Retry the original request
        options.headers['Authorization'] = 'Bearer $newToken';
        options.extra['_retry'] = true;
        final retryResponse = await _dio.fetch(options);
        handler.resolve(retryResponse);
      } catch (refreshError) {
        // Refresh token is also expired — force logout.
        // We clear storage here; the authProvider will react and redirect.
        _queue.clear();
        await SecureStorage.clearAll();
        handler.reject(err); // propagate the 401 up to the caller
      } finally {
        _isRefreshing = false;
      }
      return;
    }

    // For all other errors, pass them through unchanged
    handler.next(err);
  }
}
