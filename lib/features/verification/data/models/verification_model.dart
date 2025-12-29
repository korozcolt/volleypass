/// Modelo de verificación para serialización JSON.
///
/// Modelo de datos que se mapea con las respuestas del API y se convierte
/// a entidad Verification del dominio.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/verification.dart';

part 'verification_model.freezed.dart';
part 'verification_model.g.dart';

@freezed
class VerificationModel with _$VerificationModel {
  const VerificationModel._();

  const factory VerificationModel({
    required int id,
    required String result,
    @JsonKey(name: 'restriction_reason') String? restrictionReason,
    @JsonKey(name: 'verified_at') required String verifiedAt,
    @JsonKey(name: 'session_id') int? sessionId,
    @Default(false) @JsonKey(name: 'is_offline') bool isOffline,
  }) = _VerificationModel;

  factory VerificationModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio
  Verification toEntity() {
    return Verification(
      id: id,
      result: VerificationResult.fromString(result),
      restrictionReason: restrictionReason,
      verifiedAt: DateTime.parse(verifiedAt),
      sessionId: sessionId,
      isOffline: isOffline,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory VerificationModel.fromEntity(Verification verification) {
    return VerificationModel(
      id: verification.id,
      result: verification.result.toApiString(),
      restrictionReason: verification.restrictionReason,
      verifiedAt: verification.verifiedAt.toIso8601String(),
      sessionId: verification.sessionId,
      isOffline: verification.isOffline,
    );
  }
}
