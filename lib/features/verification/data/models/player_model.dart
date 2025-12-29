/// Modelo de jugador para serialización JSON.
///
/// Modelo de datos que se mapea con las respuestas del API y se convierte
/// a entidad Player del dominio.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/player.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const PlayerModel._();

  const factory PlayerModel({
    required int id,
    @JsonKey(name: 'card_number') required String cardNumber,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'birth_date') required String birthDate,
    required int age,
    required String gender,
    required String position,
    required String category,
    @JsonKey(name: 'club_name') required String clubName,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'license_number') required String licenseNumber,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'emergency_contact') String? emergencyContact,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio
  Player toEntity() {
    return Player(
      id: id,
      cardNumber: cardNumber,
      fullName: fullName,
      photoUrl: photoUrl,
      birthDate: birthDate,
      age: age,
      gender: gender,
      position: position,
      category: category,
      clubName: clubName,
      isActive: isActive,
      licenseNumber: licenseNumber,
      bloodType: bloodType,
      emergencyContact: emergencyContact,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory PlayerModel.fromEntity(Player player) {
    return PlayerModel(
      id: player.id,
      cardNumber: player.cardNumber,
      fullName: player.fullName,
      photoUrl: player.photoUrl,
      birthDate: player.birthDate,
      age: player.age,
      gender: player.gender,
      position: player.position,
      category: player.category,
      clubName: player.clubName,
      isActive: player.isActive,
      licenseNumber: player.licenseNumber,
      bloodType: player.bloodType,
      emergencyContact: player.emergencyContact,
    );
  }
}
