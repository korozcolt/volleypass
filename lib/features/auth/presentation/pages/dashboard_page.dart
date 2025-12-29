/// Página del Dashboard principal.
///
/// Pantalla principal después del login.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../providers/auth_providers.dart';
import '../state/auth_state.dart';
import '../widgets/app_drawer.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    // Escuchar cambios de estado para navegar
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      next.whenOrNull(
        unauthenticated: () {
          // Navegar a Login
          Navigator.of(context).pushReplacementNamed('/login');
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('VolleyPass')),
      drawer: const AppDrawer(),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: AppSpacing.paddingLG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header con saludo
                  Text(
                    'Hola, ${user.firstName ?? user.name} 👋',
                    style: AppTextStyles.h3,
                  ),
                  AppSpacing.verticalSpaceSM,
                  Text(
                    user.email,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  AppSpacing.verticalSpaceXL,

                  // Indicador de conexión
                  Container(
                    padding: AppSpacing.paddingMD,
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.1),
                      borderRadius: AppSpacing.borderRadiusSM,
                      border: Border.all(color: AppColors.success, width: 1),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.success,
                        ),
                        AppSpacing.horizontalSpaceSM,
                        Text(
                          'En línea',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.verticalSpaceXL,

                  // Información del usuario
                  Card(
                    child: Padding(
                      padding: AppSpacing.paddingLG,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Información de Usuario',
                            style: AppTextStyles.h6,
                          ),
                          AppSpacing.verticalSpaceMD,

                          _buildInfoRow('ID', user.id.toString()),
                          AppSpacing.verticalSpaceSM,

                          _buildInfoRow('Nombre completo', user.fullName),
                          AppSpacing.verticalSpaceSM,

                          _buildInfoRow('Roles', user.roles.join(', ')),
                          AppSpacing.verticalSpaceSM,

                          _buildInfoRow(
                            'Habilidades',
                            user.abilities.isNotEmpty
                                ? user.abilities.join(', ')
                                : 'Ninguna',
                          ),

                          if (user.profile?.phone != null) ...[
                            AppSpacing.verticalSpaceSM,
                            _buildInfoRow('Teléfono', user.profile!.phone!),
                          ],
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpaceXL,

                  // Quick Actions
                  const Text('Acciones Rápidas', style: AppTextStyles.h6),
                  AppSpacing.verticalSpaceMD,

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                    children: [
                      _buildQuickAction(
                        context,
                        icon: Icons.qr_code_scanner,
                        label: 'Escanear QR',
                        color: AppColors.primary,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Próximamente: Escanear QR'),
                            ),
                          );
                        },
                      ),
                      _buildQuickAction(
                        context,
                        icon: Icons.sports_volleyball,
                        label: 'Iniciar Sesión',
                        color: AppColors.secondary,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Próximamente: Sesión de Partido'),
                            ),
                          );
                        },
                      ),
                      _buildQuickAction(
                        context,
                        icon: Icons.emoji_events,
                        label: 'Torneos',
                        color: AppColors.warning,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Próximamente: Torneos'),
                            ),
                          );
                        },
                      ),
                      _buildQuickAction(
                        context,
                        icon: Icons.history,
                        label: 'Historial',
                        color: AppColors.info,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Próximamente: Historial'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(child: Text(value, style: AppTextStyles.bodyMedium)),
      ],
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: AppSpacing.borderRadiusMD,
        child: Padding(
          padding: AppSpacing.paddingMD,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              AppSpacing.verticalSpaceSM,
              Text(
                label,
                style: AppTextStyles.labelMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(authStateProvider.notifier).logout();
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }
}
