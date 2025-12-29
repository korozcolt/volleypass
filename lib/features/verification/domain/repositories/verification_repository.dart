/// Repositorio de verificación de jugadores.
///
/// Define el contrato para las operaciones de verificación de QR.
/// Este es el puerto (interface) del patrón Repository que será
/// implementado en la capa de datos.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/player.dart';
import '../entities/verification.dart';
import '../entities/verification_request.dart';

/// Resultado de una verificación que incluye la verificación y el jugador
class VerificationResultData {
  final Verification verification;
  final Player player;

  const VerificationResultData({
    required this.verification,
    required this.player,
  });
}

abstract class VerificationRepository {
  /// Verifica un código QR de carnet de jugador
  ///
  /// Si hay conexión, realiza la verificación en el servidor.
  /// Si no hay conexión, guarda la verificación como pending offline.
  ///
  /// Returns:
  /// - Right(VerificationResultData) si la verificación es exitosa
  /// - Left(Failure) si hay un error
  Future<Either<Failure, VerificationResultData>> verifyQR(
    VerificationRequest request,
  );

  /// Obtiene el historial de verificaciones
  ///
  /// Returns:
  /// - Right(List<VerificationResultData>) si la operación es exitosa
  /// - Left(Failure) si hay un error
  Future<Either<Failure, List<VerificationResultData>>> getVerificationHistory({
    String? result,
    String? date,
    int? matchSessionId,
    int page = 1,
    int perPage = 20,
  });

  /// Sincroniza las verificaciones pendientes con el servidor
  ///
  /// Returns:
  /// - Right(bool) true si la sincronización fue exitosa
  /// - Left(Failure) si hay un error
  Future<Either<Failure, bool>> syncPendingVerifications();

  /// Obtiene las verificaciones pendientes de sincronización
  ///
  /// Returns lista de verificaciones pendientes guardadas localmente
  Future<List<Map<String, dynamic>>> getPendingVerifications();
}
