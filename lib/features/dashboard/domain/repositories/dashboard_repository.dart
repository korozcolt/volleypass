/// Repositorio del dashboard.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/dashboard_response.dart';

abstract class DashboardRepository {
  /// Obtiene el dashboard según el rol del usuario autenticado
  ///
  /// [userRole] - Rol del usuario para determinar qué dashboard cargar
  Future<Either<Failure, DashboardResponse>> getDashboard({String? userRole});
}
