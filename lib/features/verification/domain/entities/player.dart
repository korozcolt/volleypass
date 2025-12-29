/// Entidad de jugador verificado.
///
/// Entity pura de dominio que representa un jugador del sistema con su
/// información completa incluyendo datos médicos y de emergencia.
library;

import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final int id;
  final String cardNumber;
  final String fullName;
  final String? photoUrl;
  final String birthDate;
  final int age;
  final String gender;
  final String position;
  final String category;
  final String clubName;
  final bool isActive;
  final String licenseNumber;
  final String? bloodType;
  final String? emergencyContact;

  const Player({
    required this.id,
    required this.cardNumber,
    required this.fullName,
    this.photoUrl,
    required this.birthDate,
    required this.age,
    required this.gender,
    required this.position,
    required this.category,
    required this.clubName,
    required this.isActive,
    required this.licenseNumber,
    this.bloodType,
    this.emergencyContact,
  });

  /// Verifica si el jugador es elegible para jugar
  bool get isEligible => isActive && hasValidCard;

  /// Verifica si el carnet del jugador es válido
  bool get hasValidCard => isActive;

  /// Obtiene las iniciales del jugador
  String get initials {
    final parts = fullName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty) {
      return parts[0].substring(0, parts[0].length > 1 ? 2 : 1).toUpperCase();
    }
    return 'U';
  }

  /// Obtiene el estado del carnet como texto
  String get cardStatus {
    if (isActive) return 'Activo';
    return 'Inactivo';
  }

  @override
  List<Object?> get props => [
        id,
        cardNumber,
        fullName,
        photoUrl,
        birthDate,
        age,
        gender,
        position,
        category,
        clubName,
        isActive,
        licenseNumber,
        bloodType,
        emergencyContact,
      ];

  @override
  String toString() {
    return 'Player(id: $id, cardNumber: $cardNumber, fullName: $fullName, isActive: $isActive)';
  }
}
