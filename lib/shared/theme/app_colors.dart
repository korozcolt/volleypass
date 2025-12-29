/// Colores de la aplicación.
///
/// Define la paleta de colores completa para mantener consistencia visual.
library;

import 'package:flutter/material.dart';

class AppColors {
  // Prevenir instanciación
  AppColors._();

  // ============================================================================
  // COLORES PRIMARIOS
  // ============================================================================

  /// Color principal de la marca (Azul volleyball)
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF63A4FF);
  static const Color primaryDark = Color(0xFF004BA0);

  /// Color secundario/acento (Naranja volleyball)
  static const Color secondary = Color(0xFFFF6F00);
  static const Color secondaryLight = Color(0xFFFFA040);
  static const Color secondaryDark = Color(0xFFC43E00);

  // ============================================================================
  // COLORES DE ESTADO
  // ============================================================================

  /// Éxito (verde)
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF80E27E);
  static const Color successDark = Color(0xFF087F23);

  /// Error (rojo)
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFF6F60);
  static const Color errorDark = Color(0xFFAB000D);

  /// Advertencia (amarillo/naranja)
  static const Color warning = Color(0xFFFFA726);
  static const Color warningLight = Color(0xFFFFD95B);
  static const Color warningDark = Color(0xFFC77800);

  /// Información (azul claro)
  static const Color info = Color(0xFF29B6F6);
  static const Color infoLight = Color(0xFF73E8FF);
  static const Color infoDark = Color(0xFF0086C3);

  // ============================================================================
  // COLORES DE FONDO - LIGHT MODE
  // ============================================================================

  /// Fondo principal (modo claro)
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFFF5F5F5);

  /// Fondo de tarjetas/contenedores
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFEEEEEE);

  // ============================================================================
  // COLORES DE FONDO - DARK MODE
  // ============================================================================

  /// Fondo principal (modo oscuro)
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkBackgroundElevated = Color(0xFF1E1E1E);

  /// Fondo de tarjetas/contenedores (dark)
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkSurfaceElevated = Color(0xFF2C2C2C);
  static const Color darkSurfaceHighest = Color(0xFF383838);

  // ============================================================================
  // COLORES DE TEXTO - LIGHT MODE
  // ============================================================================

  /// Texto principal
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);

  /// Texto sobre colores oscuros
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkSecondary = Color(0xFFE0E0E0);

  // ============================================================================
  // COLORES DE TEXTO - DARK MODE
  // ============================================================================

  /// Texto principal (dark mode)
  static const Color darkTextPrimary = Color(0xFFE0E0E0);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkTextTertiary = Color(0xFF808080);
  static const Color darkTextDisabled = Color(0xFF606060);

  // ============================================================================
  // COLORES DE BORDES Y DIVISORES - LIGHT MODE
  // ============================================================================

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFBDBDBD);

  // ============================================================================
  // COLORES DE BORDES Y DIVISORES - DARK MODE
  // ============================================================================

  static const Color darkBorder = Color(0xFF383838);
  static const Color darkDivider = Color(0xFF505050);

  // ============================================================================
  // COLORES ESPECÍFICOS DE LA APP
  // ============================================================================

  /// Estados de sesión
  static const Color sessionActive = Color(0xFF4CAF50);
  static const Color sessionScheduled = Color(0xFF2196F3);
  static const Color sessionCompleted = Color(0xFF9E9E9E);
  static const Color sessionCancelled = Color(0xFFE53935);

  /// Estados de verificación
  static const Color verificationPending = Color(0xFFFFA726);
  static const Color verificationSuccess = Color(0xFF4CAF50);
  static const Color verificationFailed = Color(0xFFE53935);

  /// Indicadores de conectividad
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFF9E9E9E);
  static const Color syncing = Color(0xFF2196F3);

  // ============================================================================
  // GRADIENTES
  // ============================================================================

  /// Gradiente principal (azul)
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  /// Gradiente secundario (naranja)
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );

  /// Gradiente de éxito
  static const Gradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, successDark],
  );

  // ============================================================================
  // OPACIDADES
  // ============================================================================

  static const double opacityHigh = 0.87;
  static const double opacityMedium = 0.60;
  static const double opacityLow = 0.38;
  static const double opacityDisabled = 0.12;

  // ============================================================================
  // SOMBRAS
  // ============================================================================

  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);
}
