/// Página de Splash Screen.
///
/// Pantalla inicial que verifica el estado de autenticación
/// y redirige al usuario según corresponda.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../providers/auth_providers.dart';
import '../state/auth_state.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Mostrar splash por al menos 2 segundos
    await Future.delayed(const Duration(seconds: 2));

    // Verificar estado de autenticación
    if (mounted) {
      ref.read(authStateProvider.notifier).checkAuthStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escuchar cambios de estado para navegar
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      next.when(
        initial: () {},
        loading: () {},
        authenticated: (user) {
          // Navegar a Dashboard
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/dashboard');
          }
        },
        unauthenticated: () {
          // Navegar a Login
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        error: (message) {
          // En caso de error, ir a Login
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const Icon(
              Icons.sports_volleyball,
              size: 120,
              color: AppColors.textOnDark,
            ),
            AppSpacing.verticalSpaceXL,

            // Nombre de la app
            Text(
              'VolleyPass',
              style: AppTextStyles.h1.copyWith(
                color: AppColors.textOnDark,
              ),
            ),
            AppSpacing.verticalSpaceSM,

            // Subtítulo
            Text(
              'Sistema de Verificación',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textOnDarkSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            // Progress indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.textOnDark),
            ),
          ],
        ),
      ),
    );
  }
}
