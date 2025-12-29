/// Datasource remoto del dashboard.
library;

import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/api_exception.dart';
import '../models/dashboard_response_model.dart';

abstract class DashboardRemoteDataSource {
  /// GET /dashboard
  Future<DashboardResponseModel> getDashboard();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiClient apiClient;

  DashboardRemoteDataSourceImpl(this.apiClient);

  @override
  Future<DashboardResponseModel> getDashboard() async {
    try {
      final response = await apiClient.get(ApiEndpoints.dashboard);

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
}
