/// HTTP Overrides para desarrollo.
///
/// Permite certificados SSL auto-firmados en ambiente de desarrollo.
library;

import 'dart:io';
import '../config/app_config.dart';
import '../config/environment.dart';

/// HttpOverrides personalizado para desarrollo
///
/// En desarrollo, permite todos los certificados SSL incluyendo
/// los auto-firmados. En producción, usa la validación estándar.
class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Solo permitir certificados no válidos en desarrollo
        if (AppConfig.current.environment == Environment.development) {
          // Opcionalmente, podemos verificar que el host sea el esperado
          return true;
        }
        // En producción, rechazar certificados inválidos
        return false;
      };
  }
}
