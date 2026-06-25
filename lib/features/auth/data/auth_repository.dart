// lib/features/auth/data/auth_repository.dart

import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/storage/secure_storage.dart';
import '../domain/auth_state.dart';
import 'dart:convert';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<({AgentUser user, String accessToken})> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email.trim().toLowerCase(), 'password': password},
    );

    if (response.statusCode != 200) {
      throw response.data['message'] ?? 'Login failed';
    }

    final user = AgentUser.fromJson(
      response.data['user'] as Map<String, dynamic>,
    );
    final accessToken = response.data['accessToken'] as String;

    if (user.role != 'delivery_agent') {
      await _dio.post(ApiConstants.logout);
      throw 'This app is only for delivery agents.';
    }

    await SecureStorage.saveAccessToken(accessToken);
    await SecureStorage.saveUser(jsonEncode(user.toJson()));

    return (user: user, accessToken: accessToken);
  }

  // [FIX] logout() now also deletes the persisted cookie directory so that
  // the refreshToken HttpOnly cookie is wiped from disk. If we only cleared
  // SecureStorage, the cookie file would remain and the server would accept
  // another refresh call even after a manual logout.
  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.logout);
    } catch (_) {
      // Even if the server call fails, clear everything locally.
    } finally {
      await SecureStorage.clearAll();
      await _deleteCookies();
    }
  }

  Future<void> _deleteCookies() async {
    try {
      final appDir = await getApplicationSupportDirectory();
      final cookieDir = Directory('${appDir.path}/cookies');
      if (cookieDir.existsSync()) {
        cookieDir.deleteSync(recursive: true);
      }
    } catch (_) {
      // Non-fatal — worst case the cookie expires naturally.
    }
  }

  /// Called on every cold start. Reads the persisted user from secure storage,
  /// then calls /refresh to exchange the HttpOnly cookie for a fresh access
  /// token. The cookie now survives app restarts because PersistCookieJar
  /// writes it to disk (see DioClient.create()).
  Future<({AgentUser user, String accessToken})?> tryRestoreSession() async {
    final userJson = await SecureStorage.readUser();
    if (userJson == null) return null;

    try {
      final response = await _dio.post(ApiConstants.refresh);
      if (response.statusCode != 200) return null;

      final newToken = response.data['accessToken'] as String;
      await SecureStorage.saveAccessToken(newToken);

      // Prefer fresh user data from the server when available.
      AgentUser user;
      if (response.data['user'] != null) {
        user = AgentUser.fromJson(
          response.data['user'] as Map<String, dynamic>,
        );
        await SecureStorage.saveUser(jsonEncode(user.toJson()));
      } else {
        user = AgentUser.fromJson(
          jsonDecode(userJson) as Map<String, dynamic>,
        );
      }

      return (user: user, accessToken: newToken);
    } catch (_) {
      await SecureStorage.clearAll();
      return null;
    }
  }

  Future<void> forgotPassword(String email) async {
    final response = await _dio.post(
      ApiConstants.forgotPassword,
      data: {'email': email.trim().toLowerCase()},
    );
    if (response.statusCode != 200) {
      throw response.data['message'] ?? 'Failed to send reset email';
    }
  }

  Future<void> validateResetToken(String token) async {
    final response = await _dio.get(
      ApiConstants.resetPasswordValidate,
      queryParameters: {"token": token},
    );
    if (response.statusCode != 200) {
      throw response.data["message"] ?? "Invalid or expired reset link";
    }
  }

  Future<void> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final response = await _dio.post(
      ApiConstants.resetPassword,
      data: {
        "token": token,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      },
    );
    if (response.statusCode != 200) {
      throw response.data["message"] ?? "Failed to reset password";
    }
  }
}