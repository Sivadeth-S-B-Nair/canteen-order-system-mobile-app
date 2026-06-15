
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import '../constants/api_constants.dart';
import 'auth_interceptor.dart';

// A singleton Dio instance shared across the whole app.
// In Riverpod we'll wrap this in a Provider so it's properly scoped.
class DioClient {
  DioClient._(); // private constructor

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        // This ensures the refreshToken cookie is sent automatically.
        extra: {'withCredentials': true},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        // By default Dio throws on non-2xx. We want to handle 401 ourselves.
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // CookieJar stores cookies in memory.
    // PersistCookieJar (from cookie_jar) stores them on disk — but for
    // HttpOnly cookies set by the server, the platform's HTTP layer
    // handles them automatically on Android/iOS.
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // Add our auth interceptor AFTER the cookie manager.
    // Order matters: cookie is set first, then token attached.
    dio.interceptors.add(AuthInterceptor(dio));

    // LogInterceptor is helpful during development — logs every request/response.
    // Remove in production.
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print('[Dio] $obj'), // replace with proper logger in prod
      ),
    );

    return dio;
  }
}