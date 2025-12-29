/// Estados del detalle de sesión activa.
///
/// Define todos los posibles estados de la pantalla de sesión activa/detalle.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/available_match.dart';
import '../../domain/entities/match_session.dart';
import '../../domain/entities/session_verification.dart';

part 'session_detail_state.freezed.dart';

@freezed
class SessionDetailState with _$SessionDetailState {
  /// Estado inicial
  const factory SessionDetailState.initial() = _Initial;

  /// Cargando sesión activa
  const factory SessionDetailState.loadingActive() = _LoadingActive;

  /// No hay sesión activa
  const factory SessionDetailState.noActiveSession() = _NoActiveSession;

  /// Sesión activa cargada
  const factory SessionDetailState.loaded({
    required MatchSession session,
    required AvailableMatch match,
    required List<SessionVerification> verifications,
  }) = _Loaded;

  /// Error al cargar sesión
  const factory SessionDetailState.error({
    required String message,
  }) = _Error;

  /// Actualizando sesión (pause/resume)
  const factory SessionDetailState.updating({
    required MatchSession session,
    required AvailableMatch match,
    required List<SessionVerification> verifications,
  }) = _Updating;

  /// Completando sesión
  const factory SessionDetailState.completing({
    required MatchSession session,
    required AvailableMatch match,
    required List<SessionVerification> verifications,
  }) = _Completing;

  /// Sesión completada
  const factory SessionDetailState.completed() = _Completed;
}
