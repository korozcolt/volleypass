/// Repositorio del dashboard.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/dashboard_response.dart';

abstract class DashboardRepository {
  /// Obtiene el dashboard según el rol del usuario autenticado
  Future<Either<Failure, DashboardResponse>> getDashboard();
}
