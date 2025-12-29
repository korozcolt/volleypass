/// Implementación del repositorio de sesiones de partido.
///
/// Coordina entre el datasource remoto y local para implementar
/// la lógica de sesiones con soporte offline.
library;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/available_match.dart';
import '../../domain/entities/match_session.dart';
import '../../domain/repositories/match_session_repository.dart';
import '../datasources/match_session_local_datasource.dart';
import '../datasources/match_session_remote_datasource.dart';

class MatchSessionRepositoryImpl implements MatchSessionRepository {
  final MatchSessionRemoteDataSource _remoteDataSource;
  final MatchSessionLocalDataSource _localDataSource;
  final Connectivity _connectivity;

  MatchSessionRepositoryImpl({
    required MatchSessionRemoteDataSource remoteDataSource,
    required MatchSessionLocalDataSource localDataSource,
    required Connectivity connectivity,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _connectivity = connectivity;

  @override
  Future<Either<Failure, List<AvailableMatch>>> getAvailableMatches({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Obtener del servidor
        AppLogger.info(
          'MatchSessionRepository: Getting available matches from server (page: $page)',
        );

        try {
          final matches = await _remoteDataSource.getAvailableMatches(
            page: page,
            perPage: perPage,
          );

          // Guardar en caché (solo primera página)
          if (page == 1) {
            await _localDataSource.saveAvailableMatches(matches);
          }

          final entities = matches.map((m) => m.toEntity()).toList();

          AppLogger.info(
            'MatchSessionRepository: Got ${entities.length} available matches from server',
          );

          return Right(entities);
        } on ApiException catch (e) {
          AppLogger.error(
            'MatchSessionRepository: API error getting available matches',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Obtener del caché
        AppLogger.info(
          'MatchSessionRepository: Getting available matches from cache',
        );

        final cachedMatches = _localDataSource.getAvailableMatches();

        if (cachedMatches == null || cachedMatches.isEmpty) {
          return const Right([]);
        }

        final entities = cachedMatches.map((m) => m.toEntity()).toList();

        AppLogger.info(
          'MatchSessionRepository: Got ${entities.length} cached available matches',
        );

        return Right(entities);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error getting available matches',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al obtener partidos disponibles'));
    }
  }

  @override
  Future<Either<Failure, MatchSession>> createSession({
    required int matchId,
    String? notes,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (!isOnline) {
        AppLogger.info('MatchSessionRepository: Cannot create session - offline');
        return const Left(
          NetworkFailure('No hay conexión para crear una sesión'),
        );
      }

      AppLogger.info(
        'MatchSessionRepository: Creating session for match $matchId',
      );

      try {
        final sessionModel = await _remoteDataSource.createSession(
          matchId: matchId,
          notes: notes,
        );

        // Guardar como sesión activa en caché
        await _localDataSource.saveActiveSession(sessionModel);

        final session = sessionModel.toEntity();

        AppLogger.info(
          'MatchSessionRepository: Session created successfully (ID: ${session.id})',
        );

        return Right(session);
      } on ApiException catch (e) {
        AppLogger.error(
          'MatchSessionRepository: API error creating session',
          error: e,
        );
        return Left(_handleApiException(e));
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error creating session',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al crear sesión'));
    }
  }

  @override
  Future<Either<Failure, MatchSession?>> getActiveSession() async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Obtener del servidor
        AppLogger.info(
          'MatchSessionRepository: Getting active session from server',
        );

        try {
          final sessionModel = await _remoteDataSource.getActiveSession();

          // Actualizar caché
          await _localDataSource.saveActiveSession(sessionModel);

          final session = sessionModel?.toEntity();

          if (session != null) {
            AppLogger.info(
              'MatchSessionRepository: Got active session from server (ID: ${session.id})',
            );
          } else {
            AppLogger.info('MatchSessionRepository: No active session');
          }

          return Right(session);
        } on ApiException catch (e) {
          AppLogger.error(
            'MatchSessionRepository: API error getting active session',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Obtener del caché
        AppLogger.info(
          'MatchSessionRepository: Getting active session from cache',
        );

        final cachedSession = _localDataSource.getActiveSession();
        final session = cachedSession?.toEntity();

        if (session != null) {
          AppLogger.info(
            'MatchSessionRepository: Got cached active session (ID: ${session.id})',
          );
        } else {
          AppLogger.info('MatchSessionRepository: No cached active session');
        }

        return Right(session);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error getting active session',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al obtener sesión activa'));
    }
  }

  @override
  Future<Either<Failure, SessionDetailData>> getSessionDetails(
    int sessionId,
  ) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Obtener del servidor
        AppLogger.info(
          'MatchSessionRepository: Getting session details from server (ID: $sessionId)',
        );

        try {
          final detailsModel = await _remoteDataSource.getSessionDetails(sessionId);

          // Guardar en caché
          await _localDataSource.saveSessionDetails(sessionId, detailsModel);

          final details = detailsModel.toDetailData();

          AppLogger.info(
            'MatchSessionRepository: Got session details from server (${details.verifications.length} verifications)',
          );

          return Right(details);
        } on ApiException catch (e) {
          AppLogger.error(
            'MatchSessionRepository: API error getting session details',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Obtener del caché
        AppLogger.info(
          'MatchSessionRepository: Getting session details from cache (ID: $sessionId)',
        );

        final cachedDetails = _localDataSource.getSessionDetails(sessionId);

        if (cachedDetails == null) {
          return Left(
            NetworkFailure('No hay conexión y no hay datos en caché'),
          );
        }

        final details = cachedDetails.toDetailData();

        AppLogger.info(
          'MatchSessionRepository: Got cached session details (${details.verifications.length} verifications)',
        );

        return Right(details);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error getting session details',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al obtener detalles de sesión'));
    }
  }

  @override
  Future<Either<Failure, MatchSession>> updateSession({
    required int sessionId,
    required String action,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (!isOnline) {
        AppLogger.info('MatchSessionRepository: Cannot update session - offline');
        return const Left(
          NetworkFailure('No hay conexión para actualizar la sesión'),
        );
      }

      AppLogger.info(
        'MatchSessionRepository: Updating session $sessionId with action: $action',
      );

      try {
        final sessionModel = await _remoteDataSource.updateSession(
          sessionId: sessionId,
          action: action,
        );

        // Actualizar caché si es la sesión activa
        if (sessionModel.status == 'active' || sessionModel.status == 'paused') {
          await _localDataSource.saveActiveSession(sessionModel);
        }

        final session = sessionModel.toEntity();

        AppLogger.info(
          'MatchSessionRepository: Session updated successfully (status: ${session.status})',
        );

        return Right(session);
      } on ApiException catch (e) {
        AppLogger.error(
          'MatchSessionRepository: API error updating session',
          error: e,
        );
        return Left(_handleApiException(e));
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error updating session',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al actualizar sesión'));
    }
  }

  @override
  Future<Either<Failure, MatchSession>> completeSession({
    required int sessionId,
    String? notes,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (!isOnline) {
        AppLogger.info('MatchSessionRepository: Cannot complete session - offline');
        return const Left(
          NetworkFailure('No hay conexión para completar la sesión'),
        );
      }

      AppLogger.info(
        'MatchSessionRepository: Completing session $sessionId',
      );

      try {
        final sessionModel = await _remoteDataSource.completeSession(
          sessionId: sessionId,
          notes: notes,
        );

        // Limpiar sesión activa del caché
        await _localDataSource.clearActiveSession();

        final session = sessionModel.toEntity();

        AppLogger.info(
          'MatchSessionRepository: Session completed successfully',
        );

        return Right(session);
      } on ApiException catch (e) {
        AppLogger.error(
          'MatchSessionRepository: API error completing session',
          error: e,
        );
        return Left(_handleApiException(e));
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error completing session',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al completar sesión'));
    }
  }

  @override
  Future<Either<Failure, List<MatchSession>>> getSessions({
    String? status,
    int? matchId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Obtener del servidor
        AppLogger.info(
          'MatchSessionRepository: Getting sessions from server (page: $page)',
        );

        try {
          final sessions = await _remoteDataSource.getSessions(
            status: status,
            matchId: matchId,
            page: page,
            perPage: perPage,
          );

          // Guardar en caché (solo primera página)
          if (page == 1 && status == null && matchId == null) {
            await _localDataSource.saveSessionsHistory(sessions);
          }

          final entities = sessions.map((s) => s.toEntity()).toList();

          AppLogger.info(
            'MatchSessionRepository: Got ${entities.length} sessions from server',
          );

          return Right(entities);
        } on ApiException catch (e) {
          AppLogger.error(
            'MatchSessionRepository: API error getting sessions',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Obtener del caché
        AppLogger.info(
          'MatchSessionRepository: Getting sessions from cache',
        );

        final cachedSessions = _localDataSource.getSessionsHistory();

        if (cachedSessions == null || cachedSessions.isEmpty) {
          return const Right([]);
        }

        final entities = cachedSessions.map((s) => s.toEntity()).toList();

        AppLogger.info(
          'MatchSessionRepository: Got ${entities.length} cached sessions',
        );

        return Right(entities);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionRepository: Unexpected error getting sessions',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al obtener sesiones'));
    }
  }

  /// Convierte ApiException a Failure
  Failure _handleApiException(ApiException exception) {
    if (exception.statusCode == null) {
      return NetworkFailure(exception.message);
    }

    switch (exception.statusCode!) {
      case 400:
        return ValidationFailure(exception.message);
      case 401:
      case 403:
        return ServerFailure(exception.message);
      case 404:
        return NotFoundFailure(exception.message);
      case >= 500:
        return ServerFailure(exception.message);
      default:
        return ServerFailure(exception.message);
    }
  }
}
