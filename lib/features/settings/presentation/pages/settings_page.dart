/// Página de configuración de la aplicación.
///
/// Permite al usuario configurar preferencias como el tema (dark mode).
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/theme/theme_providers.dart';
import '../../../../shared/theme/theme_notifier.dart' as theme_notifier;

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Sección de Apariencia
          _buildSectionHeader('Apariencia', isDark),
          _buildThemeSection(context, ref, themeState, isDark),

          AppSpacing.verticalSpaceLG,

          // Sección de Aplicación (para futuras configuraciones)
          _buildSectionHeader('Aplicación', isDark),
          _buildAppSection(context, isDark),

          AppSpacing.verticalSpaceLG,

          // Sección de Información
          _buildSectionHeader('Información', isDark),
          _buildInfoSection(context, isDark),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: AppTextStyles.h6.copyWith(
          color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThemeSection(
    BuildContext context,
    WidgetRef ref,
    theme_notifier.ThemeState themeState,
    bool isDark,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Modo de tema
          ListTile(
            leading: Icon(
              _getThemeIcon(themeState.mode),
              color: AppColors.primary,
            ),
            title: Text(
              'Modo de Tema',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              _getThemeModeLabel(themeState.mode),
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThemeModeDialog(context, ref, themeState),
          ),

          // Switch de Dark Mode rápido (solo visible cuando no es System mode)
          if (themeState.mode != theme_notifier.ThemeMode.system)
            SwitchListTile(
              secondary: Icon(
                themeState.isDark ? Icons.dark_mode : Icons.light_mode,
                color: AppColors.secondary,
              ),
              title: Text(
                'Modo Oscuro',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              subtitle: Text(
                themeState.isDark ? 'Activado' : 'Desactivado',
                style: AppTextStyles.bodySmall.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                ),
              ),
              value: themeState.isDark,
              onChanged: (value) {
                if (value) {
                  ref.read(themeProvider.notifier).setDarkMode();
                } else {
                  ref.read(themeProvider.notifier).setLightMode();
                }
              },
            ),
        ],
      ),
    );
  }

  Widget _buildAppSection(BuildContext context, bool isDark) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_outlined, color: AppColors.primary),
            title: Text(
              'Notificaciones',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              'Próximamente',
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            onTap: () => _showComingSoon(context),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.primary),
            title: Text(
              'Idioma',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              'Español',
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            onTap: () => _showComingSoon(context),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, bool isDark) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.primary),
            title: Text(
              'Versión',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              '1.0.0',
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.primary),
            title: Text(
              'Política de Privacidad',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _showComingSoon(context),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.description_outlined, color: AppColors.primary),
            title: Text(
              'Términos y Condiciones',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _showComingSoon(context),
          ),
        ],
      ),
    );
  }

  IconData _getThemeIcon(theme_notifier.ThemeMode mode) {
    switch (mode) {
      case theme_notifier.ThemeMode.light:
        return Icons.light_mode;
      case theme_notifier.ThemeMode.dark:
        return Icons.dark_mode;
      case theme_notifier.ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  String _getThemeModeLabel(theme_notifier.ThemeMode mode) {
    switch (mode) {
      case theme_notifier.ThemeMode.light:
        return 'Modo Claro';
      case theme_notifier.ThemeMode.dark:
        return 'Modo Oscuro';
      case theme_notifier.ThemeMode.system:
        return 'Automático (Sistema)';
    }
  }

  void _showThemeModeDialog(
    BuildContext context,
    WidgetRef ref,
    theme_notifier.ThemeState currentState,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seleccionar Modo de Tema'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<theme_notifier.ThemeMode>(
              title: Row(
                children: [
                  const Icon(Icons.light_mode, size: 20),
                  AppSpacing.horizontalSpaceSM,
                  const Text('Modo Claro'),
                ],
              ),
              value: theme_notifier.ThemeMode.light,
              groupValue: currentState.mode,
              onChanged: (value) {
                ref.read(themeProvider.notifier).setLightMode();
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<theme_notifier.ThemeMode>(
              title: Row(
                children: [
                  const Icon(Icons.dark_mode, size: 20),
                  AppSpacing.horizontalSpaceSM,
                  const Text('Modo Oscuro'),
                ],
              ),
              value: theme_notifier.ThemeMode.dark,
              groupValue: currentState.mode,
              onChanged: (value) {
                ref.read(themeProvider.notifier).setDarkMode();
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<theme_notifier.ThemeMode>(
              title: Row(
                children: [
                  const Icon(Icons.brightness_auto, size: 20),
                  AppSpacing.horizontalSpaceSM,
                  const Text('Automático (Sistema)'),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  'Sigue la configuración del dispositivo',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                  ),
                ),
              ),
              value: theme_notifier.ThemeMode.system,
              groupValue: currentState.mode,
              onChanged: (value) {
                ref.read(themeProvider.notifier).setSystemMode();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Próximamente disponible'),
        backgroundColor: AppColors.info,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
