/// Modelo de respuesta de verificación.
///
/// Modelo que encapsula la respuesta completa del endpoint de verificación,
/// incluyendo la verificación y los datos del jugador.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/verification_repository.dart';
import 'player_model.dart';
import 'verification_model.dart';

part 'verification_response_model.freezed.dart';
part 'verification_response_model.g.dart';

@freezed
class VerificationResponseModel with _$VerificationResponseModel {
  const VerificationResponseModel._();

  const factory VerificationResponseModel({
    required bool success,
    required VerificationModel verification,
    required PlayerModel player,
  }) = _VerificationResponseModel;

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseModelFromJson(json);

  /// Convierte el modelo a VerificationResultData del dominio
  VerificationResultData toResultData() {
    return VerificationResultData(
      verification: verification.toEntity(),
      player: player.toEntity(),
    );
  }
}
