/// Implementación del repositorio de verificación.
///
/// Coordina entre el datasource remoto y local para implementar
/// la lógica de verificación offline-first.
library;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/verification.dart';
import '../../domain/entities/verification_request.dart';
import '../../domain/repositories/verification_repository.dart';
import '../datasources/verification_local_datasource.dart';
import '../datasources/verification_remote_datasource.dart';
import '../models/verification_model.dart';
import '../models/player_model.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationRemoteDataSource _remoteDataSource;
  final VerificationLocalDataSource _localDataSource;
  final Connectivity _connectivity;

  VerificationRepositoryImpl({
    required VerificationRemoteDataSource remoteDataSource,
    required VerificationLocalDataSource localDataSource,
    required Connectivity connectivity,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _connectivity = connectivity;

  @override
  Future<Either<Failure, VerificationResultData>> verifyQR(
    VerificationRequest request,
  ) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Verificación online
        AppLogger.info('VerificationRepository: Verifying online');

        try {
          final response = await _remoteDataSource.verifyQR(request);
          final resultData = response.toResultData();

          // Guardar en caché
          await _localDataSource.saveVerificationHistory([response]);

          AppLogger.info(
            'VerificationRepository: Online verification successful - ${resultData.verification.result}',
          );

          return Right(resultData);
        } on ApiException catch (e) {
          AppLogger.error(
            'VerificationRepository: API error during verification',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Verificación offline
        AppLogger.info('VerificationRepository: Verifying offline');

        // Crear verificación offline temporal
        final offlineVerification = VerificationModel(
          id: DateTime.now().millisecondsSinceEpoch,
          result: 'eligible', // Asumir elegible offline (se validará al sincronizar)
          restrictionReason: null,
          verifiedAt: DateTime.now().toIso8601String(),
          sessionId: request.matchSessionId,
          isOffline: true,
        );

        // Crear jugador temporal (datos mínimos)
        final offlinePlayer = PlayerModel(
          id: 0,
          cardNumber: request.qrCode.substring(0, 8),
          fullName: 'Verificación Offline',
          birthDate: DateTime.now().toIso8601String(),
          age: 0,
          gender: 'unknown',
          position: 'N/A',
          category: 'N/A',
          clubName: 'N/A',
          isActive: true,
          licenseNumber: 'N/A',
        );

        // Guardar en pending
        await _localDataSource.savePendingVerification({
          'qr_code': request.qrCode,
          'match_session_id': request.matchSessionId,
          'device_info': request.deviceInfo,
          'location': request.location?.toJson(),
          'verified_at': DateTime.now().toIso8601String(),
        });

        AppLogger.info('VerificationRepository: Saved offline verification');

        return Right(
          VerificationResultData(
            verification: offlineVerification.toEntity(),
            player: offlinePlayer.toEntity(),
          ),
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationRepository: Unexpected error during verification',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado durante la verificación'));
    }
  }

  @override
  Future<Either<Failure, List<VerificationResultData>>> getVerificationHistory({
    String? result,
    String? date,
    int? matchSessionId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (isOnline) {
        // Obtener del servidor
        AppLogger.info('VerificationRepository: Getting history from server');

        try {
          final responses = await _remoteDataSource.getVerificationHistory(
            result: result,
            date: date,
            matchSessionId: matchSessionId,
            page: page,
            perPage: perPage,
          );

          // Guardar en caché
          await _localDataSource.saveVerificationHistory(responses);

          final resultDataList = responses.map((r) => r.toResultData()).toList();

          AppLogger.info(
            'VerificationRepository: Got ${resultDataList.length} verifications from server',
          );

          return Right(resultDataList);
        } on ApiException catch (e) {
          AppLogger.error(
            'VerificationRepository: API error getting history',
            error: e,
          );
          return Left(_handleApiException(e));
        }
      } else {
        // Obtener del caché
        AppLogger.info('VerificationRepository: Getting history from cache');

        final cachedResponses = _localDataSource.getVerificationHistory();

        if (cachedResponses == null || cachedResponses.isEmpty) {
          return const Right([]);
        }

        final resultDataList =
            cachedResponses.map((r) => r.toResultData()).toList();

        AppLogger.info(
          'VerificationRepository: Got ${resultDataList.length} cached verifications',
        );

        return Right(resultDataList);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationRepository: Unexpected error getting history',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado al obtener historial'));
    }
  }

  @override
  Future<Either<Failure, bool>> syncPendingVerifications() async {
    try {
      // Verificar conectividad
      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (!isOnline) {
        AppLogger.info('VerificationRepository: Cannot sync - offline');
        return const Left(
          NetworkFailure('No hay conexión para sincronizar'),
        );
      }

      // Obtener pending verifications
      final pendingVerifications = _localDataSource.getPendingVerifications();

      if (pendingVerifications.isEmpty) {
        AppLogger.info('VerificationRepository: No pending verifications to sync');
        return const Right(true);
      }

      AppLogger.info(
        'VerificationRepository: Syncing ${pendingVerifications.length} pending verifications',
      );

      try {
        // Sincronizar con el servidor
        final result = await _remoteDataSource.syncVerifications(
          pendingVerifications,
        );

        final syncedCount = result['synced_count'] as int;
        final failedCount = result['failed_count'] as int;

        AppLogger.info(
          'VerificationRepository: Sync completed - $syncedCount synced, $failedCount failed',
        );

        // Limpiar pending si todo fue exitoso
        if (failedCount == 0) {
          await _localDataSource.clearPendingVerifications();
        }

        return Right(syncedCount > 0);
      } on ApiException catch (e) {
        AppLogger.error(
          'VerificationRepository: API error during sync',
          error: e,
        );
        return Left(_handleApiException(e));
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationRepository: Unexpected error during sync',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('Error inesperado durante la sincronización'));
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getPendingVerifications() async {
    return _localDataSource.getPendingVerifications();
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
