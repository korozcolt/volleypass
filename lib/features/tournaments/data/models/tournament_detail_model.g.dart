// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TournamentDetailModelImpl _$$TournamentDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentDetailModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      league: TournamentLeagueModel.fromJson(
          json['league'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => TournamentTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      matches: (json['matches'] as List<dynamic>)
          .map((e) => TournamentMatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistics: TournamentStatisticsModel.fromJson(
          json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TournamentDetailModelImplToJson(
        _$TournamentDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'league': instance.league,
      'teams': instance.teams,
      'matches': instance.matches,
      'statistics': instance.statistics,
    };

_$TournamentLeagueModelImpl _$$TournamentLeagueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentLeagueModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String?,
    );

Map<String, dynamic> _$$TournamentLeagueModelImplToJson(
        _$TournamentLeagueModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
    };

_$TournamentTeamModelImpl _$$TournamentTeamModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentTeamModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logo: json['logo'] as String?,
      club: json['club'] as String,
    );

Map<String, dynamic> _$$TournamentTeamModelImplToJson(
        _$TournamentTeamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'club': instance.club,
    };

_$TournamentMatchModelImpl _$$TournamentMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentMatchModelImpl(
      id: (json['id'] as num).toInt(),
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      scheduledAt: json['scheduled_at'] as String,
      status: json['status'] as String,
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      venue: json['venue'] as String?,
    );

Map<String, dynamic> _$$TournamentMatchModelImplToJson(
        _$TournamentMatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'scheduled_at': instance.scheduledAt,
      'status': instance.status,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'venue': instance.venue,
    };

_$TournamentStatisticsModelImpl _$$TournamentStatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentStatisticsModelImpl(
      totalTeams: (json['total_teams'] as num).toInt(),
      totalMatches: (json['total_matches'] as num).toInt(),
      completedMatches: (json['completed_matches'] as num).toInt(),
      pendingMatches: (json['pending_matches'] as num).toInt(),
      inProgressMatches: (json['in_progress_matches'] as num).toInt(),
    );

Map<String, dynamic> _$$TournamentStatisticsModelImplToJson(
        _$TournamentStatisticsModelImpl instance) =>
    <String, dynamic>{
      'total_teams': instance.totalTeams,
      'total_matches': instance.totalMatches,
      'completed_matches': instance.completedMatches,
      'pending_matches': instance.pendingMatches,
      'in_progress_matches': instance.inProgressMatches,
    };
