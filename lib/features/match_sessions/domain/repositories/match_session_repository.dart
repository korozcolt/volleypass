/// Interfaz del repositorio de sesiones de partido.
///
/// Define el contrato para todas las operaciones relacionadas con sesiones.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/match_session.dart';
import '../entities/available_match.dart';
import '../entities/session_verification.dart';

/// Repositorio de sesiones de partido
abstract class MatchSessionRepository {
  /// Obtiene los partidos disponibles para crear sesión
  /// (6 horas antes - 24 horas después del partido programado)
  Future<Either<Failure, List<AvailableMatch>>> getAvailableMatches({
    int page = 1,
    int perPage = 20,
  });

  /// Crea una nueva sesión para un partido
  /// Solo se permite una sesión activa por usuario a la vez
  Future<Either<Failure, MatchSession>> createSession({
    required int matchId,
    String? notes,
  });

  /// Obtiene la sesión activa del usuario actual (si existe)
  Future<Either<Failure, MatchSession?>> getActiveSession();

  /// Obtiene los detalles completos de una sesión específica
  Future<Either<Failure, SessionDetailData>> getSessionDetails(int sessionId);

  /// Actualiza una sesión (pausar/reanudar)
  Future<Either<Failure, MatchSession>> updateSession({
    required int sessionId,
    required String action, // 'pause' or 'resume'
  });

  /// Completa una sesión
  Future<Either<Failure, MatchSession>> completeSession({
    required int sessionId,
    String? notes,
  });

  /// Obtiene el historial de sesiones con filtros opcionales
  Future<Either<Failure, List<MatchSession>>> getSessions({
    String? status, // 'active', 'paused', 'completed'
    int? matchId,
    int page = 1,
    int perPage = 20,
  });
}

/// Datos completos de una sesión
class SessionDetailData {
  final MatchSession session;
  final AvailableMatch match;
  final List<SessionVerification> verifications;

  const SessionDetailData({
    required this.session,
    required this.match,
    required this.verifications,
  });
}
