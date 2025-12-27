/// DataSource remoto de autenticación.
///
/// Maneja las llamadas a la API de autenticación.
library;

import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/login_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Realiza login
  Future<LoginResponseModel> login({
    required String email,
    required String password,
    required String deviceName,
  });

  /// Obtiene el usuario actual
  Future<UserModel> getCurrentUser();

  /// Cierra sesión
  Future<void> logout();

  /// Cierra sesión en todos los dispositivos
  Future<void> logoutAll();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    try {
      AppLogger.info('AuthRemoteDataSource: Attempting login for $email');

      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
          'device_name': deviceName,
        },
      );

      final apiResponse = ApiResponse.fromResponse(response);

      if (apiResponse.success && apiResponse.data != null) {
        AppLogger.info('AuthRemoteDataSource: Login successful');
        return LoginResponseModel.fromJson(apiResponse.data!);
      } else {
        throw ApiException(message: apiResponse.message ?? 'Login falló');
      }
    } on DioException catch (e) {
      AppLogger.error('AuthRemoteDataSource: DioException during login', error: e);
      throw ApiException.fromDioError(e);
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Unexpected error during login', error: e);
      throw const ApiException(message: 'Error inesperado durante el login');
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      AppLogger.debug('AuthRemoteDataSource: Getting current user');

      final response = await _apiClient.get(ApiEndpoints.currentUser);

      final apiResponse = ApiResponse.fromResponse(response);

      if (apiResponse.success && apiResponse.data != null) {
        final userData = apiResponse.data!['user'] as Map<String, dynamic>;
        AppLogger.debug('AuthRemoteDataSource: Got current user');
        return UserModel.fromJson(userData);
      } else {
        throw ApiException(
          message: apiResponse.message ?? 'Failed to get user',
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } on DioException catch (e) {
      AppLogger.error('AuthRemoteDataSource: DioException getting current user', error: e);
      throw ApiException.fromDioError(e);
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Unexpected error getting current user', error: e);
      throw const ApiException(message: 'Error obteniendo usuario actual');
    }
  }

  @override
  Future<void> logout() async {
    try {
      AppLogger.info('AuthRemoteDataSource: Logging out');

      final response = await _apiClient.post(ApiEndpoints.logout);

      final apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        AppLogger.warning('AuthRemoteDataSource: Logout API call failed but continuing');
        // No lanzar error, continuar con limpieza local
      }

      AppLogger.info('AuthRemoteDataSource: Logout successful');
    } on DioException catch (e) {
      AppLogger.warning('AuthRemoteDataSource: DioException during logout, continuing', error: e);
      // No lanzar error, permitir limpieza local aunque falle el API
    } catch (e) {
      AppLogger.warning('AuthRemoteDataSource: Error during logout, continuing', error: e);
      // No lanzar error, permitir limpieza local aunque falle el API
    }
  }

  @override
  Future<void> logoutAll() async {
    try {
      AppLogger.info('AuthRemoteDataSource: Logging out from all devices');

      final response = await _apiClient.post(ApiEndpoints.logoutAll);

      final apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw ApiException(message: apiResponse.message ?? 'Logout all falló');
      }

      AppLogger.info('AuthRemoteDataSource: Logout all successful');
    } on DioException catch (e) {
      AppLogger.error('AuthRemoteDataSource: DioException during logout all', error: e);
      throw ApiException.fromDioError(e);
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Unexpected error during logout all', error: e);
      throw const ApiException(message: 'Error cerrando sesión en todos los dispositivos');
    }
  }
}
