/// Endpoints de la API de VolleyPass.
///
/// Todos los endpoints están centralizados aquí para fácil mantenimiento
/// y evitar hardcoding en el código.
///
/// Basado en: API_DOCUMENTATION.MD v1.0.0
library;

class ApiEndpoints {
  ApiEndpoints._();

  // ============================================================================
  // HEALTH CHECK
  // ============================================================================

  static const health = '/health';

  // ============================================================================
  // AUTENTICACIÓN
  // ============================================================================

  static const login = '/auth/login';
  static const checkEmail = '/auth/check-email';
  static const currentUser = '/auth/user';
  static const logout = '/auth/logout';
  static const logoutAll = '/auth/logout-all';
  static const tokens = '/auth/tokens';
  static String revokeToken(int tokenId) => '/auth/tokens/$tokenId';

  // ============================================================================
  // DASHBOARDS
  // ============================================================================

  /// Dashboard unificado (detecta rol automáticamente)
  static const dashboard = '/dashboard';

  /// Dashboard de SuperAdmin
  static const adminDashboard = '/admin/dashboard';

  /// Dashboard de League Admin
  static const leagueDashboard = '/league/dashboard';

  /// Dashboard de Club Admin/Coach
  static const clubDashboard = '/club/dashboard';

  // ============================================================================
  // VERIFICACIÓN QR
  // ============================================================================

  /// Verificación pública (sin auth, requiere scanner_id)
  static const verifyQrPublic = '/verify-qr';

  /// Obtener info de QR sin crear verificación
  static const qrInfo = '/qr-info';

  /// Verificación por token de carnet
  static String verifyCardToken(String token) => '/card/verify/$token';

  /// Verificación por número de carnet
  static String verifyCardNumber(String cardNumber) => '/card/number/$cardNumber';

  /// Detalles de carnet (autenticado)
  static String cardDetails(String token) => '/card/details/$token';

  /// Estadísticas de carnets
  static const cardStats = '/card/stats';

  /// Verificación batch (múltiples QR)
  static const verifyBatch = '/verify-batch';

  /// Dashboard de verificación
  static const verificationDashboard = '/stats/dashboard';

  // ============================================================================
  // VERIFICACIÓN MOBILE (Autenticada)
  // ============================================================================

  /// Verificar QR desde mobile app
  static const mobileVerify = '/mobile/verify';

  /// Historial de verificaciones
  static const mobileVerifications = '/mobile/verifications';

  /// Sincronizar verificaciones offline
  static const mobileVerificationsSync = '/mobile/verifications/sync';

  /// Estadísticas de verificaciones
  static const mobileVerificationsStats = '/mobile/verifications/stats';

  // ============================================================================
  // SESIONES DE PARTIDO
  // ============================================================================

  /// Listar sesiones
  static const mobileSessions = '/mobile/sessions';

  /// Sesión activa
  static const mobileSessionsActive = '/mobile/sessions/active';

  /// Partidos disponibles para sesión
  static const mobileSessionsAvailableMatches = '/mobile/sessions/available-matches';

  /// Detalle de sesión
  static String mobileSessionDetail(int sessionId) => '/mobile/sessions/$sessionId';

  /// Completar sesión
  static String mobileSessionComplete(int sessionId) => '/mobile/sessions/$sessionId/complete';

  /// Sesiones legacy (scanner)
  static const scannerStartSession = '/scanner/start-session';
  static String scannerEndSession(int sessionId) => '/scanner/end-session/$sessionId';

  // ============================================================================
  // TORNEOS PÚBLICOS
  // ============================================================================

  /// Listar torneos públicos
  static const publicTournaments = '/public/tournaments';

  /// Detalle de torneo
  static String publicTournamentDetail(int tournamentId) => '/public/tournaments/$tournamentId';

  /// Tabla de posiciones del torneo
  static String publicTournamentStandings(int tournamentId) => '/public/tournaments/$tournamentId/standings';

  /// Tabla de posiciones por grupo
  static String publicTournamentGroupStandings(int tournamentId, int groupId) =>
      '/public/tournaments/$tournamentId/groups/$groupId/standings';

  // ============================================================================
  // PARTIDOS PÚBLICOS
  // ============================================================================

  /// Partidos programados
  static const publicMatchesScheduled = '/public/matches/scheduled';

  /// Partidos en vivo
  static const publicMatchesLive = '/public/matches/live';

  /// Detalle de partido
  static String publicMatchDetail(int matchId) => '/public/matches/$matchId';

  /// Jugadores de un partido
  static String publicMatchPlayers(int matchId) => '/public/matches/$matchId/players';

  /// Jugadores de un equipo en partido
  static String publicMatchTeamPlayers(int matchId, int teamId) =>
      '/public/matches/$matchId/teams/$teamId/players';

  // ============================================================================
  // PARTIDOS (Autenticado)
  // ============================================================================

  /// Partidos en vivo
  static const matchesLive = '/matches/live';

  /// Datos en tiempo real de partido
  static String matchRealtime(int matchId) => '/matches/$matchId/realtime';

  /// Iniciar partido
  static String matchStart(int matchId) => '/matches/$matchId/start';

  /// Finalizar partido
  static String matchFinish(int matchId) => '/matches/$matchId/finish';

  /// Iniciar nuevo set
  static String matchSetStart(int matchId) => '/matches/$matchId/sets/start';

  /// Finalizar set
  static String matchSetFinish(int matchId) => '/matches/$matchId/sets/finish';

  /// Actualizar marcador de set
  static String matchScore(int matchId) => '/matches/$matchId/score';

  /// Actualizar rotación
  static String matchRotation(int matchId) => '/matches/$matchId/rotation';

  /// Agregar evento de partido
  static String matchEvents(int matchId) => '/matches/$matchId/events';

  /// Estado de partido
  static String matchStatus(int matchId) => '/matches/$matchId/status';

  // ============================================================================
  // PERFIL DE USUARIO
  // ============================================================================

  /// Obtener perfil propio
  static const userProfile = '/users/profile';

  /// Actualizar perfil propio
  static const userProfileUpdate = '/users/profile';

  /// Obtener perfil público de usuario
  static String userPublicProfile(int userId) => '/users/$userId/profile';

  // ============================================================================
  // PÚBLICO
  // ============================================================================

  /// Estado de jugador por número de carnet
  static String publicPlayerStatus(String cardNumber) => '/public/player-status/$cardNumber';

  /// Estadísticas de liga
  static const publicLeagueStats = '/public/league-stats';
}
