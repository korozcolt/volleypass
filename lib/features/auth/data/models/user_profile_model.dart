/// Modelo de perfil de usuario (serializable).
///
/// Modelo de datos para serialización JSON del perfil de usuario.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
  }) = _UserProfileModel;

  const UserProfileModel._();

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  /// Convierte el modelo a entity de dominio
  UserProfile toEntity() {
    return UserProfile(
      avatarUrl: avatarUrl,
      phone: phone,
    );
  }

  /// Crea un modelo desde una entity de dominio
  factory UserProfileModel.fromEntity(UserProfile entity) {
    return UserProfileModel(
      avatarUrl: entity.avatarUrl,
      phone: entity.phone,
    );
  }
}
