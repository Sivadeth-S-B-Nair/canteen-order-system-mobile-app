// lib/core/network/dio_client.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/api_constants.dart';
import 'auth_interceptor.dart';

class DioClient {
  DioClient._();

  // [FIX] create() is now async because PersistCookieJar needs a file-system
  // path (obtained via path_provider) before it can be constructed.
  // Call DioClient.create() once at app startup and cache the result in the
  // Riverpod dioProvider — do NOT call it on every request.
  static Future<Dio> create() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        extra: {'withCredentials': true},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        // Accept all status codes so both onResponse (for 4xx) and
        // onError (for network failures) are reachable in AuthInterceptor.
        validateStatus: (status) => status != null && status < 600,
      ),
    );

    // [FIX] PersistCookieJar writes cookies to disk so they survive app
    // restarts. The previous CookieJar() was in-memory only — the
    // refreshToken HttpOnly cookie set by the server on login was lost
    // every time the app process was killed, making auto-login impossible.
    //
    // We use the app's support directory (not temp) so the OS does not
    // evict the cookies under storage pressure.
    final appDir = await getApplicationSupportDirectory();
    final cookieDir = Directory('${appDir.path}/cookies');
    if (!cookieDir.existsSync()) {
      cookieDir.createSync(recursive: true);
    }
    final cookieJar = PersistCookieJar(
      storage: FileStorage(cookieDir.path),
      ignoreExpires: false, // respect cookie Max-Age / Expires
    );

    dio.interceptors.add(CookieManager(cookieJar));

    // AuthInterceptor must come AFTER CookieManager.
    dio.interceptors.add(AuthInterceptor(dio));

    // Remove LogInterceptor in production.
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print('[Dio] $obj'),
      ),
    );

    return dio;
  }
}