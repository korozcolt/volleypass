// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StandingModelImpl _$$StandingModelImplFromJson(Map<String, dynamic> json) =>
    _$StandingModelImpl(
      position: (json['position'] as num).toInt(),
      teamId: (json['team_id'] as num).toInt(),
      teamName: json['team_name'] as String,
      teamLogo: json['team_logo'] as String?,
      matchesPlayed: (json['matches_played'] as num).toInt(),
      wins: (json['wins'] as num).toInt(),
      losses: (json['losses'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      setsFor: (json['sets_for'] as num).toInt(),
      setsAgainst: (json['sets_against'] as num).toInt(),
      setDifference: (json['set_difference'] as num).toInt(),
      pointsFor: (json['points_for'] as num).toInt(),
      pointsAgainst: (json['points_against'] as num).toInt(),
    );

Map<String, dynamic> _$$StandingModelImplToJson(_$StandingModelImpl instance) =>
    <String, dynamic>{
      'position': instance.position,
      'team_id': instance.teamId,
      'team_name': instance.teamName,
      'team_logo': instance.teamLogo,
      'matches_played': instance.matchesPlayed,
      'wins': instance.wins,
      'losses': instance.losses,
      'points': instance.points,
      'sets_for': instance.setsFor,
      'sets_against': instance.setsAgainst,
      'set_difference': instance.setDifference,
      'points_for': instance.pointsFor,
      'points_against': instance.pointsAgainst,
    };

_$StandingsResponseModelImpl _$$StandingsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StandingsResponseModelImpl(
      tournament: TournamentInfoModel.fromJson(
          json['tournament'] as Map<String, dynamic>),
      standings: (json['standings'] as List<dynamic>)
          .map((e) => StandingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$StandingsResponseModelImplToJson(
        _$StandingsResponseModelImpl instance) =>
    <String, dynamic>{
      'tournament': instance.tournament,
      'standings': instance.standings,
      'updated_at': instance.updatedAt,
    };

_$TournamentInfoModelImpl _$$TournamentInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentInfoModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TournamentInfoModelImplToJson(
        _$TournamentInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
