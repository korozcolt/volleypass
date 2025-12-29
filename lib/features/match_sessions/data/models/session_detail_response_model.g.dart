// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionDetailResponseModelImpl _$$SessionDetailResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionDetailResponseModelImpl(
      session:
          MatchSessionModel.fromJson(json['session'] as Map<String, dynamic>),
      match:
          AvailableMatchModel.fromJson(json['match'] as Map<String, dynamic>),
      verifications: (json['verifications'] as List<dynamic>)
          .map((e) =>
              SessionVerificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionDetailResponseModelImplToJson(
        _$SessionDetailResponseModelImpl instance) =>
    <String, dynamic>{
      'session': instance.session,
      'match': instance.match,
      'verifications': instance.verifications,
    };
