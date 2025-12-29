/// Entidad de verificación de jugador.
///
/// Entity pura de dominio que representa una verificación realizada
/// sobre un jugador mediante escaneo de QR.
library;

import 'package:equatable/equatable.dart';

/// Resultado de la verificación
enum VerificationResult {
  /// Jugador apto para jugar
  eligible,

  /// Jugador restringido (sancionado, suspendido, etc.)
  restricted,

  /// Jugador no elegible (carnet inválido, expirado, etc.)
  notEligible;

  /// Convierte desde string
  static VerificationResult fromString(String value) {
    switch (value.toLowerCase()) {
      case 'eligible':
        return VerificationResult.eligible;
      case 'restricted':
        return VerificationResult.restricted;
      case 'not_eligible':
      case 'noteligible':
        return VerificationResult.notEligible;
      default:
        return VerificationResult.notEligible;
    }
  }

  /// Convierte a string para API
  String toApiString() {
    switch (this) {
      case VerificationResult.eligible:
        return 'eligible';
      case VerificationResult.restricted:
        return 'restricted';
      case VerificationResult.notEligible:
        return 'not_eligible';
    }
  }
}

class Verification extends Equatable {
  final int id;
  final VerificationResult result;
  final String? restrictionReason;
  final DateTime verifiedAt;
  final int? sessionId;
  final bool isOffline;

  const Verification({
    required this.id,
    required this.result,
    this.restrictionReason,
    required this.verifiedAt,
    this.sessionId,
    this.isOffline = false,
  });

  /// Verifica si la verificación fue exitosa (jugador apto)
  bool get isSuccessful => result == VerificationResult.eligible;

  /// Verifica si hay una razón de restricción
  bool get hasRestriction => restrictionReason != null && restrictionReason!.isNotEmpty;

  /// Verifica si está pendiente de sincronización
  bool get isPendingSync => isOffline;

  /// Obtiene el mensaje de estado
  String get statusMessage {
    switch (result) {
      case VerificationResult.eligible:
        return 'JUGADOR APTO';
      case VerificationResult.restricted:
        return 'JUGADOR NO APTO';
      case VerificationResult.notEligible:
        return 'JUGADOR NO ELEGIBLE';
    }
  }

  @override
  List<Object?> get props => [
        id,
        result,
        restrictionReason,
        verifiedAt,
        sessionId,
        isOffline,
      ];

  @override
  String toString() {
    return 'Verification(id: $id, result: $result, verifiedAt: $verifiedAt, isOffline: $isOffline)';
  }
}
