import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/app_config.dart';
import 'core/config/environment.dart';
import 'core/utils/app_logger.dart';
import 'core/storage/preferences_storage.dart';
import 'core/network/dev_http_overrides.dart';
import 'shared/theme/app_theme.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/dashboard_page.dart';

// Instancia global de PreferencesStorage
late final PreferencesStorage preferencesStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar configuración
  AppConfig.initialize(EnvironmentConfig.development);
  AppLogger.initialize();

  // Configurar HttpOverrides para permitir certificados SSL auto-firmados en desarrollo
  if (AppConfig.isDevelopment) {
    HttpOverrides.global = DevHttpOverrides();
    AppLogger.debug('DevHttpOverrides: SSL certificate validation disabled for development');
  }

  // Inicializar PreferencesStorage
  preferencesStorage = PreferencesStorage();
  await preferencesStorage.init();

  AppLogger.info('🚀 Starting VolleyPass Mobile');
  AppLogger.info('Environment: ${AppConfig.current.environment}');

  runApp(const ProviderScope(child: VolleyPassApp()));
}

class VolleyPassApp extends StatelessWidget {
  const VolleyPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: AppConfig.isDevelopment,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
