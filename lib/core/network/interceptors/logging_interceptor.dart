/// Interceptor para loggear todas las peticiones y respuestas HTTP.
///
/// Solo loggea en modo debug/desarrollo según la configuración del entorno.
library;

import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../../utils/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!AppConfig.enableLogging) {
      return handler.next(options);
    }

    AppLogger.httpRequest(
      options.method,
      options.uri.toString(),
      data: options.data,
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!AppConfig.enableLogging) {
      return handler.next(response);
    }

    AppLogger.httpResponse(
      response.statusCode ?? 0,
      response.requestOptions.uri.toString(),
      data: response.data,
    );

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!AppConfig.enableLogging) {
      return handler.next(err);
    }

    AppLogger.error(
      'HTTP Error: ${err.requestOptions.method} ${err.requestOptions.uri}',
      error: err,
    );

    if (err.response != null) {
      AppLogger.debug(
        'Error Response Data: ${err.response?.data}',
      );
    }

    handler.next(err);
  }
}
