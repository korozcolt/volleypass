/// DataSource local de autenticación.
///
/// Maneja el almacenamiento local de tokens y datos de usuario.
library;

import 'dart:convert';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/storage/preferences_storage.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Guarda el token de autenticación
  Future<void> saveToken(String token);

  /// Obtiene el token de autenticación
  Future<String?> getToken();

  /// Elimina el token
  Future<void> deleteToken();

  /// Guarda la fecha de expiración del token
  Future<void> saveTokenExpiry(DateTime expiry);

  /// Obtiene la fecha de expiración del token
  DateTime? getTokenExpiry();

  /// Guarda el usuario en caché
  Future<void> saveUser(UserModel user);

  /// Obtiene el usuario del caché
  Future<UserModel?> getCachedUser();

  /// Elimina el usuario del caché
  Future<void> deleteUser();

  /// Limpia todos los datos de autenticación
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorage _secureStorage;
  final PreferencesStorage _preferencesStorage;

  AuthLocalDataSourceImpl({
    required SecureStorage secureStorage,
    required PreferencesStorage preferencesStorage,
  })  : _secureStorage = secureStorage,
        _preferencesStorage = preferencesStorage;

  @override
  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(AppConstants.authTokenKey, token);
      AppLogger.debug('AuthLocalDataSource: Token saved');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error saving token',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(AppConstants.authTokenKey);

      if (token == null) {
        AppLogger.debug('AuthLocalDataSource: No token found');
        return null;
      }

      // Verificar expiración
      final expiry = getTokenExpiry();
      if (expiry != null && DateTime.now().isAfter(expiry)) {
        AppLogger.warning('AuthLocalDataSource: Token expired');
        await clearAll();
        return null;
      }

      AppLogger.debug('AuthLocalDataSource: Token retrieved');
      return token;
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error getting token',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _secureStorage.delete(AppConstants.authTokenKey);
      AppLogger.debug('AuthLocalDataSource: Token deleted');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error deleting token',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> saveTokenExpiry(DateTime expiry) async {
    try {
      await _preferencesStorage.setString(
        AppConstants.tokenExpiryKey,
        expiry.toIso8601String(),
      );
      AppLogger.debug('AuthLocalDataSource: Token expiry saved');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error saving token expiry',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  DateTime? getTokenExpiry() {
    try {
      final expiryStr = _preferencesStorage.getString(AppConstants.tokenExpiryKey);
      if (expiryStr == null) return null;

      return DateTime.parse(expiryStr);
    } catch (e) {
      AppLogger.error('AuthLocalDataSource: Error parsing token expiry', error: e);
      return null;
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await _preferencesStorage.setString(
        AppConstants.cachedUserKey,
        userJson,
      );
      AppLogger.debug('AuthLocalDataSource: User cached');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error saving user',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final userJson = _preferencesStorage.getString(AppConstants.cachedUserKey);
      if (userJson == null) {
        AppLogger.debug('AuthLocalDataSource: No cached user found');
        return null;
      }

      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      AppLogger.debug('AuthLocalDataSource: Cached user retrieved');
      return UserModel.fromJson(userMap);
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error getting cached user',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await _preferencesStorage.remove(AppConstants.cachedUserKey);
      AppLogger.debug('AuthLocalDataSource: Cached user deleted');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error deleting user',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await Future.wait([
        deleteToken(),
        deleteUser(),
        _preferencesStorage.remove(AppConstants.tokenExpiryKey),
      ]);
      AppLogger.info('AuthLocalDataSource: All auth data cleared');
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthLocalDataSource: Error clearing all data',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
