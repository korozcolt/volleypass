/// Entidad de pago del dominio.
library;

import 'package:equatable/equatable.dart';
import 'payment_status.dart';
import 'payment_type.dart';

class Payment extends Equatable {
  final int id;
  final int playerId;
  final String playerName;
  final int clubId;
  final String clubName;
  final int? leagueId;
  final String? leagueName;
  final PaymentType type;
  final PaymentStatus status;
  final double amount;
  final String description;
  final DateTime dueDate;
  final DateTime? verifiedAt;
  final int? verifiedBy;
  final String? verifierName;
  final String? rejectionNotes;
  final String? paymentProofUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Payment({
    required this.id,
    required this.playerId,
    required this.playerName,
    required this.clubId,
    required this.clubName,
    this.leagueId,
    this.leagueName,
    required this.type,
    required this.status,
    required this.amount,
    required this.description,
    required this.dueDate,
    this.verifiedAt,
    this.verifiedBy,
    this.verifierName,
    this.rejectionNotes,
    this.paymentProofUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Verifica si el pago está vencido
  bool get isOverdue {
    if (status == PaymentStatus.overdue) return true;
    if (status.isFinal) return false;
    return DateTime.now().isAfter(dueDate);
  }

  /// Verifica si el pago tiene comprobante subido
  bool get hasProof => paymentProofUrl != null && paymentProofUrl!.isNotEmpty;

  /// Días hasta el vencimiento (negativo si está vencido)
  int get daysUntilDue {
    return dueDate.difference(DateTime.now()).inDays;
  }

  /// Verifica si el pago puede subir comprobante
  bool get canUploadProof => status.canUploadProof;

  /// Verifica si el pago puede ser verificado
  bool get canBeVerified => status.canBeVerified;

  /// Mensaje de estado para mostrar al usuario
  String get statusMessage {
    if (status == PaymentStatus.rejected && rejectionNotes != null) {
      return 'Rechazado: $rejectionNotes';
    }
    if (status == PaymentStatus.underVerification) {
      return 'En revisión por el club';
    }
    if (status == PaymentStatus.verified) {
      return 'Pago aprobado';
    }
    if (isOverdue) {
      return 'Vencido hace ${-daysUntilDue} días';
    }
    if (status == PaymentStatus.pending) {
      if (daysUntilDue > 0) {
        return 'Vence en $daysUntilDue días';
      }
      return 'Pendiente de pago';
    }
    return status.displayName;
  }

  @override
  List<Object?> get props => [
        id,
        playerId,
        playerName,
        clubId,
        clubName,
        leagueId,
        leagueName,
        type,
        status,
        amount,
        description,
        dueDate,
        verifiedAt,
        verifiedBy,
        verifierName,
        rejectionNotes,
        paymentProofUrl,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'Payment(id: $id, type: ${type.displayName}, status: ${status.displayName}, amount: $amount)';
  }
}
