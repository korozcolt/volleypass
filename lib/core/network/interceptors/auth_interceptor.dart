/// Interceptor para agregar el token de autenticación a las peticiones.
///
/// Agrega automáticamente el header Authorization con el Bearer token
/// a todas las peticiones que lo requieren.
library;

import 'package:dio/dio.dart';
import '../../auth/token_storage.dart';
import '../../utils/app_logger.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  AuthInterceptor({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Obtener el token del storage
      final token = await _tokenStorage.getToken();

      // Si hay token, agregarlo al header
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
        AppLogger.debug('AuthInterceptor: Added Authorization header');
      } else {
        AppLogger.debug('AuthInterceptor: No token available');
      }

      // Continuar con la petición
      handler.next(options);
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthInterceptor: Error adding auth header',
        error: e,
        stackTrace: stackTrace,
      );
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Si recibimos un 401, el token probablemente expiró
    if (err.response?.statusCode == 401) {
      AppLogger.warning('AuthInterceptor: Received 401 - Token may be expired');
      // Aquí podríamos disparar un evento para hacer logout automático
      // o intentar refrescar el token
    }

    handler.next(err);
  }
}
