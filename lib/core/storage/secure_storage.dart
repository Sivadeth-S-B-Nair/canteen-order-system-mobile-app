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

  static Future<void> clearAll() => _storage.deleteAll();
}
