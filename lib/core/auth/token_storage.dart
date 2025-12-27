/// Almacenamiento de tokens de autenticación.
///
/// Maneja el almacenamiento seguro de tokens y su expiración.
library;

import '../storage/secure_storage.dart';
import '../storage/preferences_storage.dart';
import '../constants/app_constants.dart';
import '../utils/app_logger.dart';

class TokenStorage {
  final SecureStorage _secureStorage;
  final PreferencesStorage _preferencesStorage;

  TokenStorage({
    required SecureStorage secureStorage,
    required PreferencesStorage preferencesStorage,
  })  : _secureStorage = secureStorage,
        _preferencesStorage = preferencesStorage;

  /// Guarda el token de autenticación
  Future<void> saveToken(String token, {DateTime? expiresAt}) async {
    try {
      await _secureStorage.write(AppConstants.authTokenKey, token);

      if (expiresAt != null) {
        await _preferencesStorage.setString(
          AppConstants.tokenExpiryKey,
          expiresAt.toIso8601String(),
        );
      }

      AppLogger.info('TokenStorage: Token saved${expiresAt != null ? ' with expiry' : ''}');
    } catch (e, stackTrace) {
      AppLogger.error('TokenStorage: Error saving token', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Obtiene el token de autenticación
  Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(AppConstants.authTokenKey);

      if (token == null) {
        AppLogger.debug('TokenStorage: No token found');
        return null;
      }

      // Verificar si el token está expirado
      final expiryStr = _preferencesStorage.getString(AppConstants.tokenExpiryKey);
      if (expiryStr != null) {
        final expiry = DateTime.parse(expiryStr);
        final now = DateTime.now();

        if (now.isAfter(expiry)) {
          AppLogger.warning('TokenStorage: Token expired');
          await clearToken();
          return null;
        }
      }

      AppLogger.debug('TokenStorage: Token retrieved');
      return token;
    } catch (e, stackTrace) {
      AppLogger.error('TokenStorage: Error getting token', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Verifica si existe un token válido
  Future<bool> hasValidToken() async {
    final token = await getToken();
    return token != null;
  }

  /// Limpia el token
  Future<void> clearToken() async {
    try {
      await _secureStorage.delete(AppConstants.authTokenKey);
      await _preferencesStorage.remove(AppConstants.tokenExpiryKey);
      AppLogger.info('TokenStorage: Token cleared');
    } catch (e, stackTrace) {
      AppLogger.error('TokenStorage: Error clearing token', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Guarda el refresh token (si la API lo soporta en el futuro)
  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _secureStorage.write(AppConstants.refreshTokenKey, refreshToken);
      AppLogger.info('TokenStorage: Refresh token saved');
    } catch (e, stackTrace) {
      AppLogger.error('TokenStorage: Error saving refresh token', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Obtiene el refresh token
  Future<String?> getRefreshToken() async {
    try {
      return await _secureStorage.read(AppConstants.refreshTokenKey);
    } catch (e, stackTrace) {
      AppLogger.error('TokenStorage: Error getting refresh token', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Obtiene la fecha de expiración del token
  DateTime? getTokenExpiry() {
    final expiryStr = _preferencesStorage.getString(AppConstants.tokenExpiryKey);
    if (expiryStr == null) return null;

    try {
      return DateTime.parse(expiryStr);
    } catch (e) {
      return null;
    }
  }

  /// Verifica si el token va a expirar pronto (próximos 5 minutos)
  Future<bool> isTokenExpiringSoon() async {
    final expiry = getTokenExpiry();
    if (expiry == null) return false;

    final now = DateTime.now();
    final difference = expiry.difference(now);

    return difference.inMinutes <= 5;
  }
}
