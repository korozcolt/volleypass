/// Caso de uso para completar una sesión.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match_session.dart';
import '../repositories/match_session_repository.dart';

class CompleteSessionUseCase
    implements UseCase<MatchSession, CompleteSessionParams> {
  final MatchSessionRepository _repository;

  CompleteSessionUseCase(this._repository);

  @override
  Future<Either<Failure, MatchSession>> call(CompleteSessionParams params) async {
    return await _repository.completeSession(
      sessionId: params.sessionId,
      notes: params.notes,
    );
  }
}

class CompleteSessionParams extends Equatable {
  final int sessionId;
  final String? notes;

  const CompleteSessionParams({
    required this.sessionId,
    this.notes,
  });

  @override
  List<Object?> get props => [sessionId, notes];
}
