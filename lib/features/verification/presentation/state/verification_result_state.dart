/// Estados del resultado de verificación.
///
/// Define los estados de la pantalla de resultados de verificación.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/verification.dart';

part 'verification_result_state.freezed.dart';

@freezed
class VerificationResultState with _$VerificationResultState {
  /// Cargando resultado
  const factory VerificationResultState.loading() = _Loading;

  /// Resultado cargado
  const factory VerificationResultState.loaded({
    required Verification verification,
    required Player player,
  }) = _Loaded;

  /// Error al cargar resultado
  const factory VerificationResultState.error({
    required String message,
  }) = _Error;
}
