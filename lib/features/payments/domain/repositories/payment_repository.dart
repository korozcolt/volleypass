/// Repositorio de pagos (Domain).
library;

import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/payment.dart';

abstract class PaymentRepository {
  /// Obtener lista de pagos del jugador
  Future<Either<Failure, List<Payment>>> getPayments({
    String? status,
    String? type,
    int page = 1,
  });

  /// Obtener detalle de un pago
  Future<Either<Failure, Payment>> getPaymentDetail(int paymentId);

  /// Subir comprobante de pago
  Future<Either<Failure, String>> uploadProof(int paymentId, File file);

  /// Obtener pagos del club (para ClubAdmin/Coach)
  Future<Either<Failure, List<Payment>>> getClubPayments({
    String? status,
    int page = 1,
  });

  /// Verificar (aprobar) pago del club
  Future<Either<Failure, String>> approvePayment(int paymentId);

  /// Rechazar pago del club
  Future<Either<Failure, String>> rejectPayment(int paymentId, String notes);

  /// Obtener estadísticas de pagos del club
  Future<Either<Failure, Map<String, dynamic>>> getClubPaymentStatistics();
}
