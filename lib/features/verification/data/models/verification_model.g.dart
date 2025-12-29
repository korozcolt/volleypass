// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationModelImpl _$$VerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationModelImpl(
      id: (json['id'] as num).toInt(),
      result: json['result'] as String,
      restrictionReason: json['restriction_reason'] as String?,
      verifiedAt: json['verified_at'] as String,
      sessionId: (json['session_id'] as num?)?.toInt(),
      isOffline: json['is_offline'] as bool? ?? false,
    );

Map<String, dynamic> _$$VerificationModelImplToJson(
        _$VerificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
      'restriction_reason': instance.restrictionReason,
      'verified_at': instance.verifiedAt,
      'session_id': instance.sessionId,
      'is_offline': instance.isOffline,
    };
