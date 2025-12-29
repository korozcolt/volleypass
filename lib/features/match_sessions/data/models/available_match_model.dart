/// Modelo de partido disponible para serialización JSON.
///
/// Modelo de datos que se mapea con las respuestas del API y se convierte
/// a entidad AvailableMatch del dominio.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/available_match.dart';

part 'available_match_model.freezed.dart';
part 'available_match_model.g.dart';

@freezed
class AvailableMatchModel with _$AvailableMatchModel {
  const AvailableMatchModel._();

  const factory AvailableMatchModel({
    required int id,
    @JsonKey(name: 'home_team') required String homeTeam,
    @JsonKey(name: 'away_team') required String awayTeam,
    @JsonKey(name: 'scheduled_at') required String scheduledAt,
    required String venue,
    @JsonKey(name: 'tournament_name') required String tournamentName,
    @JsonKey(name: 'tournament_logo') String? tournamentLogo,
    required String status,
  }) = _AvailableMatchModel;

  factory AvailableMatchModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableMatchModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio
  AvailableMatch toEntity() {
    return AvailableMatch(
      id: id,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      scheduledAt: DateTime.parse(scheduledAt),
      venue: venue,
      tournamentName: tournamentName,
      tournamentLogo: tournamentLogo,
      status: status,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory AvailableMatchModel.fromEntity(AvailableMatch match) {
    return AvailableMatchModel(
      id: match.id,
      homeTeam: match.homeTeam,
      awayTeam: match.awayTeam,
      scheduledAt: match.scheduledAt.toIso8601String(),
      venue: match.venue,
      tournamentName: match.tournamentName,
      tournamentLogo: match.tournamentLogo,
      status: match.status,
    );
  }
}
