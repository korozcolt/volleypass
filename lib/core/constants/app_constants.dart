/// Constantes generales de la aplicación.
///
/// Define constantes que no cambian entre entornos y son
/// parte del comportamiento de la aplicación.
library;

class AppConstants {
  AppConstants._();

  // ============================================================================
  // APP INFO
  // ============================================================================

  static const String appVersion = '1.0.0';
  static const int appBuildNumber = 1;

  // ============================================================================
  // STORAGE KEYS
  // ============================================================================

  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String tokenExpiryKey = 'token_expiry';
  static const String cachedUserKey = 'cached_user';
  static const String lastSyncKey = 'last_sync';
  static const String pendingVerificationsKey = 'pending_verifications';

  // ============================================================================
  // HIVE BOXES
  // ============================================================================

  static const String verificationsBox = 'verifications';
  static const String playersBox = 'players';
  static const String matchesBox = 'matches';
  static const String tournamentsBox = 'tournaments';
  static const String settingsBox = 'settings';

  // ============================================================================
  // VALIDATION
  // ============================================================================

  /// Regex para validar email sin acentos (requerido por API)
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Regex para validar código QR (64 caracteres hexadecimales - SHA-256)
  static final RegExp qrCodeRegex = RegExp(r'^[a-fA-F0-9]{64}$');

  /// Longitud mínima de contraseña
  static const int minPasswordLength = 6;

  /// Máxima longitud de campos de texto
  static const int maxTextFieldLength = 500;

  /// Máxima longitud de nombre
  static const int maxNameLength = 100;

  /// Máxima longitud de descripción
  static const int maxDescriptionLength = 1000;

  // ============================================================================
  // PAGINATION
  // ============================================================================

  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // ============================================================================
  // TIMEOUTS
  // ============================================================================

  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration debounceDelay = Duration(milliseconds: 500);
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const Duration errorSnackBarDuration = Duration(seconds: 5);

  // ============================================================================
  // QR SCANNING
  // ============================================================================

  static const Duration qrScanDebounce = Duration(milliseconds: 500);
  static const int maxQrRetries = 3;

  // ============================================================================
  // OFFLINE SYNC
  // ============================================================================

  static const int maxOfflineVerifications = 1000;
  static const Duration syncCheckInterval = Duration(minutes: 1);
  static const Duration forceSyncInterval = Duration(hours: 6);

  // ============================================================================
  // VERIFICATION
  // ============================================================================

  /// Códigos de error de verificación
  static const String errorCardNotFound = 'CARD_NOT_FOUND';
  static const String errorCardExpired = 'CARD_EXPIRED';
  static const String errorCardSuspended = 'CARD_SUSPENDED';
  static const String errorCardInactive = 'CARD_INACTIVE';
  static const String errorPlayerSanctioned = 'PLAYER_SANCTIONED';
  static const String errorMedicalExpired = 'MEDICAL_EXPIRED';
  static const String errorSystemError = 'SYSTEM_ERROR';

  /// Resultados de verificación
  static const String resultEligible = 'eligible';
  static const String resultRestricted = 'restricted';
  static const String resultNotEligible = 'not_eligible';

  // ============================================================================
  // MATCH STATUS
  // ============================================================================

  static const String matchStatusScheduled = 'scheduled';
  static const String matchStatusInProgress = 'in_progress';
  static const String matchStatusFinished = 'finished';
  static const String matchStatusCancelled = 'cancelled';
  static const String matchStatusPostponed = 'postponed';

  // ============================================================================
  // TOURNAMENT STATUS
  // ============================================================================

  static const String tournamentStatusScheduled = 'scheduled';
  static const String tournamentStatusInProgress = 'in_progress';
  static const String tournamentStatusFinished = 'finished';

  // ============================================================================
  // SESSION STATUS
  // ============================================================================

  static const String sessionStatusActive = 'active';
  static const String sessionStatusPaused = 'paused';
  static const String sessionStatusCompleted = 'completed';

  // ============================================================================
  // DATE FORMATS
  // ============================================================================

  static const String dateFormatDisplay = 'dd/MM/yyyy';
  static const String dateTimeFormatDisplay = 'dd/MM/yyyy HH:mm';
  static const String timeFormatDisplay = 'HH:mm';
  static const String dateFormatApi = 'yyyy-MM-dd';
  static const String dateTimeFormatApi = "yyyy-MM-dd'T'HH:mm:ss'Z'";

  // ============================================================================
  // ERROR MESSAGES
  // ============================================================================

  static const String errorGeneric = 'Ocurrió un error. Por favor intenta de nuevo.';
  static const String errorNetwork = 'Sin conexión a internet. Verifica tu conexión.';
  static const String errorTimeout = 'La operación tardó demasiado. Intenta de nuevo.';
  static const String errorUnauthorized = 'Sesión expirada. Por favor inicia sesión nuevamente.';
  static const String errorForbidden = 'No tienes permisos para realizar esta acción.';
  static const String errorNotFound = 'No se encontró el recurso solicitado.';
  static const String errorServerError = 'Error del servidor. Por favor intenta más tarde.';

  // ============================================================================
  // SUCCESS MESSAGES
  // ============================================================================

  static const String successSaved = 'Guardado exitosamente';
  static const String successUpdated = 'Actualizado exitosamente';
  static const String successDeleted = 'Eliminado exitosamente';
  static const String successSynced = 'Sincronizado exitosamente';
  static const String successLogin = 'Inicio de sesión exitoso';
  static const String successLogout = 'Sesión cerrada exitosamente';

  // ============================================================================
  // BLOOD TYPES
  // ============================================================================

  static const List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  // ============================================================================
  // T-SHIRT SIZES
  // ============================================================================

  static const List<String> tShirtSizes = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  // ============================================================================
  // ROLES
  // ============================================================================

  static const String roleSuperAdmin = 'SuperAdmin';
  static const String roleLeagueAdmin = 'LeagueAdmin';
  static const String roleVerifier = 'Verifier';
  static const String roleReferee = 'Referee';
  static const String roleCoach = 'Coach';
  static const String roleClubAdmin = 'ClubAdmin';
  static const String rolePlayer = 'Player';

  // ============================================================================
  // ABILITIES
  // ============================================================================

  static const String abilityVerify = 'verify';
  static const String abilityVerifyQr = 'verify:qr';
  static const String abilityVerifyBatch = 'verify:batch';
  static const String abilityViewStats = 'view:stats';
  static const String abilityManageEvents = 'manage:events';
  static const String abilityManageMatches = 'manage:matches';
  static const String abilityAddSanctions = 'add:sanctions';
  static const String abilityViewTeam = 'view:team';
  static const String abilityViewPlayers = 'view:players';
  static const String abilityManageClub = 'manage:club';
  static const String abilityViewProfile = 'view:profile';
}
