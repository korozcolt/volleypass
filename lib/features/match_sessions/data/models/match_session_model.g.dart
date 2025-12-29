// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchSessionModelImpl _$$MatchSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchSessionModelImpl(
      id: (json['id'] as num).toInt(),
      matchId: (json['match_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      status: json['status'] as String,
      startedAt: json['started_at'] as String,
      pausedAt: json['paused_at'] as String?,
      completedAt: json['completed_at'] as String?,
      totalVerifications: (json['total_verifications'] as num?)?.toInt() ?? 0,
      homeTeamVerifications:
          (json['home_team_verifications'] as num?)?.toInt() ?? 0,
      awayTeamVerifications:
          (json['away_team_verifications'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MatchSessionModelImplToJson(
        _$MatchSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_id': instance.matchId,
      'user_id': instance.userId,
      'status': instance.status,
      'started_at': instance.startedAt,
      'paused_at': instance.pausedAt,
      'completed_at': instance.completedAt,
      'total_verifications': instance.totalVerifications,
      'home_team_verifications': instance.homeTeamVerifications,
      'away_team_verifications': instance.awayTeamVerifications,
      'notes': instance.notes,
    };
