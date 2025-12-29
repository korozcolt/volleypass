/// Menú lateral principal de la aplicación.
///
/// Drawer con navegación basada en roles y permisos.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/main_scaffold.dart';
import '../../../../core/utils/permissions_helper.dart';
import '../providers/auth_providers.dart';
import '../../domain/entities/user.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return const Drawer(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Drawer(
      child: Column(
        children: [
          // Header con información del usuario
          _buildHeader(user),

          // Items del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Dashboard (todos)
                _buildMenuItem(
                  context,
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(bottomNavIndexProvider.notifier).state = 0;
                  },
                ),

                const Divider(),

                // Verificación QR (solo verificadores)
                if (PermissionsHelper.canVerifyQR(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.qr_code_scanner,
                    title: 'Verificación QR',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/scanner');
                    },
                  ),

                // Planillas de Partido (solo árbitros pueden crear/modificar)
                if (PermissionsHelper.canModifySessions(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.assignment,
                    title: 'Planilla Activa',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/active-session');
                    },
                  ),

                if (PermissionsHelper.canModifySessions(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.sports_volleyball,
                    title: 'Crear Planilla',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/available-matches');
                    },
                  ),

                // Historial visible para árbitros, coaches, directores y admins
                if (PermissionsHelper.canViewSessions(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.history,
                    title: 'Historial de Planillas',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/sessions-history');
                    },
                  ),

                // Partidos (solo árbitros)
                if (PermissionsHelper.canManageMatches(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.sports_volleyball,
                    title: 'Partidos',
                    onTap: () {
                      Navigator.pop(context);
                      _showComingSoon(context, 'Gestión de Partidos');
                    },
                  ),

                const Divider(),

                // Torneos (todos pueden ver públicos)
                _buildMenuItem(
                  context,
                  icon: Icons.emoji_events,
                  title: 'Torneos',
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(bottomNavIndexProvider.notifier).state = 2;
                  },
                ),

                // Equipos (coaches y club admins)
                if (PermissionsHelper.canViewTeam(user) ||
                    PermissionsHelper.canManageClub(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.groups,
                    title: 'Equipos',
                    onTap: () {
                      Navigator.pop(context);
                      _showComingSoon(context, 'Equipos');
                    },
                  ),

                // Pagos (admins y club admins)
                if (PermissionsHelper.isAdmin(user) ||
                    PermissionsHelper.canManageClub(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.payment,
                    title: 'Pagos',
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 1;
                    },
                  ),

                // Estadísticas (admins y quienes puedan verlas)
                if (PermissionsHelper.canViewStats(user))
                  _buildMenuItem(
                    context,
                    icon: Icons.analytics,
                    title: 'Estadísticas',
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 3;
                    },
                  ),

                const Divider(),

                // Perfil (todos)
                _buildMenuItem(
                  context,
                  icon: Icons.person,
                  title: 'Mi Perfil',
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(bottomNavIndexProvider.notifier).state = 4;
                  },
                ),

                // Configuración (todos)
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  title: 'Configuración',
                  onTap: () {
                    Navigator.pop(context);
                    _showComingSoon(context, 'Configuración');
                  },
                ),

                const Divider(),

                // Cerrar Sesión
                _buildMenuItem(
                  context,
                  icon: Icons.logout,
                  title: 'Cerrar Sesión',
                  textColor: AppColors.error,
                  iconColor: AppColors.error,
                  onTap: () {
                    Navigator.pop(context);
                    _showLogoutDialog(context, ref);
                  },
                ),
              ],
            ),
          ),

          // Footer con versión
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(User user) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: user.profile?.avatarUrl != null
            ? ClipOval(
                child: Image.network(
                  user.profile!.avatarUrl!,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              )
            : Text(
                user.initials,
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.primary,
                ),
              ),
      ),
      accountName: Text(
        user.fullName,
        style: AppTextStyles.bodyLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.email,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          AppSpacing.verticalSpaceXS,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              user.primaryRole,
              style: AppTextStyles.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
    String? badge,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? AppColors.textPrimary,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: textColor ?? AppColors.textPrimary,
            ),
          ),
          if (badge != null) ...[
            AppSpacing.horizontalSpaceSM,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badge,
                style: AppTextStyles.labelSmall.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: AppSpacing.paddingMD,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_volleyball,
            size: 16,
            color: AppColors.textSecondary,
          ),
          AppSpacing.horizontalSpaceXS,
          Text(
            'VolleyPass v1.0.0',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Próximamente: $feature'),
        backgroundColor: AppColors.info,
        behavior: SnackBarBehavior.floating,
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
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }
}
