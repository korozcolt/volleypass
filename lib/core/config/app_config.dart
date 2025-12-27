/// Configuración centralizada de la aplicación.
///
/// Singleton que proporciona acceso a la configuración del entorno actual
/// y constantes de configuración de la aplicación.
///
/// Uso:
/// ```dart
/// // Inicializar al inicio de la app
/// AppConfig.initialize(EnvironmentConfig.development);
///
/// // Usar en cualquier parte
/// final apiUrl = AppConfig.apiBaseUrl;
/// final timeout = AppConfig.apiTimeout;
/// ```
library;

import 'environment.dart';

class AppConfig {
  AppConfig._();

  static late EnvironmentConfig _config;
  static bool _initialized = false;

  /// Inicializa la configuración con el entorno especificado
  static void initialize(EnvironmentConfig config) {
    _config = config;
    _initialized = true;
  }

  /// Verifica que la configuración esté inicializada
  static void _checkInitialized() {
    if (!_initialized) {
      throw StateError(
        'AppConfig not initialized. Call AppConfig.initialize() first.',
      );
    }
  }

  // ============================================================================
  // ENVIRONMENT CONFIG
  // ============================================================================

  /// Configuración actual del entorno
  static EnvironmentConfig get current {
    _checkInitialized();
    return _config;
  }

  /// URL base de la API
  static String get apiBaseUrl {
    _checkInitialized();
    return _config.apiBaseUrl;
  }

  /// Timeout de peticiones HTTP en milisegundos
  static int get apiTimeout {
    _checkInitialized();
    return _config.apiTimeout;
  }

  /// Habilitar logging
  static bool get enableLogging {
    _checkInitialized();
    return _config.enableLogging;
  }

  /// Habilitar reporte de crashes
  static bool get enableCrashReporting {
    _checkInitialized();
    return _config.enableCrashReporting;
  }

  /// Máximo de reintentos para peticiones HTTP
  static int get maxRetries {
    _checkInitialized();
    return _config.maxRetries;
  }

  /// Duración del caché
  static Duration get cacheDuration {
    _checkInitialized();
    return _config.cacheDuration;
  }

  /// Nombre de la aplicación
  static String get appName {
    _checkInitialized();
    return _config.appName;
  }

  /// Verifica si es development
  static bool get isDevelopment {
    _checkInitialized();
    return _config.isDevelopment;
  }

  /// Verifica si es staging
  static bool get isStaging {
    _checkInitialized();
    return _config.isStaging;
  }

  /// Verifica si es production
  static bool get isProduction {
    _checkInitialized();
    return _config.isProduction;
  }

  // ============================================================================
  // APP CONSTANTS
  // ============================================================================

  // Configuración de features
  static const int qrScanTimeout = 30; // segundos
  static const int maxBatchVerifications = 50;
  static const int paginationLimit = 20;
  static const int offlineSyncBatchSize = 100;

  // Configuración de UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Configuración de caché
  static const Duration tokenExpiration = Duration(days: 30);
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100; // MB

  // Configuración de retry
  static const Duration retryDelay = Duration(seconds: 2);
  static const Duration maxRetryDelay = Duration(seconds: 30);

  // Configuración de verificación
  static const int verificationDisplayDuration = 10; // segundos

  // Configuración de sincronización
  static const Duration syncInterval = Duration(minutes: 5);
  static const Duration syncRetryDelay = Duration(seconds: 30);
}
