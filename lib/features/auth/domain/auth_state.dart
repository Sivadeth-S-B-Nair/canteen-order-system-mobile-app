import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
abstract class AgentUser with _$AgentUser {
  const factory AgentUser({
    required int id,
    required String name,
    required String email,
    required String role,
    int? restaurantId,
  }) = _AgentUser;

  factory AgentUser.fromJson(Map<String, dynamic> json) =>
      _$AgentUserFromJson(json);
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({
    required AgentUser user,
    required String accessToken,
  }) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(String message) = AuthError;
}
