/// Model de Detalle de Torneo con Freezed.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tournament_detail.dart';

part 'tournament_detail_model.freezed.dart';
part 'tournament_detail_model.g.dart';

@freezed
class TournamentDetailModel with _$TournamentDetailModel {
  const TournamentDetailModel._();

  const factory TournamentDetailModel({
    required int id,
    required String name,
    required String slug,
    required String type,
    required String status,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    required TournamentLeagueModel league,
    required List<TournamentTeamModel> teams,
    required List<TournamentMatchModel> matches,
    required TournamentStatisticsModel statistics,
  }) = _TournamentDetailModel;

  factory TournamentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentDetailModelFromJson(json);

  TournamentDetail toEntity() {
    return TournamentDetail(
      id: id,
      name: name,
      slug: slug,
      type: type,
      status: status,
      startDate: DateTime.parse(startDate),
      endDate: endDate != null ? DateTime.parse(endDate!) : null,
      league: league.toEntity(),
      teams: teams.map((t) => t.toEntity()).toList(),
      matches: matches.map((m) => m.toEntity()).toList(),
      statistics: statistics.toEntity(),
    );
  }
}

@freezed
class TournamentLeagueModel with _$TournamentLeagueModel {
  const TournamentLeagueModel._();

  const factory TournamentLeagueModel({
    required int id,
    required String name,
    @JsonKey(name: 'logo_url') String? logoUrl,
  }) = _TournamentLeagueModel;

  factory TournamentLeagueModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentLeagueModelFromJson(json);

  TournamentLeague toEntity() {
    return TournamentLeague(
      id: id,
      name: name,
      logoUrl: logoUrl,
    );
  }
}

@freezed
class TournamentTeamModel with _$TournamentTeamModel {
  const TournamentTeamModel._();

  const factory TournamentTeamModel({
    required int id,
    required String name,
    String? logo,
    required String club,
  }) = _TournamentTeamModel;

  factory TournamentTeamModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentTeamModelFromJson(json);

  TournamentTeam toEntity() {
    return TournamentTeam(
      id: id,
      name: name,
      logo: logo,
      club: club,
    );
  }
}

@freezed
class TournamentMatchModel with _$TournamentMatchModel {
  const TournamentMatchModel._();

  const factory TournamentMatchModel({
    required int id,
    @JsonKey(name: 'home_team') required String homeTeam,
    @JsonKey(name: 'away_team') required String awayTeam,
    @JsonKey(name: 'scheduled_at') required String scheduledAt,
    required String status,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    String? venue,
  }) = _TournamentMatchModel;

  factory TournamentMatchModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentMatchModelFromJson(json);

  TournamentMatch toEntity() {
    return TournamentMatch(
      id: id,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      scheduledAt: DateTime.parse(scheduledAt),
      status: status,
      homeScore: homeScore,
      awayScore: awayScore,
      venue: venue,
    );
  }
}

@freezed
class TournamentStatisticsModel with _$TournamentStatisticsModel {
  const TournamentStatisticsModel._();

  const factory TournamentStatisticsModel({
    @JsonKey(name: 'total_teams') required int totalTeams,
    @JsonKey(name: 'total_matches') required int totalMatches,
    @JsonKey(name: 'completed_matches') required int completedMatches,
    @JsonKey(name: 'pending_matches') required int pendingMatches,
    @JsonKey(name: 'in_progress_matches') required int inProgressMatches,
  }) = _TournamentStatisticsModel;

  factory TournamentStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentStatisticsModelFromJson(json);

  TournamentStatistics toEntity() {
    return TournamentStatistics(
      totalTeams: totalTeams,
      totalMatches: totalMatches,
      completedMatches: completedMatches,
      pendingMatches: pendingMatches,
      inProgressMatches: inProgressMatches,
    );
  }
}
