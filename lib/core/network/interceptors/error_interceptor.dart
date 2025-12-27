/// Interceptor para manejo centralizado de errores HTTP.
///
/// Convierte errores de Dio en excepciones personalizadas de la app.
library;

import 'package:dio/dio.dart';
import '../../error/api_exception.dart';
import '../../utils/app_logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Convertir DioException a ApiException
    final apiException = ApiException.fromDioError(err);

    // Loggear el error
    AppLogger.error(
      'API Error: ${apiException.message}',
      error: apiException,
      stackTrace: err.stackTrace,
    );

    // Crear nuevo DioException con información adicional
    final enhancedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: apiException,
      stackTrace: err.stackTrace,
      message: apiException.message,
    );

    handler.next(enhancedError);
  }
}
