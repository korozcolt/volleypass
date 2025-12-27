/// Excepciones de la API.
///
/// Convierte DioException en excepciones específicas de la aplicación
/// para mejor manejo de errores.
library;

import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

/// Excepción base de la API
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;
  final String? errorCode;

  const ApiException({
    required this.message,
    this.statusCode,
    this.data,
    this.errorCode,
  });

  /// Crea una ApiException desde un DioException
  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: AppConstants.errorTimeout,
          statusCode: null,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.connectionError:
        return const ApiException(
          message: AppConstants.errorNetwork,
          statusCode: null,
        );

      case DioExceptionType.cancel:
        return const ApiException(
          message: 'Petición cancelada',
          statusCode: null,
        );

      case DioExceptionType.badCertificate:
        return const ApiException(
          message: 'Certificado SSL inválido',
          statusCode: null,
        );

      case DioExceptionType.unknown:
        if (error.error.toString().contains('SocketException')) {
          return const ApiException(
            message: AppConstants.errorNetwork,
            statusCode: null,
          );
        }
        return ApiException(
          message: error.message ?? AppConstants.errorGeneric,
          statusCode: null,
        );
    }
  }

  /// Maneja respuestas HTTP con error (4xx, 5xx)
  static ApiException _handleBadResponse(Response? response) {
    if (response == null) {
      return const ApiException(
        message: AppConstants.errorGeneric,
        statusCode: null,
      );
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    // Intentar extraer mensaje de error del body
    String message = AppConstants.errorGeneric;
    String? errorCode;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ??
          data['error'] as String? ??
          AppConstants.errorGeneric;
      errorCode = data['error_code'] as String? ?? data['code'] as String?;
    }

    switch (statusCode) {
      case 400:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      case 401:
        return ApiException(
          message: message, // Usar mensaje del backend en vez del hardcoded
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      case 403:
        return ApiException(
          message: AppConstants.errorForbidden,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      case 404:
        return ApiException(
          message: AppConstants.errorNotFound,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      case 422:
        // Validation error
        final errors = data is Map<String, dynamic> ? data['errors'] : null;
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: errors,
          errorCode: errorCode,
        );

      case 429:
        // Rate limit
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      case >= 500:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );

      default:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
          errorCode: errorCode,
        );
    }
  }

  /// Verifica si es un error de autenticación
  bool get isAuthError => statusCode == 401;

  /// Verifica si es un error de validación
  bool get isValidationError => statusCode == 422;

  /// Verifica si es un error de rate limiting
  bool get isRateLimitError => statusCode == 429;

  /// Verifica si es un error del servidor
  bool get isServerError => statusCode != null && statusCode! >= 500;

  @override
  String toString() =>
      'ApiException(message: $message, statusCode: $statusCode, errorCode: $errorCode)';
}
