/// Caso de uso para obtener partidos disponibles para crear sesión.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/available_match.dart';
import '../repositories/match_session_repository.dart';

class GetAvailableMatchesUseCase
    implements UseCase<List<AvailableMatch>, GetAvailableMatchesParams> {
  final MatchSessionRepository _repository;

  GetAvailableMatchesUseCase(this._repository);

  @override
  Future<Either<Failure, List<AvailableMatch>>> call(
    GetAvailableMatchesParams params,
  ) async {
    return await _repository.getAvailableMatches(
      page: params.page,
      perPage: params.perPage,
    );
  }
}

class GetAvailableMatchesParams extends Equatable {
  final int page;
  final int perPage;

  const GetAvailableMatchesParams({
    this.page = 1,
    this.perPage = 20,
  });

  @override
  List<Object> get props => [page, perPage];
}
