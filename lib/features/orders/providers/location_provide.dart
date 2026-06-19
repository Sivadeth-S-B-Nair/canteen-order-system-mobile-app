import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../orders/providers/orders_provider.dart';
import '../../../shared/socket/socket_service.dart';

class LocationState {
  final bool isTracking;
  final Position? lastPosition;
  final String? error;
  final int pingCount;

  const LocationState({
    this.isTracking=false,
    this.lastPosition,
    this.error,
    this.pingCount= 0
  });

  LocationState copyWith({
    bool? isTracking,
    Position? lastPosition,
    String? error,
    int? pingCount
  })=>LocationState(
    isTracking: isTracking ?? this.isTracking,
    lastPosition: lastPosition ?? this.lastPosition,
    error: error ?? this.error,
    pingCount: pingCount ?? this.pingCount
  );
}

class LocationNotifier extends StateNotifier<LocationState>{
  final SocketService _socket;

  StreamSubscription<Position>? _positionStream;

  LocationNotifier(this._socket) : super(const LocationState());

  Future<bool> requestPermissions() async{
    var status=await Permission.locationWhenInUse.request();
    if(!status.isGranted){
      state=state.copyWith(
        error: "Location permission denied. Please enable in settings"
      );
      return false;
    }

    status=await Permission.locationAlways.request();
    if(!status.isGranted){
      state=state.copyWith(
        error: "Background location  required for tracking during delivery"
      );
      return false;
    }

    return true;
  }

  Future<void> startTracking(int orderId) async{
    if(state.isTracking) return;

    final hasPermission=await requestPermissions();

    if(!hasPermission) return;

    state=state.copyWith(isTracking: true,error: null,pingCount: 0);

    const locationSettings=LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, //metre
    );

    _positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings
    ).listen(
      (position)=>_onPositionUpdate(position,orderId),
      onError: _onPositionError
    );
  }

  void _onPositionUpdate(Position position,int orderId){
    state=state.copyWith(
      lastPosition: position,
      pingCount: state.pingCount + 1
    );

    _socket.emitLocationUpdate(latitude: position.latitude, longitude: position.longitude, orderId: orderId);
  }

  void _onPositionError(Object error){
    final message=switch(error){
      LocationServiceDisabledException()=>
        "GPS is disabled. Please enable location services.",
      PermissionDeniedException()=>
        "Location permission denied.",
      _=>"GPS error: ${error.toString()}"
    };
    state=state.copyWith(error: message);
  }

  void stopTracking(){
    _positionStream?.cancel();
    _positionStream=null;
    state=state.copyWith(
      isTracking: false,
      lastPosition: null,
      pingCount: 0
    );
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}

final locationProvider=
  StateNotifierProvider<LocationNotifier,LocationState>((ref){
  final socket=ref.watch(socketServiceProvider);
  return LocationNotifier(socket);
});