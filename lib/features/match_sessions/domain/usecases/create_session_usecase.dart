/// Caso de uso para crear una sesión de verificación para un partido.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match_session.dart';
import '../repositories/match_session_repository.dart';

class CreateSessionUseCase implements UseCase<MatchSession, CreateSessionParams> {
  final MatchSessionRepository _repository;

  CreateSessionUseCase(this._repository);

  @override
  Future<Either<Failure, MatchSession>> call(CreateSessionParams params) async {
    return await _repository.createSession(
      matchId: params.matchId,
      notes: params.notes,
    );
  }
}

class CreateSessionParams extends Equatable {
  final int matchId;
  final String? notes;

  const CreateSessionParams({
    required this.matchId,
    this.notes,
  });

  @override
  List<Object?> get props => [matchId, notes];
}
