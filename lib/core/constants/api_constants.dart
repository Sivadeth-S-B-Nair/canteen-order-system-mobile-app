class ApiConstants {
  ApiConstants._(); 

  // Change this to your machine's local IP when testing on a physical device.
  // 'localhost' doesn't work from a phone — localhost on the phone means
  // the phone itself, not your dev machine.
  //
  // Find your IP: run `ipconfig` (Windows) or `ifconfig` (Mac/Linux)
  // Example: static const baseUrl = 'http://192.168.1.42:3000';
  static const baseUrl =
      'http://192.168.0.239:3000'; // 10.0.2.2 = Android emulator → host machine

  static const socketUrl = baseUrl;

  static const login = '/api/auth/login';
  static const logout = '/api/auth/logout';
  static const refresh = '/api/auth/refresh';
  static const forgotPassword = '/api/auth/forgot-password';

  static const myDeliveries = '/api/orders/my-deliveries';

  static String deliveryStatus(int orderId) =>
      '/api/orders/$orderId/delivery-status';
}
