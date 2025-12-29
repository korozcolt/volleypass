/// Caso de uso: Sincronizar verificaciones pendientes.
///
/// Sincroniza con el servidor las verificaciones que fueron
/// realizadas offline.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/verification_repository.dart';

class SyncPendingVerificationsUseCase implements UseCase<bool, NoParams> {
  final VerificationRepository _repository;

  SyncPendingVerificationsUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    // Delegar al repositorio
    return await _repository.syncPendingVerifications();
  }
}
