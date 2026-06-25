import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/constants/api_constants.dart';

class SocketService {
  IO.Socket? _socket;

  // Pending listeners registered before connect() was called.
  // Each entry is (eventName, handler). Replayed once the socket is live.
  // EventHandler<dynamic> is exactly void Function(dynamic) in socket_io_client.
  final List<({String event, void Function(dynamic) handler})> _pendingListeners = [];

  void connect(String accessToken) {
    if (_socket?.connected == true) return;

    // Disconnect any stale socket from a previous session.
    _socket?.disconnect();

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
      ..onConnect((_) {
        print("[Socket] Connected: ${_socket!.id}");
        // Replay any listeners that were registered before connect() was called.
        for (final entry in _pendingListeners) {
          _socket!.on(entry.event, entry.handler);
        }
        _pendingListeners.clear();
      })
      ..onDisconnect((reason) => print("[Socket] Disconnected: $reason"))
      ..onConnectError((err) => print("[Socket] Error: $err"))
      ..connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
    _pendingListeners.clear();
  }

  // ── Private helper ─────────────────────────────────────────────────────────
  // Attaches a listener immediately if the socket exists, otherwise queues it
  // so it is registered as soon as connect() establishes the connection.
  void _on(String event, void Function(dynamic) handler) {
    if (_socket != null) {
      _socket!.on(event, handler);
    } else {
      // Socket not created yet (listeners registered before connect()).
      _pendingListeners.add((event: event, handler: handler));
    }
  }

  // ── Emitters ───────────────────────────────────────────────────────────────

  void emitLocationUpdate({
    required double latitude,
    required double longitude,
    required int orderId,
  }) {
    if (_socket?.connected != true) {
      print("[Socket] emitLocationUpdate skipped — not connected");
      return;
    }
    _socket!.emit("location-update", {
      // Send as numbers, not strings, to match what the server expects.
      "latitude": latitude,
      "longitude": longitude,
      "orderId": orderId,
    });
  }

  // ── Listeners ──────────────────────────────────────────────────────────────

  void onNewDelivery(void Function(Map<String, dynamic> order) handler) {
    _on("new-delivery", (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void onDeliveryDwell(void Function(Map<String, dynamic> data) handler) {
    _on('delivery-dwell', (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void onOrderUpdated(void Function(Map<String, dynamic> order) handler) {
    _on("order-updated", (data) {
      if (data is Map) handler(Map<String, dynamic>.from(data));
    });
  }

  void offAll() {
    _socket?.clearListeners();
  }

  bool get isConnected => _socket?.connected ?? false;
}