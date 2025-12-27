/// Almacenamiento de preferencias de la aplicación.
///
/// Wrapper sobre SharedPreferences para configuración y preferencias.
library;

import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_logger.dart';

class PreferencesStorage {
  SharedPreferences? _prefs;

  /// Inicializa SharedPreferences
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      AppLogger.debug('PreferencesStorage: Initialized');
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error initializing', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  void _checkInitialized() {
    if (_prefs == null) {
      throw StateError('PreferencesStorage not initialized. Call init() first.');
    }
  }

  // ============================================================================
  // STRING
  // ============================================================================

  String? getString(String key) {
    _checkInitialized();
    return _prefs!.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    _checkInitialized();
    try {
      final result = await _prefs!.setString(key, value);
      AppLogger.debug('PreferencesStorage: Set string $key');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error setting string $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // BOOL
  // ============================================================================

  bool getBool(String key, {bool defaultValue = false}) {
    _checkInitialized();
    return _prefs!.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) async {
    _checkInitialized();
    try {
      final result = await _prefs!.setBool(key, value);
      AppLogger.debug('PreferencesStorage: Set bool $key = $value');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error setting bool $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // INT
  // ============================================================================

  int? getInt(String key) {
    _checkInitialized();
    return _prefs!.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    _checkInitialized();
    try {
      final result = await _prefs!.setInt(key, value);
      AppLogger.debug('PreferencesStorage: Set int $key = $value');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error setting int $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // DOUBLE
  // ============================================================================

  double? getDouble(String key) {
    _checkInitialized();
    return _prefs!.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) async {
    _checkInitialized();
    try {
      final result = await _prefs!.setDouble(key, value);
      AppLogger.debug('PreferencesStorage: Set double $key = $value');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error setting double $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // LIST<STRING>
  // ============================================================================

  List<String>? getStringList(String key) {
    _checkInitialized();
    return _prefs!.getStringList(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    _checkInitialized();
    try {
      final result = await _prefs!.setStringList(key, value);
      AppLogger.debug('PreferencesStorage: Set string list $key');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error setting string list $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // REMOVE & CLEAR
  // ============================================================================

  Future<bool> remove(String key) async {
    _checkInitialized();
    try {
      final result = await _prefs!.remove(key);
      AppLogger.debug('PreferencesStorage: Removed $key');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error removing $key', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<bool> clear() async {
    _checkInitialized();
    try {
      final result = await _prefs!.clear();
      AppLogger.debug('PreferencesStorage: Cleared all');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('PreferencesStorage: Error clearing', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // ============================================================================
  // UTILITIES
  // ============================================================================

  bool containsKey(String key) {
    _checkInitialized();
    return _prefs!.containsKey(key);
  }

  Set<String> getKeys() {
    _checkInitialized();
    return _prefs!.getKeys();
  }
}
