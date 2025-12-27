/// Tipos de fallos en la aplicación.
///
/// Usa programación funcional con dartz para manejo de errores.
/// Todos los casos de uso y repositorios retornan Either<Failure, Success>
library;

import 'package:equatable/equatable.dart';

/// Clase base abstracta para todos los fallos
abstract class Failure extends Equatable {
  final String message;
  final int? code;
  final dynamic data;

  const Failure({
    required this.message,
    this.code,
    this.data,
  });

  @override
  List<Object?> get props => [message, code, data];

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// ============================================================================
// SERVER FAILURES
// ============================================================================

/// Fallo relacionado con la API
class ApiFailure extends Failure {
  const ApiFailure(String message, {int? code, dynamic data})
      : super(message: message, code: code, data: data);
}

/// Fallo de autenticación (401)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure([String message = 'No autenticado'])
      : super(message: message, code: 401);
}

/// Fallo de autorización (403)
class AuthorizationFailure extends Failure {
  const AuthorizationFailure([String message = 'No autorizado'])
      : super(message: message, code: 403);
}

/// Recurso no encontrado (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure([String message = 'Recurso no encontrado'])
      : super(message: message, code: 404);
}

/// Error del servidor (500+)
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Error del servidor'])
      : super(message: message, code: 500);
}

/// Error de validación (422)
class ValidationFailure extends Failure {
  final Map<String, List<String>>? errors;

  const ValidationFailure(
    String message, {
    this.errors,
  }) : super(message: message, code: 422, data: errors);

  @override
  List<Object?> get props => [message, code, errors];
}

// ============================================================================
// NETWORK FAILURES
// ============================================================================

/// Sin conexión a internet
class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Sin conexión a internet'])
      : super(message: message);
}

/// Timeout en la petición
class TimeoutFailure extends Failure {
  const TimeoutFailure([String message = 'La operación tardó demasiado'])
      : super(message: message);
}

/// Error de conexión
class ConnectionFailure extends Failure {
  const ConnectionFailure([String message = 'Error de conexión'])
      : super(message: message);
}

// ============================================================================
// CACHE FAILURES
// ============================================================================

/// Error al leer del caché
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Error al leer caché'])
      : super(message: message);
}

/// Caché vacío
class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure([String message = 'No hay datos en caché'])
      : super(message: message);
}

// ============================================================================
// STORAGE FAILURES
// ============================================================================

/// Error al guardar datos
class StorageFailure extends Failure {
  const StorageFailure([String message = 'Error al guardar datos'])
      : super(message: message);
}

/// Error al leer datos
class ReadFailure extends Failure {
  const ReadFailure([String message = 'Error al leer datos'])
      : super(message: message);
}

// ============================================================================
// PARSING FAILURES
// ============================================================================

/// Error al parsear JSON
class ParsingFailure extends Failure {
  const ParsingFailure([String message = 'Error al procesar datos'])
      : super(message: message);
}

// ============================================================================
// BUSINESS LOGIC FAILURES
// ============================================================================

/// Fallo de lógica de negocio
class BusinessLogicFailure extends Failure {
  const BusinessLogicFailure(String message) : super(message: message);
}

/// Operación inválida
class InvalidOperationFailure extends Failure {
  const InvalidOperationFailure(String message) : super(message: message);
}

// ============================================================================
// QR VERIFICATION FAILURES
// ============================================================================

/// Código QR inválido
class InvalidQrCodeFailure extends Failure {
  const InvalidQrCodeFailure([String message = 'Código QR inválido'])
      : super(message: message);
}

/// Carnet no encontrado
class CardNotFoundFailure extends Failure {
  const CardNotFoundFailure([String message = 'Carnet no encontrado'])
      : super(message: message);
}

/// Carnet expirado
class CardExpiredFailure extends Failure {
  const CardExpiredFailure([String message = 'Carnet expirado'])
      : super(message: message);
}

/// Carnet suspendido
class CardSuspendedFailure extends Failure {
  const CardSuspendedFailure([String message = 'Carnet suspendido'])
      : super(message: message);
}

/// Jugador sancionado
class PlayerSanctionedFailure extends Failure {
  final Map<String, dynamic>? sanctionDetails;

  const PlayerSanctionedFailure(
    String message, {
    this.sanctionDetails,
  }) : super(message: message, data: sanctionDetails);

  @override
  List<Object?> get props => [message, sanctionDetails];
}

// ============================================================================
// UNEXPECTED FAILURES
// ============================================================================

/// Error inesperado
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String message = 'Ocurrió un error inesperado'])
      : super(message: message);
}
