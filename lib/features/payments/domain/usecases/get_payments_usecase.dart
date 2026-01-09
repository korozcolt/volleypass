/// Caso de uso para obtener la lista de pagos del jugador.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/payment.dart';
import '../repositories/payment_repository.dart';

class GetPaymentsUseCase
    implements UseCase<List<Payment>, GetPaymentsParams> {
  final PaymentRepository repository;

  GetPaymentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Payment>>> call(GetPaymentsParams params) async {
    return await repository.getPayments(
      status: params.status,
      type: params.type,
      page: params.page,
    );
  }
}

class GetPaymentsParams extends Equatable {
  final String? status;
  final String? type;
  final int page;

  const GetPaymentsParams({
    this.status,
    this.type,
    this.page = 1,
  });

  @override
  List<Object?> get props => [status, type, page];
}
