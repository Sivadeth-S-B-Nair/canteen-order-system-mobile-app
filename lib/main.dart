// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized() must be called before
  // any plugin (like secure_storage or geolocator) is initialized.
  // It sets up the Flutter engine's binding to the native platform.
  WidgetsFlutterBinding.ensureInitialized();

  // ProviderScope: wraps the entire app so all Riverpod providers are
  // accessible anywhere in the widget tree. Without this, reading any
  // provider would throw an error.
  runApp(const ProviderScope(child: DeliveryAgentApp()));
}