/// Gestor de autenticación de la aplicación.
///
/// Maneja el estado de autenticación y los tokens.
library;

import 'token_storage.dart';
import '../utils/app_logger.dart';

class AuthManager {
  final TokenStorage _tokenStorage;

  AuthManager({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  /// Guarda el token de autenticación
  Future<void> saveAuthToken(String token, {DateTime? expiresAt}) async {
    try {
      await _tokenStorage.saveToken(token, expiresAt: expiresAt);
      AppLogger.info('AuthManager: Auth token saved');
    } catch (e, stackTrace) {
      AppLogger.error('AuthManager: Error saving auth token', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Obtiene el token de autenticación
  Future<String?> getToken() async {
    return await _tokenStorage.getToken();
  }

  /// Verifica si el usuario está autenticado
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    final isAuth = token != null;
    AppLogger.debug('AuthManager: Is authenticated: $isAuth');
    return isAuth;
  }

  /// Limpia la autenticación (logout)
  Future<void> clearAuth() async {
    try {
      await _tokenStorage.clearToken();
      AppLogger.info('AuthManager: Auth cleared');
    } catch (e, stackTrace) {
      AppLogger.error('AuthManager: Error clearing auth', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Verifica si el token va a expirar pronto
  Future<bool> isTokenExpiringSoon() async {
    return await _tokenStorage.isTokenExpiringSoon();
  }

  /// Obtiene la fecha de expiración del token
  DateTime? getTokenExpiry() {
    return _tokenStorage.getTokenExpiry();
  }
}
