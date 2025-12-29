/// Tema principal de la aplicación.
///
/// Define el ThemeData completo usando los colores, estilos de texto
/// y espaciado definidos en los archivos correspondientes.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';

class AppTheme {
  // Prevenir instanciación
  AppTheme._();

  // ============================================================================
  // TEMA CLARO (Light Theme)
  // ============================================================================

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // ========================================================================
      // COLOR SCHEME
      // ========================================================================
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryLight,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.textOnDark,
        onSecondary: AppColors.textOnDark,
        onSurface: AppColors.textPrimary,
        onError: AppColors.textOnDark,
        outline: AppColors.border,
      ),

      // ========================================================================
      // SCAFFOLD
      // ========================================================================
      scaffoldBackgroundColor: AppColors.background,

      // ========================================================================
      // APP BAR
      // ========================================================================
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnDark,
        elevation: AppSpacing.appBarElevation,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textOnDark,
          letterSpacing: 0.15,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textOnDark,
          size: AppSpacing.iconSizeMedium,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // ========================================================================
      // CARD
      // ========================================================================
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(borderRadius: AppSpacing.borderRadiusMD),
        margin: AppSpacing.paddingMD,
      ),

      // ========================================================================
      // ELEVATED BUTTON
      // ========================================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnDark,
          elevation: 2,
          minimumSize: const Size(88, AppSpacing.buttonHeightMedium),
          padding: AppSpacing.paddingHorizontalLG,
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSM,
          ),
          textStyle: AppTextStyles.buttonMedium,
        ),
      ),

      // ========================================================================
      // OUTLINED BUTTON
      // ========================================================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(88, AppSpacing.buttonHeightMedium),
          padding: AppSpacing.paddingHorizontalLG,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSM,
          ),
          textStyle: AppTextStyles.buttonMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      // ========================================================================
      // TEXT BUTTON
      // ========================================================================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(88, AppSpacing.buttonHeightMedium),
          padding: AppSpacing.paddingHorizontalMD,
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSM,
          ),
          textStyle: AppTextStyles.buttonMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      // ========================================================================
      // FLOATING ACTION BUTTON
      // ========================================================================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.textOnDark,
        elevation: 6,
        shape: CircleBorder(),
      ),

      // ========================================================================
      // INPUT DECORATION (Text Fields)
      // ========================================================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: AppSpacing.paddingMD,
        border: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSM,
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSM,
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSM,
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSM,
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSM,
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        errorStyle: AppTextStyles.error,
      ),

      // ========================================================================
      // BOTTOM NAVIGATION BAR
      // ========================================================================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.labelSmall,
        unselectedLabelStyle: AppTextStyles.labelSmall,
        type: BottomNavigationBarType.fixed,
        elevation: AppSpacing.bottomNavElevation,
      ),

      // ========================================================================
      // BOTTOM SHEET
      // ========================================================================
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusLG),
          ),
        ),
      ),

      // ========================================================================
      // DIALOG
      // ========================================================================
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(borderRadius: AppSpacing.borderRadiusMD),
        titleTextStyle: AppTextStyles.h5,
        contentTextStyle: AppTextStyles.bodyMedium,
      ),

      // ========================================================================
      // DIVIDER
      // ========================================================================
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppSpacing.dividerThickness,
        space: AppSpacing.md,
      ),

      // ========================================================================
      // ICON
      // ========================================================================
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: AppSpacing.iconSizeMedium,
      ),

      // ========================================================================
      // CHIP
      // ========================================================================
      chipTheme: const ChipThemeData(
        backgroundColor: AppColors.surfaceDark,
        deleteIconColor: AppColors.textSecondary,
        selectedColor: AppColors.primaryLight,
        secondarySelectedColor: AppColors.secondaryLight,
        padding: AppSpacing.paddingSM,
        labelStyle: AppTextStyles.labelMedium,
        secondaryLabelStyle: AppTextStyles.labelMedium,
        shape: RoundedRectangleBorder(borderRadius: AppSpacing.borderRadiusSM),
      ),

      // ========================================================================
      // PROGRESS INDICATOR
      // ========================================================================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.surfaceDark,
        circularTrackColor: AppColors.surfaceDark,
      ),

      // ========================================================================
      // SNACKBAR
      // ========================================================================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textOnDark,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSM,
        ),
      ),

      // ========================================================================
      // SWITCH
      // ========================================================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.textTertiary;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLight;
          }
          return AppColors.divider;
        }),
      ),

      // ========================================================================
      // CHECKBOX
      // ========================================================================
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surface;
        }),
        checkColor: const WidgetStatePropertyAll(AppColors.textOnDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
        ),
      ),

      // ========================================================================
      // RADIO
      // ========================================================================
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.textSecondary;
        }),
      ),

      // ========================================================================
      // TEXT THEME
      // ========================================================================
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        headlineLarge: AppTextStyles.h4,
        headlineMedium: AppTextStyles.h5,
        headlineSmall: AppTextStyles.h6,
        titleLarge: AppTextStyles.h5,
        titleMedium: AppTextStyles.h6,
        titleSmall: AppTextStyles.labelLarge,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
    );
  }

  // ============================================================================
  // HELPERS
  // ============================================================================

  /// Obtiene el tema según el modo claro/oscuro
  static ThemeData getTheme({bool isDark = false}) {
    return isDark ? lightTheme : lightTheme; // Por ahora solo tema claro
  }

  /// Configura la barra de estado del sistema
  static void setSystemUIOverlayStyle({bool isDark = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            ),
    );
  }
}
