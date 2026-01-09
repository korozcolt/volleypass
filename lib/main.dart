import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/app_config.dart';
import 'core/config/environment.dart';
import 'core/utils/app_logger.dart';
import 'core/storage/preferences_storage.dart';
import 'core/storage/offline_storage.dart';
import 'core/storage/secure_storage.dart';
import 'core/network/dev_http_overrides.dart';
import 'core/network/api_client.dart';
import 'core/auth/token_storage.dart';
import 'shared/theme/app_theme.dart';
import 'shared/theme/theme_providers.dart';
import 'shared/theme/theme_notifier.dart' as theme_notifier;
import 'shared/widgets/main_scaffold.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/verification/presentation/pages/qr_scanner_page.dart';
import 'features/verification/presentation/providers/verification_providers.dart';
import 'features/match_sessions/presentation/pages/available_matches_page.dart';
import 'features/match_sessions/presentation/pages/active_session_page.dart';
import 'features/match_sessions/presentation/pages/session_details_page.dart';
import 'features/match_sessions/presentation/pages/sessions_history_page.dart';
import 'features/tournaments/presentation/pages/tournaments_list_page.dart';
import 'features/tournaments/presentation/pages/tournament_detail_page.dart';
import 'features/tournaments/presentation/pages/standings_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'features/payments/presentation/pages/payments_page.dart';
import 'features/payments/presentation/pages/club_payments_page.dart';

// Instancias globales de Storage
late final SharedPreferences sharedPreferences;
late final PreferencesStorage preferencesStorage;
late final OfflineStorage offlineStorage;
late final SecureStorage secureStorage;
late final TokenStorage tokenStorage;
late final ApiClient apiClient;

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

  // Inicializar SharedPreferences
  sharedPreferences = await SharedPreferences.getInstance();

  // Inicializar PreferencesStorage
  preferencesStorage = PreferencesStorage();
  await preferencesStorage.init();

  // Inicializar SecureStorage
  secureStorage = SecureStorage();

  // Inicializar TokenStorage
  tokenStorage = TokenStorage(
    secureStorage: secureStorage,
    preferencesStorage: preferencesStorage,
  );

  // Inicializar OfflineStorage
  offlineStorage = OfflineStorage();
  await offlineStorage.init();

  // Inicializar ApiClient
  apiClient = ApiClient(tokenStorage: tokenStorage);

  AppLogger.info('🚀 Starting VolleyPass Mobile');
  AppLogger.info('Environment: ${AppConfig.current.environment}');

  runApp(
    ProviderScope(
      overrides: [
        // Override providers para inyección de dependencias
        apiClientProvider.overrideWithValue(apiClient),
        offlineStorageProvider.overrideWithValue(offlineStorage),
      ],
      child: const VolleyPassApp(),
    ),
  );
}

class VolleyPassApp extends ConsumerStatefulWidget {
  const VolleyPassApp({super.key});

  @override
  ConsumerState<VolleyPassApp> createState() => _VolleyPassAppState();
}

class _VolleyPassAppState extends ConsumerState<VolleyPassApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Actualizar el brightness del sistema al iniciar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      ref.read(themeProvider.notifier).updateSystemBrightness(brightness);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    // Actualizar cuando el sistema cambie de tema
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    ref.read(themeProvider.notifier).updateSystemBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);

    // Convertir ThemeMode personalizado a ThemeMode de Flutter
    final ThemeMode flutterThemeMode;
    switch (themeState.mode) {
      case theme_notifier.ThemeMode.light:
        flutterThemeMode = ThemeMode.light;
        break;
      case theme_notifier.ThemeMode.dark:
        flutterThemeMode = ThemeMode.dark;
        break;
      case theme_notifier.ThemeMode.system:
        flutterThemeMode = ThemeMode.system;
        break;
    }

    // Configurar el estilo de la barra de estado y navegación
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeState.isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: themeState.isDark ? const Color(0xFF121212) : Colors.white,
        systemNavigationBarIconBrightness: themeState.isDark ? Brightness.light : Brightness.dark,
      ),
    );

    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: AppConfig.isDevelopment,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme, // TODO: Implement dark theme
      themeMode: flutterThemeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const MainScaffold(),
        '/scanner': (context) => const QRScannerPage(),
        '/available-matches': (context) => const AvailableMatchesPage(),
        '/active-session': (context) => const ActiveSessionPage(),
        '/sessions-history': (context) => const SessionsHistoryPage(),
        '/tournaments': (context) => const TournamentsListPage(),
        '/settings': (context) => const SettingsPage(),
        '/payments': (context) => const PaymentsPage(),
        '/club-payments': (context) => const ClubPaymentsPage(),
      },
      onGenerateRoute: (settings) {
        // Handle routes with parameters
        if (settings.name == '/session-details') {
          final sessionId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => SessionDetailsPage(sessionId: sessionId),
          );
        }

        if (settings.name == '/tournament-detail') {
          final tournamentId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => TournamentDetailPage(tournamentId: tournamentId),
          );
        }

        if (settings.name == '/standings') {
          final tournamentId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => StandingsPage(tournamentId: tournamentId),
          );
        }

        return null;
      },
    );
  }
}
