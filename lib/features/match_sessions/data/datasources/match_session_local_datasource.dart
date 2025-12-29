/// Datasource local para sesiones de partido.
///
/// Maneja el almacenamiento local de sesiones, incluyendo la sesión activa
/// y el historial de sesiones en caché.
library;

import '../../../../core/storage/offline_storage.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/available_match_model.dart';
import '../models/match_session_model.dart';
import '../models/session_detail_response_model.dart';

/// Interface del datasource local
abstract class MatchSessionLocalDataSource {
  // Active Session Cache
  Future<void> saveActiveSession(MatchSessionModel? session);
  MatchSessionModel? getActiveSession();
  Future<void> clearActiveSession();

  // Available Matches Cache
  Future<void> saveAvailableMatches(List<AvailableMatchModel> matches);
  List<AvailableMatchModel>? getAvailableMatches();

  // Sessions History Cache
  Future<void> saveSessionsHistory(List<MatchSessionModel> sessions);
  List<MatchSessionModel>? getSessionsHistory();

  // Session Details Cache
  Future<void> saveSessionDetails(int sessionId, SessionDetailResponseModel details);
  SessionDetailResponseModel? getSessionDetails(int sessionId);
}

/// Implementación del datasource local
class MatchSessionLocalDataSourceImpl implements MatchSessionLocalDataSource {
  final OfflineStorage _offlineStorage;

  MatchSessionLocalDataSourceImpl(this._offlineStorage);

  // ============================================================================
  // ACTIVE SESSION CACHE
  // ============================================================================

  @override
  Future<void> saveActiveSession(MatchSessionModel? session) async {
    try {
      AppLogger.info(
        'MatchSessionLocalDataSource: Saving active session to cache',
      );

      if (session == null) {
        await _offlineStorage.cacheValue('active_session', null);
      } else {
        await _offlineStorage.cacheValue('active_session', session.toJson());
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error saving active session',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  @override
  MatchSessionModel? getActiveSession() {
    try {
      final cachedData = _offlineStorage.getCachedValue<Map<String, dynamic>>(
        'active_session',
      );

      if (cachedData == null) {
        AppLogger.debug(
          'MatchSessionLocalDataSource: No cached active session',
        );
        return null;
      }

      AppLogger.debug(
        'MatchSessionLocalDataSource: Got cached active session',
      );

      return MatchSessionModel.fromJson(cachedData);
    } catch (e) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error getting cached active session',
        error: e,
      );
      return null;
    }
  }

  @override
  Future<void> clearActiveSession() async {
    try {
      AppLogger.info(
        'MatchSessionLocalDataSource: Clearing active session cache',
      );
      await _offlineStorage.cacheValue('active_session', null);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error clearing active session',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  // ============================================================================
  // AVAILABLE MATCHES CACHE
  // ============================================================================

  @override
  Future<void> saveAvailableMatches(List<AvailableMatchModel> matches) async {
    try {
      AppLogger.info(
        'MatchSessionLocalDataSource: Saving ${matches.length} available matches to cache',
      );

      final jsonList = matches.map((m) => m.toJson()).toList();
      await _offlineStorage.cacheValue('available_matches', jsonList);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error saving available matches',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  @override
  List<AvailableMatchModel>? getAvailableMatches() {
    try {
      final cachedData = _offlineStorage.getCachedValue<List<dynamic>>(
        'available_matches',
      );

      if (cachedData == null) {
        AppLogger.debug(
          'MatchSessionLocalDataSource: No cached available matches',
        );
        return null;
      }

      final matches = cachedData
          .map((m) => AvailableMatchModel.fromJson(
                m as Map<String, dynamic>,
              ))
          .toList();

      AppLogger.debug(
        'MatchSessionLocalDataSource: Got ${matches.length} cached available matches',
      );

      return matches;
    } catch (e) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error getting cached available matches',
        error: e,
      );
      return null;
    }
  }

  // ============================================================================
  // SESSIONS HISTORY CACHE
  // ============================================================================

  @override
  Future<void> saveSessionsHistory(List<MatchSessionModel> sessions) async {
    try {
      AppLogger.info(
        'MatchSessionLocalDataSource: Saving ${sessions.length} sessions to cache',
      );

      final jsonList = sessions.map((s) => s.toJson()).toList();
      await _offlineStorage.cacheValue('sessions_history', jsonList);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error saving sessions history',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  @override
  List<MatchSessionModel>? getSessionsHistory() {
    try {
      final cachedData = _offlineStorage.getCachedValue<List<dynamic>>(
        'sessions_history',
      );

      if (cachedData == null) {
        AppLogger.debug(
          'MatchSessionLocalDataSource: No cached sessions history',
        );
        return null;
      }

      final sessions = cachedData
          .map((s) => MatchSessionModel.fromJson(
                s as Map<String, dynamic>,
              ))
          .toList();

      AppLogger.debug(
        'MatchSessionLocalDataSource: Got ${sessions.length} cached sessions',
      );

      return sessions;
    } catch (e) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error getting cached sessions history',
        error: e,
      );
      return null;
    }
  }

  // ============================================================================
  // SESSION DETAILS CACHE
  // ============================================================================

  @override
  Future<void> saveSessionDetails(
    int sessionId,
    SessionDetailResponseModel details,
  ) async {
    try {
      AppLogger.info(
        'MatchSessionLocalDataSource: Saving session details for session $sessionId to cache',
      );

      await _offlineStorage.cacheValue(
        'session_details_$sessionId',
        details.toJson(),
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error saving session details',
        error: e,
        stackTrace: stackTrace,
      );
      // No rethrow - el caché no es crítico
    }
  }

  @override
  SessionDetailResponseModel? getSessionDetails(int sessionId) {
    try {
      final cachedData = _offlineStorage.getCachedValue<Map<String, dynamic>>(
        'session_details_$sessionId',
      );

      if (cachedData == null) {
        AppLogger.debug(
          'MatchSessionLocalDataSource: No cached session details for session $sessionId',
        );
        return null;
      }

      AppLogger.debug(
        'MatchSessionLocalDataSource: Got cached session details for session $sessionId',
      );

      return SessionDetailResponseModel.fromJson(cachedData);
    } catch (e) {
      AppLogger.error(
        'MatchSessionLocalDataSource: Error getting cached session details',
        error: e,
      );
      return null;
    }
  }
}
