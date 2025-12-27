/// Estilos de texto de la aplicación.
///
/// Define todos los estilos de texto para mantener consistencia tipográfica.
library;

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Prevenir instanciación
  AppTextStyles._();

  // Familia de fuentes
  static const String _fontFamily = 'Roboto';

  // ============================================================================
  // HEADINGS (Encabezados)
  // ============================================================================

  /// Encabezado 1 - Pantallas principales
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Encabezado 2 - Secciones importantes
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Encabezado 3 - Subsecciones
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Encabezado 4 - Títulos de tarjetas
  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0.15,
  );

  /// Encabezado 5 - Subtítulos
  static const TextStyle h5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0.15,
  );

  /// Encabezado 6 - Títulos pequeños
  static const TextStyle h6 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.15,
  );

  // ============================================================================
  // BODY TEXT (Texto de cuerpo)
  // ============================================================================

  /// Texto de cuerpo grande
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Texto de cuerpo medio (default)
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0.25,
  );

  /// Texto de cuerpo pequeño
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 0.4,
  );

  // ============================================================================
  // LABELS (Etiquetas)
  // ============================================================================

  /// Etiqueta grande
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Etiqueta media
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0.5,
  );

  /// Etiqueta pequeña
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.3,
    letterSpacing: 0.5,
  );

  // ============================================================================
  // BUTTONS (Botones)
  // ============================================================================

  /// Texto de botón grande
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    height: 1.2,
    letterSpacing: 1.25,
  );

  /// Texto de botón medio
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    height: 1.2,
    letterSpacing: 1.25,
  );

  /// Texto de botón pequeño
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    height: 1.2,
    letterSpacing: 1.25,
  );

  // ============================================================================
  // CAPTION (Subtítulos)
  // ============================================================================

  /// Caption (texto descriptivo)
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
    letterSpacing: 0.4,
  );

  /// Overline (texto superior)
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.3,
    letterSpacing: 1.5,
  );

  // ============================================================================
  // ESTILOS ESPECÍFICOS DE LA APP
  // ============================================================================

  /// Números grandes (estadísticas, contadores)
  static const TextStyle numberLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
    letterSpacing: -1,
  );

  /// Números medianos
  static const TextStyle numberMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Código QR/Hash
  static const TextStyle code = TextStyle(
    fontFamily: 'monospace',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Timestamp/Fecha
  static const TextStyle timestamp = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
    letterSpacing: 0.4,
  );

  /// Badge/Tag
  static const TextStyle badge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    height: 1.2,
    letterSpacing: 0.5,
  );

  /// Error message
  static const TextStyle error = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    height: 1.3,
    letterSpacing: 0.4,
  );

  /// Success message
  static const TextStyle success = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.success,
    height: 1.3,
    letterSpacing: 0.4,
  );

  // ============================================================================
  // VARIANTES DE COLOR
  // ============================================================================

  /// Aplica color personalizado a cualquier estilo
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Aplica peso personalizado a cualquier estilo
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Aplica tamaño personalizado a cualquier estilo
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
}
