// Em um novo ficheiro: lib/presentation/providers/auth/auth_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user/profile.dart';
part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  // Estado inicial, antes de qualquer verificação.
  const factory AuthState.initial() = _AuthInitial;
  // A verificar tokens ou a meio de um pedido de login.
  const factory AuthState.loading() = _AuthLoading;
  // O utilizador está autenticado e temos os seus dados de perfil.
  const factory AuthState.authenticated(Profile profile) = _AuthAuthenticated;
  // O utilizador não está autenticado (ou o token expirou).
  const factory AuthState.unauthenticated() = _AuthUnauthenticated;
  const factory AuthState.failure(String message) = _AuthFailure;
}