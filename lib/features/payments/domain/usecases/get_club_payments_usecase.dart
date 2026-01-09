/// Caso de uso para obtener pagos del club (ClubAdmin/Coach).
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/payment.dart';
import '../repositories/payment_repository.dart';

class GetClubPaymentsUseCase
    implements UseCase<List<Payment>, GetClubPaymentsParams> {
  final PaymentRepository repository;

  GetClubPaymentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Payment>>> call(
    GetClubPaymentsParams params,
  ) async {
    return await repository.getClubPayments(
      status: params.status,
      page: params.page,
    );
  }
}

class GetClubPaymentsParams extends Equatable {
  final String? status;
  final int page;

  const GetClubPaymentsParams({
    this.status,
    this.page = 1,
  });

  @override
  List<Object?> get props => [status, page];
}
