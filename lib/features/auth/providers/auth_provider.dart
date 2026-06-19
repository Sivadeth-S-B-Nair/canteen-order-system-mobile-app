import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../data/auth_repository.dart';
import '../domain/auth_state.dart';
import '../../../core/network/dio_client.dart';

final dioProvider = Provider<Dio>((ref) => DioClient.create());

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
