/// Estado de autenticación.
///
/// Define todos los posibles estados de la autenticación usando Freezed unions.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  /// Estado inicial (app recién abierta)
  const factory AuthState.initial() = _Initial;

  /// Cargando (procesando operación)
  const factory AuthState.loading() = _Loading;

  /// Autenticado (usuario logueado)
  const factory AuthState.authenticated(User user) = _Authenticated;

  /// No autenticado (sin sesión)
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Error (operación falló)
  const factory AuthState.error(String message) = _Error;
}
