// lib/features/auth/data/auth_repository.dart

import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/storage/secure_storage.dart';
import '../domain/auth_state.dart';
import 'dart:convert';

class AuthRepository {
  final Dio _dio;

  // The Dio instance is injected — this is dependency injection.
  // It makes testing easy: pass a mock Dio in tests.
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
      // response.data is already parsed JSON (Map<String, dynamic>)
      throw response.data['message'] ?? 'Login failed';
    }

    final user =
        AgentUser.fromJson(response.data['user'] as Map<String, dynamic>);
    final accessToken = response.data['accessToken'] as String;

    // Verify this is actually a delivery agent — reject other roles
    if (user.role != 'delivery_agent') {
      // Logout immediately so the cookie is cleared
      await _dio.post(ApiConstants.logout);
      throw 'This app is only for delivery agents.';
    }

    // Persist to secure storage for next app launch
    await SecureStorage.saveAccessToken(accessToken);
    await SecureStorage.saveUser(jsonEncode(user.toJson()));

    return (user: user, accessToken: accessToken);
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.logout);
    } catch (_) {
      // Even if the server call fails, we still clear local storage
    } finally {
      await SecureStorage.clearAll();
    }
  }

  // tryRestoreSession: called on app start to check if user is still logged in.
  // We read from secure storage, then make one network call to refresh
  // the access token (the refresh token lives in the HttpOnly cookie).
  Future<({AgentUser user, String accessToken})?> tryRestoreSession() async {
    final userJson = await SecureStorage.readUser();
    if (userJson == null) return null;

    try {
      // Try to get a fresh access token
      final response = await _dio.post(ApiConstants.refresh);
      if (response.statusCode != 200) return null;

      final newToken = response.data['accessToken'] as String;
      await SecureStorage.saveAccessToken(newToken);

      final user =
          AgentUser.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
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
}
