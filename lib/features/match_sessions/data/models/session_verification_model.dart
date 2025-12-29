/// Modelo de verificación de sesión para serialización JSON.
///
/// Modelo de datos que se mapea con las respuestas del API y se convierte
/// a entidad SessionVerification del dominio.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/session_verification.dart';

part 'session_verification_model.freezed.dart';
part 'session_verification_model.g.dart';

@freezed
class SessionVerificationModel with _$SessionVerificationModel {
  const SessionVerificationModel._();

  const factory SessionVerificationModel({
    required int id,
    @JsonKey(name: 'session_id') required int sessionId,
    @JsonKey(name: 'player_name') required String playerName,
    @JsonKey(name: 'card_number') required String cardNumber,
    required String team,
    required String result,
    @JsonKey(name: 'verified_at') required String verifiedAt,
    @JsonKey(name: 'restriction_reason') String? restrictionReason,
  }) = _SessionVerificationModel;

  factory SessionVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$SessionVerificationModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio
  SessionVerification toEntity() {
    return SessionVerification(
      id: id,
      sessionId: sessionId,
      playerName: playerName,
      cardNumber: cardNumber,
      team: team,
      result: result,
      verifiedAt: DateTime.parse(verifiedAt),
      restrictionReason: restrictionReason,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory SessionVerificationModel.fromEntity(SessionVerification verification) {
    return SessionVerificationModel(
      id: verification.id,
      sessionId: verification.sessionId,
      playerName: verification.playerName,
      cardNumber: verification.cardNumber,
      team: verification.team,
      result: verification.result,
      verifiedAt: verification.verifiedAt.toIso8601String(),
      restrictionReason: verification.restrictionReason,
    );
  }
}
