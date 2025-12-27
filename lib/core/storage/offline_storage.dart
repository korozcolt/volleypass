/// Almacenamiento offline para datos en caché.
///
/// Wrapper sobre Hive para almacenar datos localmente y soportar
/// funcionalidad offline-first.
library;

import 'package:hive_flutter/hive_flutter.dart';
import '../utils/app_logger.dart';

class OfflineStorage {
  /// Nombres de las cajas de Hive
  static const String _sessionsBox = 'sessions';
  static const String _tournamentsBox = 'tournaments';
  static const String _matchesBox = 'matches';
  static const String _verificationsBox = 'verifications';
  static const String _profileBox = 'profile';
  static const String _cacheBox = 'cache';

  /// Inicializa Hive y abre todas las cajas necesarias
  Future<void> init() async {
    try {
      // Inicializar Hive para Flutter
      await Hive.initFlutter();

      // Abrir todas las cajas necesarias
      await Future.wait([
        Hive.openBox(_sessionsBox),
        Hive.openBox(_tournamentsBox),
        Hive.openBox(_matchesBox),
        Hive.openBox(_verificationsBox),
        Hive.openBox(_profileBox),
        Hive.openBox(_cacheBox),
      ]);

      AppLogger.info('OfflineStorage: Initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error initializing',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // ============================================================================
  // SESSIONS
  // ============================================================================

  /// Guarda sesiones en caché
  Future<void> saveSessions(List<Map<String, dynamic>> sessions) async {
    try {
      final box = Hive.box(_sessionsBox);
      await box.put('data', sessions);
      await box.put('timestamp', DateTime.now().toIso8601String());
      AppLogger.debug('OfflineStorage: Saved ${sessions.length} sessions');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error saving sessions',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene sesiones del caché
  List<Map<String, dynamic>>? getSessions() {
    try {
      final box = Hive.box(_sessionsBox);
      final data = box.get('data');
      if (data == null) return null;

      return List<Map<String, dynamic>>.from(data);
    } catch (e) {
      AppLogger.error('OfflineStorage: Error getting sessions', error: e);
      return null;
    }
  }

  /// Verifica si las sesiones en caché están actualizadas
  bool isSessionsCacheFresh({Duration maxAge = const Duration(minutes: 5)}) {
    try {
      final box = Hive.box(_sessionsBox);
      final timestampStr = box.get('timestamp');
      if (timestampStr == null) return false;

      final timestamp = DateTime.parse(timestampStr);
      final age = DateTime.now().difference(timestamp);
      return age < maxAge;
    } catch (e) {
      return false;
    }
  }

  // ============================================================================
  // TOURNAMENTS
  // ============================================================================

  /// Guarda torneos en caché
  Future<void> saveTournaments(List<Map<String, dynamic>> tournaments) async {
    try {
      final box = Hive.box(_tournamentsBox);
      await box.put('data', tournaments);
      await box.put('timestamp', DateTime.now().toIso8601String());
      AppLogger.debug('OfflineStorage: Saved ${tournaments.length} tournaments');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error saving tournaments',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene torneos del caché
  List<Map<String, dynamic>>? getTournaments() {
    try {
      final box = Hive.box(_tournamentsBox);
      final data = box.get('data');
      if (data == null) return null;

      return List<Map<String, dynamic>>.from(data);
    } catch (e) {
      AppLogger.error('OfflineStorage: Error getting tournaments', error: e);
      return null;
    }
  }

  // ============================================================================
  // MATCHES
  // ============================================================================

  /// Guarda partidos en caché
  Future<void> saveMatches(List<Map<String, dynamic>> matches) async {
    try {
      final box = Hive.box(_matchesBox);
      await box.put('data', matches);
      await box.put('timestamp', DateTime.now().toIso8601String());
      AppLogger.debug('OfflineStorage: Saved ${matches.length} matches');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error saving matches',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene partidos del caché
  List<Map<String, dynamic>>? getMatches() {
    try {
      final box = Hive.box(_matchesBox);
      final data = box.get('data');
      if (data == null) return null;

      return List<Map<String, dynamic>>.from(data);
    } catch (e) {
      AppLogger.error('OfflineStorage: Error getting matches', error: e);
      return null;
    }
  }

  // ============================================================================
  // VERIFICATIONS (Pending sync)
  // ============================================================================

  /// Guarda una verificación pendiente de sincronizar
  Future<void> savePendingVerification(
    Map<String, dynamic> verification,
  ) async {
    try {
      final box = Hive.box(_verificationsBox);
      final pending = getPendingVerifications();
      pending.add(verification);
      await box.put('pending', pending);
      AppLogger.info(
        'OfflineStorage: Saved pending verification (${pending.length} total)',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error saving pending verification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene verificaciones pendientes de sincronizar
  List<Map<String, dynamic>> getPendingVerifications() {
    try {
      final box = Hive.box(_verificationsBox);
      final data = box.get('pending');
      if (data == null) return [];

      return List<Map<String, dynamic>>.from(data);
    } catch (e) {
      AppLogger.error(
        'OfflineStorage: Error getting pending verifications',
        error: e,
      );
      return [];
    }
  }

  /// Limpia verificaciones pendientes después de sincronizar
  Future<void> clearPendingVerifications() async {
    try {
      final box = Hive.box(_verificationsBox);
      await box.delete('pending');
      AppLogger.info('OfflineStorage: Cleared pending verifications');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error clearing pending verifications',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Elimina una verificación pendiente específica
  Future<void> removePendingVerification(int index) async {
    try {
      final box = Hive.box(_verificationsBox);
      final pending = getPendingVerifications();
      if (index >= 0 && index < pending.length) {
        pending.removeAt(index);
        await box.put('pending', pending);
        AppLogger.debug('OfflineStorage: Removed pending verification at $index');
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error removing pending verification',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  // ============================================================================
  // PROFILE
  // ============================================================================

  /// Guarda perfil del usuario en caché
  Future<void> saveProfile(Map<String, dynamic> profile) async {
    try {
      final box = Hive.box(_profileBox);
      await box.put('data', profile);
      await box.put('timestamp', DateTime.now().toIso8601String());
      AppLogger.debug('OfflineStorage: Saved user profile');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error saving profile',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene perfil del usuario del caché
  Map<String, dynamic>? getProfile() {
    try {
      final box = Hive.box(_profileBox);
      final data = box.get('data');
      if (data == null) return null;

      return Map<String, dynamic>.from(data);
    } catch (e) {
      AppLogger.error('OfflineStorage: Error getting profile', error: e);
      return null;
    }
  }

  // ============================================================================
  // GENERIC CACHE
  // ============================================================================

  /// Guarda un valor genérico en caché
  Future<void> cacheValue(String key, dynamic value) async {
    try {
      final box = Hive.box(_cacheBox);
      await box.put(key, value);
      await box.put('${key}_timestamp', DateTime.now().toIso8601String());
      AppLogger.debug('OfflineStorage: Cached value for $key');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error caching value for $key',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Obtiene un valor genérico del caché
  T? getCachedValue<T>(String key) {
    try {
      final box = Hive.box(_cacheBox);
      return box.get(key) as T?;
    } catch (e) {
      AppLogger.error(
        'OfflineStorage: Error getting cached value for $key',
        error: e,
      );
      return null;
    }
  }

  /// Verifica si un valor en caché está actualizado
  bool isCacheFresh(String key, {Duration maxAge = const Duration(minutes: 5)}) {
    try {
      final box = Hive.box(_cacheBox);
      final timestampStr = box.get('${key}_timestamp');
      if (timestampStr == null) return false;

      final timestamp = DateTime.parse(timestampStr);
      final age = DateTime.now().difference(timestamp);
      return age < maxAge;
    } catch (e) {
      return false;
    }
  }

  // ============================================================================
  // UTILITIES
  // ============================================================================

  /// Limpia todos los datos offline
  Future<void> clearAll() async {
    try {
      await Future.wait([
        Hive.box(_sessionsBox).clear(),
        Hive.box(_tournamentsBox).clear(),
        Hive.box(_matchesBox).clear(),
        Hive.box(_verificationsBox).clear(),
        Hive.box(_profileBox).clear(),
        Hive.box(_cacheBox).clear(),
      ]);
      AppLogger.info('OfflineStorage: Cleared all data');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error clearing all data',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Obtiene el tamaño total del almacenamiento offline (en bytes)
  Future<int> getTotalSize() async {
    try {
      int totalSize = 0;
      final boxes = [
        _sessionsBox,
        _tournamentsBox,
        _matchesBox,
        _verificationsBox,
        _profileBox,
        _cacheBox,
      ];

      for (final boxName in boxes) {
        final box = Hive.box(boxName);
        totalSize += box.length;
      }

      return totalSize;
    } catch (e) {
      AppLogger.error('OfflineStorage: Error getting total size', error: e);
      return 0;
    }
  }

  /// Cierra todas las cajas (útil al cerrar la app)
  Future<void> close() async {
    try {
      await Hive.close();
      AppLogger.info('OfflineStorage: Closed all boxes');
    } catch (e, stackTrace) {
      AppLogger.error(
        'OfflineStorage: Error closing boxes',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
