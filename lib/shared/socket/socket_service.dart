import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/constants/api_constants.dart';

class SocketService {
  IO.Socket? _socket;

  void connect(String accessToken) {
    if (_socket?.connected == true) return;

    _socket = IO.io(
      ApiConstants.socketUrl,
      IO.OptionBuilder()
          .setTransports(["websocket"])
          .disableAutoConnect()
          .setAuth({"token": accessToken})
          .setReconnectionAttempts(5)
          .setReconnectionDelay(1000)
          .build(),
    );

    _socket!
      ..onConnect((_) => print("[Socket] Connected: ${_socket!.id}"))
      ..onDisconnect((reason) => print("[Socket] Disconnected: $reason"))
      ..onConnectError((err) => print("[Socket] Error: $err"))
      ..connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

  void emitLocationUpdate({
    required double latitude,
    required double longitude,
    required int orderId,
  }) {
    _socket?.emit("location-update", {
      "latitude": latitude,
      "longitude": longitude,
      "orderId": orderId,
    });
  }

  void onNewDelivery(void Function(Map<String, dynamic> order) handler) {
    _socket?.on("new-delivery", (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void onDeliveryDwell(void Function(Map<String, dynamic> data) handler) {
    _socket?.on('delivery-dwell', (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void onOrderUpdated(void Function(Map<String, dynamic> order) handler) {
    _socket?.on("order-updated", (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void offAll() {
    _socket?.clearListeners();
  }

  bool get isConnected => _socket?.connected ?? false;
}
