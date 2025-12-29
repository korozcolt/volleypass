/// Caso de uso para obtener el historial de sesiones.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match_session.dart';
import '../repositories/match_session_repository.dart';

class GetSessionsHistoryUseCase
    implements UseCase<List<MatchSession>, GetSessionsHistoryParams> {
  final MatchSessionRepository _repository;

  GetSessionsHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<MatchSession>>> call(
    GetSessionsHistoryParams params,
  ) async {
    return await _repository.getSessions(
      status: params.status,
      matchId: params.matchId,
      page: params.page,
      perPage: params.perPage,
    );
  }
}

class GetSessionsHistoryParams extends Equatable {
  final String? status;
  final int? matchId;
  final int page;
  final int perPage;

  const GetSessionsHistoryParams({
    this.status,
    this.matchId,
    this.page = 1,
    this.perPage = 20,
  });

  @override
  List<Object?> get props => [status, matchId, page, perPage];
}
