// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableMatchModelImpl _$$AvailableMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableMatchModelImpl(
      id: (json['id'] as num).toInt(),
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      scheduledAt: json['scheduled_at'] as String,
      venue: json['venue'] as String,
      tournamentName: json['tournament_name'] as String,
      tournamentLogo: json['tournament_logo'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AvailableMatchModelImplToJson(
        _$AvailableMatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'scheduled_at': instance.scheduledAt,
      'venue': instance.venue,
      'tournament_name': instance.tournamentName,
      'tournament_logo': instance.tournamentLogo,
      'status': instance.status,
    };
