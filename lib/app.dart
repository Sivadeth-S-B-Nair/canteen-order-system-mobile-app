// lib/app.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';

class DeliveryAgentApp extends ConsumerWidget {
  const DeliveryAgentApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Delivery Agent',
      debugShowCheckedModeBanner: false,
      // Material 3: the new Material Design spec — cleaner defaults.
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      // routerConfig: connects go_router to MaterialApp.
      // MaterialApp.router is required (not MaterialApp) when using go_router.
      routerConfig: router,
    );
  }
}