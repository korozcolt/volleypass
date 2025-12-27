/// Almacenamiento seguro para datos sensibles.
///
/// Wrapper sobre flutter_secure_storage para almacenar
/// tokens, credenciales y otros datos sensibles.
library;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/app_logger.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        );

  /// Guarda un valor de forma segura
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      AppLogger.debug('SecureStorage: Saved $key');
    } catch (e, stackTrace) {
      AppLogger.error('SecureStorage: Error saving $key', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Lee un valor del almacenamiento seguro
  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      AppLogger.debug('SecureStorage: Read $key (${value != null ? 'found' : 'not found'})');
      return value;
    } catch (e, stackTrace) {
      AppLogger.error('SecureStorage: Error reading $key', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Elimina un valor
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
      AppLogger.debug('SecureStorage: Deleted $key');
    } catch (e, stackTrace) {
      AppLogger.error('SecureStorage: Error deleting $key', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Limpia todo el almacenamiento seguro
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      AppLogger.debug('SecureStorage: Cleared all data');
    } catch (e, stackTrace) {
      AppLogger.error('SecureStorage: Error clearing all data', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Lee todos los valores
  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e, stackTrace) {
      AppLogger.error('SecureStorage: Error reading all', error: e, stackTrace: stackTrace);
      return {};
    }
  }

  /// Verifica si existe una key
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      return false;
    }
  }
}
