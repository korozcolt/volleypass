/// Caso de uso para obtener los detalles completos de una sesión.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/match_session_repository.dart';

class GetSessionDetailsUseCase
    implements UseCase<SessionDetailData, GetSessionDetailsParams> {
  final MatchSessionRepository _repository;

  GetSessionDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, SessionDetailData>> call(
    GetSessionDetailsParams params,
  ) async {
    return await _repository.getSessionDetails(params.sessionId);
  }
}

class GetSessionDetailsParams extends Equatable {
  final int sessionId;

  const GetSessionDetailsParams({required this.sessionId});

  @override
  List<Object> get props => [sessionId];
}
