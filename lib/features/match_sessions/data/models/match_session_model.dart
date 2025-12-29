/// Modelo de sesión de partido para serialización JSON.
///
/// Modelo de datos que se mapea con las respuestas del API y se convierte
/// a entidad MatchSession del dominio.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/match_session.dart';

part 'match_session_model.freezed.dart';
part 'match_session_model.g.dart';

@freezed
class MatchSessionModel with _$MatchSessionModel {
  const MatchSessionModel._();

  const factory MatchSessionModel({
    required int id,
    @JsonKey(name: 'match_id') required int matchId,
    @JsonKey(name: 'user_id') required int userId,
    required String status,
    @JsonKey(name: 'started_at') required String startedAt,
    @JsonKey(name: 'paused_at') String? pausedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'total_verifications') @Default(0) int totalVerifications,
    @JsonKey(name: 'home_team_verifications') @Default(0) int homeTeamVerifications,
    @JsonKey(name: 'away_team_verifications') @Default(0) int awayTeamVerifications,
    String? notes,
  }) = _MatchSessionModel;

  factory MatchSessionModel.fromJson(Map<String, dynamic> json) =>
      _$MatchSessionModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio
  MatchSession toEntity() {
    return MatchSession(
      id: id,
      matchId: matchId,
      userId: userId,
      status: status,
      startedAt: DateTime.parse(startedAt),
      pausedAt: pausedAt != null ? DateTime.parse(pausedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      totalVerifications: totalVerifications,
      homeTeamVerifications: homeTeamVerifications,
      awayTeamVerifications: awayTeamVerifications,
      notes: notes,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory MatchSessionModel.fromEntity(MatchSession session) {
    return MatchSessionModel(
      id: session.id,
      matchId: session.matchId,
      userId: session.userId,
      status: session.status,
      startedAt: session.startedAt.toIso8601String(),
      pausedAt: session.pausedAt?.toIso8601String(),
      completedAt: session.completedAt?.toIso8601String(),
      totalVerifications: session.totalVerifications,
      homeTeamVerifications: session.homeTeamVerifications,
      awayTeamVerifications: session.awayTeamVerifications,
      notes: session.notes,
    );
  }
}
