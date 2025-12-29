/// Datasource remoto para sesiones de partido.
///
/// Maneja todas las peticiones HTTP relacionadas con las sesiones de partido.
library;

import '../../../../core/error/api_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/available_match_model.dart';
import '../models/match_session_model.dart';
import '../models/session_detail_response_model.dart';

/// Interface del datasource remoto
abstract class MatchSessionRemoteDataSource {
  Future<List<AvailableMatchModel>> getAvailableMatches({
    int page = 1,
    int perPage = 20,
  });

  Future<MatchSessionModel> createSession({
    required int matchId,
    String? notes,
  });

  Future<MatchSessionModel?> getActiveSession();

  Future<SessionDetailResponseModel> getSessionDetails(int sessionId);

  Future<MatchSessionModel> updateSession({
    required int sessionId,
    required String action,
  });

  Future<MatchSessionModel> completeSession({
    required int sessionId,
    String? notes,
  });

  Future<List<MatchSessionModel>> getSessions({
    String? status,
    int? matchId,
    int page = 1,
    int perPage = 20,
  });
}

/// Implementación del datasource remoto
class MatchSessionRemoteDataSourceImpl implements MatchSessionRemoteDataSource {
  final ApiClient _apiClient;

  MatchSessionRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<AvailableMatchModel>> getAvailableMatches({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Getting available matches (page: $page)',
      );

      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': perPage,
      };

      final response = await _apiClient.get(
        ApiEndpoints.mobileSessionsAvailableMatches,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final matches = data['matches'] as List<dynamic>;

        AppLogger.info(
          'MatchSessionRemoteDataSource: Got ${matches.length} available matches',
        );

        return matches
            .map((m) => AvailableMatchModel.fromJson(
                  m as Map<String, dynamic>,
                ))
            .toList();
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al obtener partidos disponibles';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error getting available matches',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado al obtener partidos disponibles',
      );
    }
  }

  @override
  Future<MatchSessionModel> createSession({
    required int matchId,
    String? notes,
  }) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Creating session for match $matchId',
      );

      final requestData = <String, dynamic>{
        'match_id': matchId,
        if (notes != null) 'notes': notes,
      };

      final response = await _apiClient.post(
        ApiEndpoints.mobileSessions,
        data: requestData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        final session = data['session'] as Map<String, dynamic>;

        AppLogger.info('MatchSessionRemoteDataSource: Session created successfully');

        return MatchSessionModel.fromJson(session);
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al crear sesión';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error creating session',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(message: 'Error inesperado al crear sesión');
    }
  }

  @override
  Future<MatchSessionModel?> getActiveSession() async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Getting active session',
      );

      final response = await _apiClient.get(
        ApiEndpoints.mobileSessionsActive,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        // Si no hay sesión activa, el endpoint puede devolver null o un objeto vacío
        if (data['session'] == null) {
          AppLogger.info('MatchSessionRemoteDataSource: No active session');
          return null;
        }

        final session = data['session'] as Map<String, dynamic>;
        AppLogger.info('MatchSessionRemoteDataSource: Got active session');

        return MatchSessionModel.fromJson(session);
      } else if (response.statusCode == 404) {
        // No hay sesión activa
        AppLogger.info('MatchSessionRemoteDataSource: No active session (404)');
        return null;
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al obtener sesión activa';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error getting active session',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado al obtener sesión activa',
      );
    }
  }

  @override
  Future<SessionDetailResponseModel> getSessionDetails(int sessionId) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Getting session details for session $sessionId',
      );

      final response = await _apiClient.get(
        ApiEndpoints.mobileSessionDetail(sessionId),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        AppLogger.info('MatchSessionRemoteDataSource: Got session details');

        return SessionDetailResponseModel.fromJson(data);
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al obtener detalles de sesión';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error getting session details',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado al obtener detalles de sesión',
      );
    }
  }

  @override
  Future<MatchSessionModel> updateSession({
    required int sessionId,
    required String action,
  }) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Updating session $sessionId with action: $action',
      );

      final requestData = <String, dynamic>{
        'action': action,
      };

      final response = await _apiClient.patch(
        ApiEndpoints.mobileSessionDetail(sessionId),
        data: requestData,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final session = data['session'] as Map<String, dynamic>;

        AppLogger.info('MatchSessionRemoteDataSource: Session updated successfully');

        return MatchSessionModel.fromJson(session);
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al actualizar sesión';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error updating session',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(message: 'Error inesperado al actualizar sesión');
    }
  }

  @override
  Future<MatchSessionModel> completeSession({
    required int sessionId,
    String? notes,
  }) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Completing session $sessionId',
      );

      final requestData = <String, dynamic>{
        if (notes != null) 'notes': notes,
      };

      final response = await _apiClient.post(
        ApiEndpoints.mobileSessionComplete(sessionId),
        data: requestData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        final session = data['session'] as Map<String, dynamic>;

        AppLogger.info('MatchSessionRemoteDataSource: Session completed successfully');

        return MatchSessionModel.fromJson(session);
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al completar sesión';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error completing session',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(message: 'Error inesperado al completar sesión');
    }
  }

  @override
  Future<List<MatchSessionModel>> getSessions({
    String? status,
    int? matchId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      AppLogger.info(
        'MatchSessionRemoteDataSource: Getting sessions (page: $page)',
      );

      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': perPage,
        if (status != null) 'status': status,
        if (matchId != null) 'match_id': matchId,
      };

      final response = await _apiClient.get(
        ApiEndpoints.mobileSessions,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final sessions = data['sessions'] as List<dynamic>;

        AppLogger.info(
          'MatchSessionRemoteDataSource: Got ${sessions.length} sessions',
        );

        return sessions
            .map((s) => MatchSessionModel.fromJson(
                  s as Map<String, dynamic>,
                ))
            .toList();
      } else {
        final errorData = response.data as Map<String, dynamic>?;
        final errorMessage = errorData?['message'] as String? ??
            errorData?['error'] as String? ??
            'Error al obtener sesiones';
        throw ApiException(
          message: errorMessage,
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      AppLogger.error(
        'MatchSessionRemoteDataSource: Error getting sessions',
        error: e,
      );
      if (e is ApiException) rethrow;
      throw const ApiException(
        message: 'Error inesperado al obtener sesiones',
      );
    }
  }
}
