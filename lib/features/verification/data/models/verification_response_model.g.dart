// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationResponseModelImpl _$$VerificationResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationResponseModelImpl(
      success: json['success'] as bool,
      verification: VerificationModel.fromJson(
          json['verification'] as Map<String, dynamic>),
      player: PlayerModel.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerificationResponseModelImplToJson(
        _$VerificationResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'verification': instance.verification,
      'player': instance.player,
    };
