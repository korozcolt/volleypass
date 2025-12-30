/// Providers de Riverpod para gestión de tema.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/theme_storage.dart';
import '../../main.dart' show sharedPreferences;
import 'theme_notifier.dart';

/// Provider de ThemeStorage
final themeStorageProvider = Provider<ThemeStorage>((ref) {
  return ThemeStorage(sharedPreferences);
});

/// Provider de ThemeNotifier
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  final themeStorage = ref.watch(themeStorageProvider);
  return ThemeNotifier(themeStorage);
});

/// Provider computado para saber si está en dark mode
final isDarkModeProvider = Provider<bool>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.isDark;
});

/// Provider computado para obtener el ThemeMode actual
final themeModeProvider = Provider<ThemeMode>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.mode;
});
