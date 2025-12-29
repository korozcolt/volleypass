/// Caso de uso para obtener la sesión activa del usuario.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match_session.dart';
import '../repositories/match_session_repository.dart';

class GetActiveSessionUseCase implements UseCase<MatchSession?, NoParams> {
  final MatchSessionRepository _repository;

  GetActiveSessionUseCase(this._repository);

  @override
  Future<Either<Failure, MatchSession?>> call(NoParams params) async {
    return await _repository.getActiveSession();
  }
}
