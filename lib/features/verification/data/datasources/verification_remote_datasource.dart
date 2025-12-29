/// Datasource remoto para verificaciones.
///
/// Maneja todas las peticiones HTTP relacionadas con la verificación de jugadores.
library;

import '../../../../core/error/api_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/verification_request.dart';
import '../models/verification_response_model.dart';

/// Interface del datasource remoto
abstract class VerificationRemoteDataSource {
  Future<VerificationResponseModel> verifyQR(VerificationRequest request);
  Future<List<VerificationResponseModel>> getVerificationHistory({
    String? result,
    String? date,
    int? matchSessionId,
    int page = 1,
    int perPage = 20,
  });
  Future<Map<String, dynamic>> syncVerifications(
    List<Map<String, dynamic>> pendingVerifications,
  );
}

/// Implementación del datasource remoto
class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final ApiClient _apiClient;

  VerificationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<VerificationResponseModel> verifyQR(
    VerificationRequest request,
  ) async {
    try {
      AppLogger.info(
        'VerificationRemoteDataSource: Verifying QR ${request.qrCode.substring(0, 8)}...',
      );

      final response = await _apiClient.post(
        ApiEndpoints.mobileVerify,
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.info('VerificationRemoteDataSource: Verification successful');
        return VerificationResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Verificación falló';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'VerificationRemoteDataSource: Error verifying QR',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(message: 'Error inesperado durante la verificación');
    }
  }

  @override
  Future<List<VerificationResponseModel>> getVerificationHistory({
    String? result,
    String? date,
    int? matchSessionId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      AppLogger.info(
        'VerificationRemoteDataSource: Getting verification history (page: $page)',
      );

      // Construir query parameters
      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': perPage,
        if (result != null) 'result': result,
        if (date != null) 'date': date,
        if (matchSessionId != null) 'match_session_id': matchSessionId,
      };

      final response = await _apiClient.get(
        ApiEndpoints.mobileVerifications,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final verifications = data['verifications'] as List<dynamic>;

        AppLogger.info(
          'VerificationRemoteDataSource: Got ${verifications.length} verifications',
        );

        return verifications
            .map((v) => VerificationResponseModel.fromJson(
                  v as Map<String, dynamic>,
                ))
            .toList();
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al obtener historial';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'VerificationRemoteDataSource: Error getting history',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado al obtener historial',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> syncVerifications(
    List<Map<String, dynamic>> pendingVerifications,
  ) async {
    try {
      AppLogger.info(
        'VerificationRemoteDataSource: Syncing ${pendingVerifications.length} pending verifications',
      );

      final response = await _apiClient.post(
        ApiEndpoints.mobileVerificationsSync,
        data: {'verifications': pendingVerifications},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        AppLogger.info(
          'VerificationRemoteDataSource: Sync completed - ${data['synced_count']} synced, ${data['failed_count']} failed',
        );
        return data;
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Sincronización falló';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'VerificationRemoteDataSource: Error syncing verifications',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado durante la sincronización',
      );
    }
  }
}
