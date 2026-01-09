/// Datasource remoto del dashboard.
library;

import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/api_exception.dart';
import '../models/dashboard_response_model.dart';

abstract class DashboardRemoteDataSource {
  /// GET /dashboard o endpoint específico según rol
  ///
  /// [userRole] - Rol del usuario autenticado para determinar endpoint
  /// - SuperAdmin -> /admin/dashboard
  /// - LeagueAdmin -> /league/dashboard
  /// - ClubAdmin/Coach -> /club/dashboard
  /// - Verifier -> /stats/dashboard
  /// - Por defecto -> /dashboard (unificado)
  Future<DashboardResponseModel> getDashboard({String? userRole});
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiClient apiClient;

  DashboardRemoteDataSourceImpl(this.apiClient);

  @override
  Future<DashboardResponseModel> getDashboard({String? userRole}) async {
    try {
      // Determinar el endpoint según el rol del usuario
      final String endpoint = _getEndpointForRole(userRole);

      final response = await apiClient.get(endpoint);

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return DashboardResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw ApiException(
          message: e.response?.data?['message'] ??
              'No tienes acceso a este dashboard',
          statusCode: 403,
        );
      }

      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al obtener dashboard',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  /// Determina el endpoint correcto basado en el rol del usuario
  String _getEndpointForRole(String? role) {
    if (role == null) return ApiEndpoints.dashboard;

    switch (role) {
      case 'SuperAdmin':
        return ApiEndpoints.adminDashboard;
      case 'LeagueAdmin':
        return ApiEndpoints.leagueDashboard;
      case 'ClubAdmin':
      case 'Coach':
        return ApiEndpoints.clubDashboard;
      case 'Verifier':
        // Endpoint específico para estadísticas de verificadores
        return ApiEndpoints.verificationDashboard;
      default:
        return ApiEndpoints.dashboard;
    }
  }
}
