import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../shared/socket/socket_service.dart';
import '../../orders/providers/orders_provider.dart';

class LocationState {
  final bool isTracking;
  final Position? lastPosition;
  final String? error;
  final int pingCount;

  const LocationState({
    this.isTracking = false,
    this.lastPosition,  
    this.error,
    this.pingCount = 0,
  });

  LocationState copyWith({
    bool? isTracking,
    Position? lastPosition,
    bool clearError = false,
    String? error,
    int? pingCount,
  }) => LocationState(
    isTracking: isTracking ?? this.isTracking,
    lastPosition: lastPosition ?? this.lastPosition,
    error: clearError ? null : (error ?? this.error),
    pingCount: pingCount ?? this.pingCount,
  );
}

class LocationNotifier extends Notifier<LocationState> {
  StreamSubscription<Position>? _positionStream;

  @override
  LocationState build() {
    ref.onDispose(() {
      _positionStream?.cancel();
    });
    return const LocationState();
  }

  // SocketService get _socket => ref.read(socketServiceProvider);

  Future<bool> requestPermissions() async {
    var status = await Permission.locationWhenInUse.request();
    if (!status.isGranted) {
      state = state.copyWith(
        error: 'Location permission denied. Please enable in settings.',
      );
      return false;
    }

    status = await Permission.locationAlways.request();
    if (!status.isGranted) {
      state = state.copyWith(
        error: 'Background location required for tracking during delivery.',
      );
      return false;
    }

    return true;
  }

  Future<void> startTracking(int orderId) async {
    if (state.isTracking) return;

    final hasPermission = await requestPermissions();
    if (!hasPermission) return;

    state = state.copyWith(isTracking: true,clearError: true, pingCount: 0);

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    final socket = ref.read(socketServiceProvider);

    _positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(
      (position) => _onPositionUpdate(position, orderId, socket),
      onError: _onPositionError,
    );
  }

  // [CHANGE] SocketService is now passed as a parameter rather than stored
  // as a constructor-injected field, since Notifier has no constructor.
  void _onPositionUpdate(Position position, int orderId, SocketService socket) {
    state = state.copyWith(
      lastPosition: position,
      pingCount: state.pingCount + 1,
    );

    socket.emitLocationUpdate(
      latitude: position.latitude,
      longitude: position.longitude,
      orderId: orderId,
    );
  }

  void _onPositionError(Object error) {
    final message = switch (error) {
      LocationServiceDisabledException() =>
          'GPS is disabled. Please enable location services.',
      PermissionDeniedException() =>
          'Location permission denied.',
      _ => 'GPS error: ${error.toString()}',
    };
    state = state.copyWith(error: message);
  }

  void stopTracking() {
    _positionStream?.cancel();
    _positionStream = null;
    state = state.copyWith(
      isTracking: false,
      clearError: true,
      lastPosition: null,
      pingCount: 0,
    );
  }
}

final locationProvider = NotifierProvider<LocationNotifier, LocationState>(
  LocationNotifier.new,
);