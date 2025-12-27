/// Configuración de entornos de la aplicación.
///
/// Define los diferentes entornos disponibles (development, staging, production)
/// y la configuración específica de cada uno.
library;

/// Enum de entornos disponibles
enum Environment {
  development,
  staging,
  production,
}

/// Configuración específica por entorno
class EnvironmentConfig {
  final Environment environment;
  final String apiBaseUrl;
  final int apiTimeout;
  final bool enableLogging;
  final bool enableCrashReporting;
  final int maxRetries;
  final Duration cacheDuration;
  final String appName;

  const EnvironmentConfig({
    required this.environment,
    required this.apiBaseUrl,
    this.apiTimeout = 30000, // 30 segundos
    this.enableLogging = false,
    this.enableCrashReporting = false,
    this.maxRetries = 3,
    this.cacheDuration = const Duration(hours: 24),
    this.appName = 'VolleyPass',
  });

  /// Configuración para Development
  static const development = EnvironmentConfig(
    environment: Environment.development,
    apiBaseUrl: 'https://volleypass-new.test/api/v1',
    enableLogging: true,
    enableCrashReporting: false,
    appName: 'VolleyPass (Dev)',
  );

  /// Configuración para Staging
  static const staging = EnvironmentConfig(
    environment: Environment.staging,
    apiBaseUrl: 'https://staging.volleypass.com/api/v1',
    enableLogging: true,
    enableCrashReporting: true,
    appName: 'VolleyPass (Staging)',
  );

  /// Configuración para Production
  static const production = EnvironmentConfig(
    environment: Environment.production,
    apiBaseUrl: 'https://api.volleypass.com/api/v1',
    enableLogging: false,
    enableCrashReporting: true,
    appName: 'VolleyPass',
  );

  /// Verifica si es environment de desarrollo
  bool get isDevelopment => environment == Environment.development;

  /// Verifica si es environment de staging
  bool get isStaging => environment == Environment.staging;

  /// Verifica si es environment de producción
  bool get isProduction => environment == Environment.production;

  @override
  String toString() => 'EnvironmentConfig(env: $environment, api: $apiBaseUrl)';
}
