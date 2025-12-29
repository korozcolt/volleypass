/// Entidad de verificación dentro del contexto de una sesión.
///
/// Representa una verificación de jugador realizada durante una sesión de partido.
library;

import 'package:equatable/equatable.dart';

class SessionVerification extends Equatable {
  final int id;
  final int sessionId;
  final String playerName;
  final String cardNumber;
  final String team; // 'home' or 'away'
  final String result; // 'eligible', 'restricted', 'not_eligible'
  final DateTime verifiedAt;
  final String? restrictionReason;

  const SessionVerification({
    required this.id,
    required this.sessionId,
    required this.playerName,
    required this.cardNumber,
    required this.team,
    required this.result,
    required this.verifiedAt,
    this.restrictionReason,
  });

  /// Si la verificación es elegible
  bool get isEligible => result == 'eligible';

  /// Icono de estado según el resultado
  String get statusIcon {
    switch (result) {
      case 'eligible':
        return '✅';
      case 'restricted':
      case 'not_eligible':
        return '⛔';
      default:
        return '❓';
    }
  }

  /// Mensaje de estado legible
  String get statusMessage {
    switch (result) {
      case 'eligible':
        return 'Apto';
      case 'restricted':
        return 'Restringido';
      case 'not_eligible':
        return 'No Apto';
      default:
        return 'Desconocido';
    }
  }

  /// Hora de verificación formateada
  String get formattedVerifiedTime {
    return '${verifiedAt.hour.toString().padLeft(2, '0')}:${verifiedAt.minute.toString().padLeft(2, '0')}';
  }

  /// Si el jugador es del equipo local
  bool get isHomeTeam => team == 'home';

  /// Si el jugador es del equipo visitante
  bool get isAwayTeam => team == 'away';

  @override
  List<Object?> get props => [
        id,
        sessionId,
        playerName,
        cardNumber,
        team,
        result,
        verifiedAt,
        restrictionReason,
      ];
}
