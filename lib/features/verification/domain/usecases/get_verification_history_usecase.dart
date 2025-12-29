/// Caso de uso: Obtener historial de verificaciones.
///
/// Obtiene el listado de verificaciones realizadas por el usuario.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/verification_repository.dart';

class GetVerificationHistoryUseCase
    implements UseCase<List<VerificationResultData>, GetHistoryParams> {
  final VerificationRepository _repository;

  GetVerificationHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<VerificationResultData>>> call(
    GetHistoryParams params,
  ) async {
    // Delegar al repositorio
    return await _repository.getVerificationHistory(
      result: params.result,
      date: params.date,
      matchSessionId: params.matchSessionId,
      page: params.page,
      perPage: params.perPage,
    );
  }
}

/// Parámetros para obtener historial de verificaciones
class GetHistoryParams extends Equatable {
  final String? result;
  final String? date;
  final int? matchSessionId;
  final int page;
  final int perPage;

  const GetHistoryParams({
    this.result,
    this.date,
    this.matchSessionId,
    this.page = 1,
    this.perPage = 20,
  });

  @override
  List<Object?> get props => [result, date, matchSessionId, page, perPage];
}
