// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      id: (json['id'] as num).toInt(),
      cardNumber: json['card_number'] as String,
      fullName: json['full_name'] as String,
      photoUrl: json['photo_url'] as String?,
      birthDate: json['birth_date'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      position: json['position'] as String,
      category: json['category'] as String,
      clubName: json['club_name'] as String,
      isActive: json['is_active'] as bool,
      licenseNumber: json['license_number'] as String,
      bloodType: json['blood_type'] as String?,
      emergencyContact: json['emergency_contact'] as String?,
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_number': instance.cardNumber,
      'full_name': instance.fullName,
      'photo_url': instance.photoUrl,
      'birth_date': instance.birthDate,
      'age': instance.age,
      'gender': instance.gender,
      'position': instance.position,
      'category': instance.category,
      'club_name': instance.clubName,
      'is_active': instance.isActive,
      'license_number': instance.licenseNumber,
      'blood_type': instance.bloodType,
      'emergency_contact': instance.emergencyContact,
    };
