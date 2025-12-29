/// Caso de uso para actualizar una sesión (pausar/reanudar).
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/match_session.dart';
import '../repositories/match_session_repository.dart';

class UpdateSessionUseCase implements UseCase<MatchSession, UpdateSessionParams> {
  final MatchSessionRepository _repository;

  UpdateSessionUseCase(this._repository);

  @override
  Future<Either<Failure, MatchSession>> call(UpdateSessionParams params) async {
    return await _repository.updateSession(
      sessionId: params.sessionId,
      action: params.action,
    );
  }
}

class UpdateSessionParams extends Equatable {
  final int sessionId;
  final String action; // 'pause' or 'resume'

  const UpdateSessionParams({
    required this.sessionId,
    required this.action,
  });

  @override
  List<Object> get props => [sessionId, action];
}
