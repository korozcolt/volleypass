/// Notifier para gestionar el estado del tema de la aplicación.
///
/// Maneja cambios entre modo claro, oscuro y automático (sistema).
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/theme_storage.dart';
import '../../core/utils/app_logger.dart';

/// Estados posibles del tema
enum ThemeMode {
  light,
  dark,
  system,
}

/// Estado del tema con modo y si está en dark
class ThemeState {
  final ThemeMode mode;
  final bool isDark;

  const ThemeState({
    required this.mode,
    required this.isDark,
  });

  ThemeState copyWith({
    ThemeMode? mode,
    bool? isDark,
  }) {
    return ThemeState(
      mode: mode ?? this.mode,
      isDark: isDark ?? this.isDark,
    );
  }
}

/// Notifier que gestiona el tema de la aplicación
class ThemeNotifier extends StateNotifier<ThemeState> {
  final ThemeStorage _themeStorage;
  Brightness? _systemBrightness;

  ThemeNotifier(this._themeStorage)
      : super(const ThemeState(mode: ThemeMode.system, isDark: false)) {
    _loadTheme();
  }

  /// Carga el tema guardado
  Future<void> _loadTheme() async {
    try {
      final savedMode = await _themeStorage.getThemeMode();
      final ThemeMode mode;

      switch (savedMode) {
        case 'light':
          mode = ThemeMode.light;
          break;
        case 'dark':
          mode = ThemeMode.dark;
          break;
        case 'system':
        default:
          mode = ThemeMode.system;
          break;
      }

      final isDark = _calculateIsDark(mode);

      state = ThemeState(mode: mode, isDark: isDark);

      AppLogger.info('ThemeNotifier: Theme loaded - mode: $mode, isDark: $isDark');
    } catch (e) {
      AppLogger.error('ThemeNotifier: Error loading theme', error: e);
    }
  }

  /// Calcula si debe estar en dark según el modo
  bool _calculateIsDark(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        return _systemBrightness == Brightness.dark;
    }
  }

  /// Actualiza el brightness del sistema
  void updateSystemBrightness(Brightness brightness) {
    if (_systemBrightness != brightness) {
      _systemBrightness = brightness;

      // Solo actualizar si estamos en modo system
      if (state.mode == ThemeMode.system) {
        final isDark = brightness == Brightness.dark;
        state = state.copyWith(isDark: isDark);
        AppLogger.debug('ThemeNotifier: System brightness changed to $brightness');
      }
    }
  }

  /// Cambia a modo claro
  Future<void> setLightMode() async {
    await _themeStorage.setLightMode();
    state = const ThemeState(mode: ThemeMode.light, isDark: false);
    AppLogger.info('ThemeNotifier: Theme set to light');
  }

  /// Cambia a modo oscuro
  Future<void> setDarkMode() async {
    await _themeStorage.setDarkMode();
    state = const ThemeState(mode: ThemeMode.dark, isDark: true);
    AppLogger.info('ThemeNotifier: Theme set to dark');
  }

  /// Cambia a modo automático (sigue al sistema)
  Future<void> setSystemMode() async {
    await _themeStorage.setSystemMode();
    final isDark = _systemBrightness == Brightness.dark;
    state = ThemeState(mode: ThemeMode.system, isDark: isDark);
    AppLogger.info('ThemeNotifier: Theme set to system');
  }

  /// Alterna entre modo claro y oscuro (no afecta system mode)
  Future<void> toggleTheme() async {
    if (state.mode == ThemeMode.dark) {
      await setLightMode();
    } else {
      await setDarkMode();
    }
  }
}
