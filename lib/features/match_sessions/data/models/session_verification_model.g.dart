// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionVerificationModelImpl _$$SessionVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionVerificationModelImpl(
      id: (json['id'] as num).toInt(),
      sessionId: (json['session_id'] as num).toInt(),
      playerName: json['player_name'] as String,
      cardNumber: json['card_number'] as String,
      team: json['team'] as String,
      result: json['result'] as String,
      verifiedAt: json['verified_at'] as String,
      restrictionReason: json['restriction_reason'] as String?,
    );

Map<String, dynamic> _$$SessionVerificationModelImplToJson(
        _$SessionVerificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'player_name': instance.playerName,
      'card_number': instance.cardNumber,
      'team': instance.team,
      'result': instance.result,
      'verified_at': instance.verifiedAt,
      'restriction_reason': instance.restrictionReason,
    };
