/// Modelo de usuario (serializable).
///
/// Modelo de datos para serialización JSON del usuario.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import 'user_profile_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @Default([]) List<String> roles,
    @Default([]) List<String> abilities,
    UserProfileModel? profile,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convierte el modelo a entity de dominio
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      firstName: firstName,
      lastName: lastName,
      roles: roles,
      abilities: abilities,
      profile: profile?.toEntity(),
    );
  }

  /// Crea un modelo desde una entity de dominio
  factory UserModel.fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      roles: entity.roles,
      abilities: entity.abilities,
      profile: entity.profile != null
          ? UserProfileModel.fromEntity(entity.profile!)
          : null,
    );
  }
}
