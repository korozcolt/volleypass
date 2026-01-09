/// Estados posibles de un pago.
library;

enum PaymentStatus {
  /// Pendiente - Esperando comprobante del jugador
  pending,

  /// Por Verificación - Comprobante subido, esperando aprobación del club
  underVerification,

  /// Verificado - Aprobado por el club
  verified,

  /// Rechazado - Comprobante rechazado, debe volver a subir
  rejected,

  /// Vencido - Pasó la fecha límite de pago
  overdue,

  /// Completado - Pago completado
  completed,

  /// Cancelado - Pago cancelado
  cancelled,

  /// Reembolsado - Pago reembolsado
  refunded;

  /// Convierte el enum a string para el API
  String toJson() {
    switch (this) {
      case PaymentStatus.pending:
        return 'pending';
      case PaymentStatus.underVerification:
        return 'under_verification';
      case PaymentStatus.verified:
        return 'verified';
      case PaymentStatus.rejected:
        return 'rejected';
      case PaymentStatus.overdue:
        return 'overdue';
      case PaymentStatus.completed:
        return 'completed';
      case PaymentStatus.cancelled:
        return 'cancelled';
      case PaymentStatus.refunded:
        return 'refunded';
    }
  }

  /// Crea el enum desde string del API
  static PaymentStatus fromJson(String json) {
    switch (json) {
      case 'pending':
        return PaymentStatus.pending;
      case 'under_verification':
        return PaymentStatus.underVerification;
      case 'verified':
        return PaymentStatus.verified;
      case 'rejected':
        return PaymentStatus.rejected;
      case 'overdue':
        return PaymentStatus.overdue;
      case 'completed':
        return PaymentStatus.completed;
      case 'cancelled':
        return PaymentStatus.cancelled;
      case 'refunded':
        return PaymentStatus.refunded;
      default:
        throw ArgumentError('Estado de pago inválido: $json');
    }
  }

  /// Nombre amigable para mostrar en UI
  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pendiente';
      case PaymentStatus.underVerification:
        return 'En Verificación';
      case PaymentStatus.verified:
        return 'Verificado';
      case PaymentStatus.rejected:
        return 'Rechazado';
      case PaymentStatus.overdue:
        return 'Vencido';
      case PaymentStatus.completed:
        return 'Completado';
      case PaymentStatus.cancelled:
        return 'Cancelado';
      case PaymentStatus.refunded:
        return 'Reembolsado';
    }
  }

  /// Verifica si el pago puede subir comprobante
  bool get canUploadProof {
    return this == PaymentStatus.pending || this == PaymentStatus.rejected;
  }

  /// Verifica si el pago puede ser verificado/rechazado por el club
  bool get canBeVerified {
    return this == PaymentStatus.underVerification;
  }

  /// Verifica si el pago está en estado final (no se puede modificar)
  bool get isFinal {
    return this == PaymentStatus.completed ||
        this == PaymentStatus.cancelled ||
        this == PaymentStatus.refunded;
  }
}
