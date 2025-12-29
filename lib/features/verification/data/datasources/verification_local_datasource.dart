/// Datasource local para verificaciones.
///
/// Maneja el almacenamiento local de verificaciones, incluyendo
/// las verificaciones pendientes de sincronización (offline).
library;

import '../../../../core/storage/offline_storage.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/verification_response_model.dart';

/// Interface del datasource local
abstract class VerificationLocalDataSource {
  Future<void> savePendingVerification(Map<String, dynamic> verification);
  List<Map<String, dynamic>> getPendingVerifications();
  Future<void> removePendingVerification(int index);
  Future<void> clearPendingVerifications();
  Future<void> saveVerificationHistory(List<VerificationResponseModel> verifications);
  List<VerificationResponseModel>? getVerificationHistory();
}

/// Implementación del datasource local
class VerificationLocalDataSourceImpl implements VerificationLocalDataSource {
  final OfflineStorage _offlineStorage;

  VerificationLocalDataSourceImpl(this._offlineStorage);

  @override
  Future<void> savePendingVerification(
    Map<String, dynamic> verification,
  ) async {
    try {
      AppLogger.info(
        'VerificationLocalDataSource: Saving pending verification',
      );
      await _offlineStorage.savePendingVerification(verification);
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationLocalDataSource: Error saving pending verification',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  List<Map<String, dynamic>> getPendingVerifications() {
    try {
      final pending = _offlineStorage.getPendingVerifications();
      AppLogger.debug(
        'VerificationLocalDataSource: Got ${pending.length} pending verifications',
      );
      return pending;
    } catch (e) {
      AppLogger.error(
        'VerificationLocalDataSource: Error getting pending verifications',
        error: e,
      );
      return [];
    }
  }

  @override
  Future<void> removePendingVerification(int index) async {
    try {
      AppLogger.info(
        'VerificationLocalDataSource: Removing pending verification at index $index',
      );
      await _offlineStorage.removePendingVerification(index);
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationLocalDataSource: Error removing pending verification',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clearPendingVerifications() async {
    try {
      AppLogger.info(
        'VerificationLocalDataSource: Clearing all pending verifications',
      );
      await _offlineStorage.clearPendingVerifications();
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationLocalDataSource: Error clearing pending verifications',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> saveVerificationHistory(
    List<VerificationResponseModel> verifications,
  ) async {
    try {
      AppLogger.info(
        'VerificationLocalDataSource: Saving ${verifications.length} verifications to cache',
      );

      final jsonList = verifications.map((v) => v.toJson()).toList();
      await _offlineStorage.cacheValue('verification_history', jsonList);
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationLocalDataSource: Error saving verification history',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  @override
  List<VerificationResponseModel>? getVerificationHistory() {
    try {
      final cachedData = _offlineStorage.getCachedValue<List<dynamic>>(
        'verification_history',
      );

      if (cachedData == null) {
        AppLogger.debug(
          'VerificationLocalDataSource: No cached verification history',
        );
        return null;
      }

      final verifications = cachedData
          .map((v) => VerificationResponseModel.fromJson(
                v as Map<String, dynamic>,
              ))
          .toList();

      AppLogger.debug(
        'VerificationLocalDataSource: Got ${verifications.length} cached verifications',
      );

      return verifications;
    } catch (e) {
      AppLogger.error(
        'VerificationLocalDataSource: Error getting cached verification history',
        error: e,
      );
      return null;
    }
  }
}
