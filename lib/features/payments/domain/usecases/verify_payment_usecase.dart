/// Casos de uso para verificar (aprobar/rechazar) pagos.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/payment_repository.dart';

/// Aprobar pago
class ApprovePaymentUseCase implements UseCase<String, int> {
  final PaymentRepository repository;

  ApprovePaymentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(int paymentId) async {
    return await repository.approvePayment(paymentId);
  }
}

/// Rechazar pago
class RejectPaymentUseCase implements UseCase<String, RejectPaymentParams> {
  final PaymentRepository repository;

  RejectPaymentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(RejectPaymentParams params) async {
    return await repository.rejectPayment(params.paymentId, params.notes);
  }
}

class RejectPaymentParams extends Equatable {
  final int paymentId;
  final String notes;

  const RejectPaymentParams({
    required this.paymentId,
    required this.notes,
  });

  @override
  List<Object?> get props => [paymentId, notes];
}
