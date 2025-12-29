/// Almacenamiento de preferencia de tema (Dark/Light Mode).
///
/// Persiste la elección del usuario sobre el modo claro u oscuro.
library;

import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_logger.dart';

class ThemeStorage {
  static const String _keyThemeMode = 'theme_mode';
  static const String _valueLight = 'light';
  static const String _valueDark = 'dark';
  static const String _valueSystem = 'system';

  final SharedPreferences _prefs;

  ThemeStorage(this._prefs);

  /// Obtiene el modo de tema guardado
  ///
  /// Retorna:
  /// - 'light': Modo claro
  /// - 'dark': Modo oscuro
  /// - 'system': Seguir sistema (por defecto)
  Future<String> getThemeMode() async {
    try {
      final mode = _prefs.getString(_keyThemeMode) ?? _valueSystem;
      AppLogger.debug('ThemeStorage: Theme mode retrieved: $mode');
      return mode;
    } catch (e) {
      AppLogger.error('ThemeStorage: Error getting theme mode', error: e);
      return _valueSystem;
    }
  }

  /// Verifica si está en modo oscuro
  ///
  /// Retorna true si el modo guardado es 'dark'
  Future<bool> isDarkMode() async {
    final mode = await getThemeMode();
    return mode == _valueDark;
  }

  /// Verifica si está en modo claro
  ///
  /// Retorna true si el modo guardado es 'light'
  Future<bool> isLightMode() async {
    final mode = await getThemeMode();
    return mode == _valueLight;
  }

  /// Verifica si sigue el sistema
  ///
  /// Retorna true si el modo guardado es 'system'
  Future<bool> isSystemMode() async {
    final mode = await getThemeMode();
    return mode == _valueSystem;
  }

  /// Guarda el modo claro
  Future<void> setLightMode() async {
    try {
      await _prefs.setString(_keyThemeMode, _valueLight);
      AppLogger.info('ThemeStorage: Theme mode set to light');
    } catch (e) {
      AppLogger.error('ThemeStorage: Error setting light mode', error: e);
    }
  }

  /// Guarda el modo oscuro
  Future<void> setDarkMode() async {
    try {
      await _prefs.setString(_keyThemeMode, _valueDark);
      AppLogger.info('ThemeStorage: Theme mode set to dark');
    } catch (e) {
      AppLogger.error('ThemeStorage: Error setting dark mode', error: e);
    }
  }

  /// Guarda seguir el sistema
  Future<void> setSystemMode() async {
    try {
      await _prefs.setString(_keyThemeMode, _valueSystem);
      AppLogger.info('ThemeStorage: Theme mode set to system');
    } catch (e) {
      AppLogger.error('ThemeStorage: Error setting system mode', error: e);
    }
  }

  /// Alterna entre modo claro y oscuro
  ///
  /// Si está en light, cambia a dark. Si está en dark, cambia a light.
  /// Si está en system, cambia a dark.
  Future<void> toggleTheme() async {
    final current = await getThemeMode();
    if (current == _valueDark) {
      await setLightMode();
    } else {
      await setDarkMode();
    }
  }

  /// Limpia la preferencia de tema
  Future<void> clearThemeMode() async {
    try {
      await _prefs.remove(_keyThemeMode);
      AppLogger.info('ThemeStorage: Theme mode cleared');
    } catch (e) {
      AppLogger.error('ThemeStorage: Error clearing theme mode', error: e);
    }
  }
}
