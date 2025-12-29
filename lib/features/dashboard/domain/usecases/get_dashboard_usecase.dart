/// Caso de uso para obtener el dashboard según el rol del usuario.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/dashboard_response.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardUseCase implements UseCase<DashboardResponse, NoParams> {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  @override
  Future<Either<Failure, DashboardResponse>> call(NoParams params) async {
    return await repository.getDashboard();
  }
}
