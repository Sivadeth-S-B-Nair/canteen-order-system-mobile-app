// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/network/dio_client.dart';
import 'features/auth/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final dio = await DioClient.create();

  runApp(
    ProviderScope(
      overrides: [
        dioProvider.overrideWithValue(dio),
      ],
      child: const DeliveryAgentApp(),
    ),
  );
}