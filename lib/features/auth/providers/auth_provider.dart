// lib/features/auth/providers/auth_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../data/auth_repository.dart';
import '../domain/auth_state.dart';
import '../../../core/network/dio_client.dart';

// [FIX] dioProvider is now a plain Provider again, but its value is supplied
// by an override in main.dart (see main.dart fix). DioClient.create() is
// awaited there — before runApp — so by the time any widget reads this
// provider the Dio instance is already fully built with PersistCookieJar.
//
// We keep a synchronous fallback here only so the analyzer is happy;
// in practice the override in main.dart always wins.
final dioProvider = Provider<Dio>((ref) {
  throw StateError(
    'dioProvider must be overridden in main.dart via ProviderScope overrides.',
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    Future.microtask(_tryRestore);
    return const AuthState.initial();
  }

  Future<void> _tryRestore() async {
    state = const AuthState.loading();
    final repository = ref.read(authRepositoryProvider);
    final session = await repository.tryRestoreSession();
    if (session != null) {
      state = AuthState.authenticated(
        user: session.user,
        accessToken: session.accessToken,
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final session = await repository.login(email: email, password: password);
      state = AuthState.authenticated(
        user: session.user,
        accessToken: session.accessToken,
      );
    } catch (e) {
      state = AuthState.error(e.toString());
      Future.microtask(() {
        if (state is AuthError) {
          state = const AuthState.unauthenticated();
        }
      });
    }
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AuthState.unauthenticated();
  }

  void updateToken(String newToken) {
    if (state case AuthAuthenticated(:final user)) {
      state = AuthState.authenticated(user: user, accessToken: newToken);
    }
  }

  void forceLogout() {
    state = const AuthState.unauthenticated();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

final currentUserProvider = Provider<AgentUser?>((ref) {
  final authState = ref.watch(authProvider);
  return switch (authState) {
    AuthAuthenticated(:final user) => user,
    _ => null,
  };
});