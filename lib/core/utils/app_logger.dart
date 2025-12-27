/// Logger centralizado de la aplicación.
///
/// Wrapper sobre el package logger que respeta la configuración del entorno.
/// Solo loggea en development y staging, no en production.
library;

import 'package:logger/logger.dart';
import '../config/app_config.dart';

class AppLogger {
  static late final Logger _logger;
  static bool _initialized = false;

  /// Inicializa el logger
  static void initialize() {
    if (_initialized) return;

    _logger = Logger(
      filter: _AppLogFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );

    _initialized = true;
  }

  /// Verifica que el logger esté inicializado
  static void _checkInitialized() {
    if (!_initialized) {
      initialize();
    }
  }

  /// Log de debug
  static void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _checkInitialized();
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log de información
  static void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _checkInitialized();
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log de warning
  static void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _checkInitialized();
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log de error
  static void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _checkInitialized();
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log de error fatal
  static void fatal(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _checkInitialized();
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log para requests HTTP
  static void httpRequest(String method, String url, {Map<String, dynamic>? data}) {
    if (!AppConfig.enableLogging) return;

    info('→ HTTP $method: $url${data != null ? '\n  Body: $data' : ''}');
  }

  /// Log para responses HTTP
  static void httpResponse(int statusCode, String url, {dynamic data}) {
    if (!AppConfig.enableLogging) return;

    if (statusCode >= 200 && statusCode < 300) {
      info('← HTTP $statusCode: $url');
    } else {
      error('← HTTP $statusCode: $url${data != null ? '\n  Error: $data' : ''}');
    }
  }

  /// Log para errores HTTP
  static void httpError(String message, {dynamic error, StackTrace? stackTrace}) {
    if (!AppConfig.enableLogging) return;

    AppLogger.error('✗ HTTP Error: $message', error: error, stackTrace: stackTrace);
  }

  /// Close logger
  static void close() {
    if (_initialized) {
      _logger.close();
    }
  }
}

/// Filtro personalizado que respeta la configuración del entorno
class _AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // Solo loggear si está habilitado en la configuración
    return AppConfig.enableLogging;
  }
}
