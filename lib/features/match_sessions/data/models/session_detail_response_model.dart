/// Modelo de respuesta de detalle de sesión.
///
/// Modelo que encapsula la respuesta completa del endpoint de detalle de sesión,
/// incluyendo la sesión, el partido y las verificaciones.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/match_session_repository.dart';
import 'available_match_model.dart';
import 'match_session_model.dart';
import 'session_verification_model.dart';

part 'session_detail_response_model.freezed.dart';
part 'session_detail_response_model.g.dart';

@freezed
class SessionDetailResponseModel with _$SessionDetailResponseModel {
  const SessionDetailResponseModel._();

  const factory SessionDetailResponseModel({
    required MatchSessionModel session,
    required AvailableMatchModel match,
    required List<SessionVerificationModel> verifications,
  }) = _SessionDetailResponseModel;

  factory SessionDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailResponseModelFromJson(json);

  /// Convierte el modelo a SessionDetailData del dominio
  SessionDetailData toDetailData() {
    return SessionDetailData(
      session: session.toEntity(),
      match: match.toEntity(),
      verifications: verifications.map((v) => v.toEntity()).toList(),
    );
  }
}
