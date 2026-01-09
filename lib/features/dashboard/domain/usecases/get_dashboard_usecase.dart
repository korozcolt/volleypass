/// Caso de uso para obtener el dashboard según el rol del usuario.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/dashboard_response.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardUseCase
    implements UseCase<DashboardResponse, DashboardParams> {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  @override
  Future<Either<Failure, DashboardResponse>> call(DashboardParams params) async {
    return await repository.getDashboard(userRole: params.userRole);
  }
}

/// Parámetros para el caso de uso de dashboard
class DashboardParams extends Equatable {
  final String? userRole;

  const DashboardParams({this.userRole});

  @override
  List<Object?> get props => [userRole];
}
