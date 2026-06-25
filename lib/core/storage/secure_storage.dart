// lib/core/storage/secure_storage.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _keyAccessToken = 'access_token';
  static const _keyUser = 'user_json';

  static Future<void> saveAccessToken(String token) =>
      _storage.write(key: _keyAccessToken, value: token);

  static Future<String?> readAccessToken() =>
      _storage.read(key: _keyAccessToken);

  static Future<void> saveUser(String userJson) =>
      _storage.write(key: _keyUser, value: userJson);

  static Future<String?> readUser() => _storage.read(key: _keyUser);

  // [FIX] clearAll() now only clears the secure-storage keys owned by this
  // app (access token + user JSON). Cookie deletion is handled separately
  // in AuthRepository.logout() via the PersistCookieJar, because SecureStorage
  // has no knowledge of the cookie jar.
  //
  // Previously calling _storage.deleteAll() was safe because cookies were
  // in-memory (no disk footprint). Now that we use PersistCookieJar we must
  // explicitly delete the cookie directory on logout — see auth_repository.dart.
  static Future<void> clearAll() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyUser);
  }
}