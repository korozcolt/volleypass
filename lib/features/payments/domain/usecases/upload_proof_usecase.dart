/// Caso de uso para subir comprobante de pago.
library;

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/payment_repository.dart';

class UploadProofUseCase implements UseCase<String, UploadProofParams> {
  final PaymentRepository repository;

  UploadProofUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(UploadProofParams params) async {
    return await repository.uploadProof(params.paymentId, params.file);
  }
}

class UploadProofParams extends Equatable {
  final int paymentId;
  final File file;

  const UploadProofParams({
    required this.paymentId,
    required this.file,
  });

  @override
  List<Object?> get props => [paymentId, file];
}
