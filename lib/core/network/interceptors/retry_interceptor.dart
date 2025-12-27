/// Interceptor para reintentar peticiones fallidas.
///
/// Implementa lógica de retry con backoff exponencial
/// para errores de red temporales.
library;

import 'package:dio/dio.dart';
import '../../utils/app_logger.dart';

class RetryInterceptor extends Interceptor {
  /// Número máximo de reintentos
  final int maxRetries;

  /// Delay inicial entre reintentos (en milisegundos)
  final int retryDelay;

  /// Multiplicador para backoff exponencial
  final double backoffMultiplier;

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = 1000,
    this.backoffMultiplier = 2.0,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Solo reintentar errores de conexión o timeout
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    // Obtener número de reintentos previos
    final retries = err.requestOptions.extra['retries'] ?? 0;

    if (retries >= maxRetries) {
      AppLogger.warning(
        'RetryInterceptor: Max retries ($maxRetries) reached for ${err.requestOptions.uri}',
      );
      return handler.next(err);
    }

    // Calcular delay con backoff exponencial
    final delay = _calculateDelay(retries);

    AppLogger.info(
      'RetryInterceptor: Retrying ${err.requestOptions.uri} (attempt ${retries + 1}/$maxRetries) after ${delay}ms',
    );

    // Esperar antes de reintentar
    await Future.delayed(Duration(milliseconds: delay));

    // Actualizar contador de reintentos
    err.requestOptions.extra['retries'] = retries + 1;

    try {
      // Reintentar la petición
      final response = await Dio().fetch(err.requestOptions);
      return handler.resolve(response);
    } catch (e) {
      if (e is DioException) {
        return handler.next(e);
      }
      return handler.next(err);
    }
  }

  /// Determina si un error debe ser reintentado
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500 &&
            err.response!.statusCode! < 600);
  }

  /// Calcula el delay con backoff exponencial
  int _calculateDelay(int retries) {
    return (retryDelay * (backoffMultiplier * retries)).toInt();
  }
}
