/// Implementación del repositorio de pagos.
library;

import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/payment.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_datasource.dart';
import '../models/payment_model.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Payment>>> getPayments({
    String? status,
    String? type,
    int page = 1,
  }) async {
    try {
      final response = await remoteDataSource.getPayments(
        status: status,
        type: type,
        page: page,
      );

      final payments = response.data.map((model) => model.toEntity()).toList();
      return Right(payments);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, Payment>> getPaymentDetail(int paymentId) async {
    try {
      final response = await remoteDataSource.getPaymentDetail(paymentId);
      return Right(response.data.toEntity());
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProof(
    int paymentId,
    File file,
  ) async {
    try {
      final response = await remoteDataSource.uploadProof(paymentId, file);
      return Right(response.message);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Payment>>> getClubPayments({
    String? status,
    int page = 1,
  }) async {
    try {
      final response = await remoteDataSource.getClubPayments(
        status: status,
        page: page,
      );

      final payments = response.data.map((model) => model.toEntity()).toList();
      return Right(payments);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> approvePayment(int paymentId) async {
    try {
      final response = await remoteDataSource.verifyPayment(
        paymentId,
        'approve',
        null,
      );
      return Right(response.message);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> rejectPayment(
    int paymentId,
    String notes,
  ) async {
    try {
      final response = await remoteDataSource.verifyPayment(
        paymentId,
        'reject',
        notes,
      );
      return Right(response.message);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getClubPaymentStatistics() async {
    try {
      final response = await remoteDataSource.getClubPaymentStatistics();

      final stats = {
        'total_pending': response.data.totalPending,
        'total_under_verification': response.data.totalUnderVerification,
        'total_verified': response.data.totalVerified,
        'total_overdue': response.data.totalOverdue,
        'pending_amount': response.data.pendingAmount,
        'verified_amount': response.data.verifiedAmount,
      };

      return Right(stats);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }
}
