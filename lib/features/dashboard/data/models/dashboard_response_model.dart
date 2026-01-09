/// Modelos de respuesta del dashboard con Freezed.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/super_admin_dashboard.dart';
import '../../domain/entities/club_dashboard.dart';
import '../../domain/entities/league_dashboard.dart';
import '../../domain/entities/verifier_dashboard.dart';
import '../../domain/entities/dashboard_response.dart';

part 'dashboard_response_model.freezed.dart';
part 'dashboard_response_model.g.dart';

/// Modelo base de respuesta del dashboard
@freezed
class DashboardResponseModel with _$DashboardResponseModel {
  const factory DashboardResponseModel({
    required bool success,
    required String role,
    required Map<String, dynamic> data,
    required String timestamp,
    String? message,
    @JsonKey(name: 'redirect_to') String? redirectTo,
  }) = _DashboardResponseModel;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
}

/// Convertir a entidad según el rol
extension DashboardResponseModelX on DashboardResponseModel {
  DashboardResponse toEntity() {
    final parsedTimestamp = DateTime.parse(timestamp);

    switch (role) {
      case 'SuperAdmin':
        return SuperAdminDashboardModel.fromJson({
          'role': role,
          'timestamp': timestamp,
          ...data,
        }).toEntity();

      case 'LeagueAdmin':
        return LeagueDashboardModel.fromJson({
          'role': role,
          'timestamp': timestamp,
          ...data,
        }).toEntity();

      case 'ClubAdmin':
      case 'Coach':
        return ClubDashboardModel.fromJson({
          'role': role,
          'timestamp': timestamp,
          ...data,
        }).toEntity();

      case 'Verifier':
        return VerifierDashboardModel.fromJson({
          'role': role,
          'timestamp': timestamp,
          ...data,
        }).toEntity();

      default:
        throw Exception('Rol de dashboard no soportado: $role');
    }
  }
}

// ============================================================================
// SUPER ADMIN DASHBOARD MODEL
// ============================================================================

@freezed
class SuperAdminDashboardModel with _$SuperAdminDashboardModel {
  const factory SuperAdminDashboardModel({
    required String role,
    required String timestamp,
    required UserMetricsModel users,
    required SubscriptionMetricsModel subscriptions,
    @JsonKey(name: 'system_metrics') required SystemMetricsModel systemMetrics,
    required RevenueMetricsModel revenue,
    @JsonKey(name: 'recent_activity') RecentActivityModel? recentActivity,
  }) = _SuperAdminDashboardModel;

  factory SuperAdminDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminDashboardModelFromJson(json);
}

extension SuperAdminDashboardModelX on SuperAdminDashboardModel {
  SuperAdminDashboard toEntity() {
    return SuperAdminDashboard(
      role: role,
      timestamp: DateTime.parse(timestamp),
      users: users.toEntity(),
      subscriptions: subscriptions.toEntity(),
      systemMetrics: systemMetrics.toEntity(),
      revenue: revenue.toEntity(),
      recentActivity: recentActivity?.toEntity(),
    );
  }
}

@freezed
class UserMetricsModel with _$UserMetricsModel {
  const factory UserMetricsModel({
    required int total,
    required int active,
    required int inactive,
    @JsonKey(name: 'new_last_30_days') required int newLast30Days,
    @JsonKey(name: 'by_role') required Map<String, int> byRole,
  }) = _UserMetricsModel;

  factory UserMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$UserMetricsModelFromJson(json);
}

extension UserMetricsModelX on UserMetricsModel {
  UserMetrics toEntity() => UserMetrics(
    total: total,
    active: active,
    inactive: inactive,
    newLast30Days: newLast30Days,
    byRole: byRole,
  );
}

@freezed
class SubscriptionMetricsModel with _$SubscriptionMetricsModel {
  const factory SubscriptionMetricsModel({
    required int active,
    required int expired,
    @JsonKey(name: 'expiring_soon_7_days') required int expiringSoon7Days,
    @JsonKey(name: 'past_due') required int pastDue,
    required int suspended,
    required int total,
  }) = _SubscriptionMetricsModel;

  factory SubscriptionMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMetricsModelFromJson(json);
}

extension SubscriptionMetricsModelX on SubscriptionMetricsModel {
  SubscriptionMetrics toEntity() => SubscriptionMetrics(
    active: active,
    expired: expired,
    expiringSoon7Days: expiringSoon7Days,
    pastDue: pastDue,
    suspended: suspended,
    total: total,
  );
}

@freezed
class SystemMetricsModel with _$SystemMetricsModel {
  const factory SystemMetricsModel({
    required VerificationMetricsModel verifications,
    required MatchMetricsModel matches,
    required ClubMetricsModel clubs,
  }) = _SystemMetricsModel;

  factory SystemMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$SystemMetricsModelFromJson(json);
}

extension SystemMetricsModelX on SystemMetricsModel {
  SystemMetrics toEntity() => SystemMetrics(
    verifications: verifications.toEntity(),
    matches: matches.toEntity(),
    clubs: clubs.toEntity(),
  );
}

@freezed
class VerificationMetricsModel with _$VerificationMetricsModel {
  const factory VerificationMetricsModel({
    required int total,
    required int today,
    @JsonKey(name: 'this_month') required int thisMonth,
  }) = _VerificationMetricsModel;

  factory VerificationMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationMetricsModelFromJson(json);
}

extension VerificationMetricsModelX on VerificationMetricsModel {
  VerificationMetrics toEntity() =>
      VerificationMetrics(total: total, today: today, thisMonth: thisMonth);
}

@freezed
class MatchMetricsModel with _$MatchMetricsModel {
  const factory MatchMetricsModel({
    required int total,
    required int completed,
    @JsonKey(name: 'in_progress') required int inProgress,
    required int scheduled,
  }) = _MatchMetricsModel;

  factory MatchMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$MatchMetricsModelFromJson(json);
}

extension MatchMetricsModelX on MatchMetricsModel {
  MatchMetrics toEntity() => MatchMetrics(
    total: total,
    completed: completed,
    inProgress: inProgress,
    scheduled: scheduled,
  );
}

@freezed
class ClubMetricsModel with _$ClubMetricsModel {
  const factory ClubMetricsModel({
    required int total,
    required int active,
    required int inactive,
  }) = _ClubMetricsModel;

  factory ClubMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$ClubMetricsModelFromJson(json);
}

extension ClubMetricsModelX on ClubMetricsModel {
  ClubMetrics toEntity() =>
      ClubMetrics(total: total, active: active, inactive: inactive);
}

@freezed
class RevenueMetricsModel with _$RevenueMetricsModel {
  const factory RevenueMetricsModel({
    @JsonKey(name: 'monthly_recurring') required double monthlyRecurring,
    @JsonKey(name: 'total_collected') required double totalCollected,
    @JsonKey(name: 'pending_collection') required double pendingCollection,
    @JsonKey(name: 'overdue_amount') required double overdueAmount,
  }) = _RevenueMetricsModel;

  factory RevenueMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueMetricsModelFromJson(json);
}

extension RevenueMetricsModelX on RevenueMetricsModel {
  RevenueMetrics toEntity() => RevenueMetrics(
    monthlyRecurring: monthlyRecurring,
    totalCollected: totalCollected,
    pendingCollection: pendingCollection,
    overdueAmount: overdueAmount,
  );
}

@freezed
class RecentActivityModel with _$RecentActivityModel {
  const factory RecentActivityModel({
    @JsonKey(name: 'recent_users') required List<RecentUserModel> recentUsers,
    @JsonKey(name: 'recent_subscriptions')
    required List<RecentSubscriptionModel> recentSubscriptions,
  }) = _RecentActivityModel;

  factory RecentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityModelFromJson(json);
}

extension RecentActivityModelX on RecentActivityModel {
  RecentActivity toEntity() => RecentActivity(
    recentUsers: recentUsers.map((u) => u.toEntity()).toList(),
    recentSubscriptions: recentSubscriptions.map((s) => s.toEntity()).toList(),
  );
}

@freezed
class RecentUserModel with _$RecentUserModel {
  const factory RecentUserModel({
    required int id,
    required String name,
    required String email,
    required String role,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _RecentUserModel;

  factory RecentUserModel.fromJson(Map<String, dynamic> json) =>
      _$RecentUserModelFromJson(json);
}

extension RecentUserModelX on RecentUserModel {
  RecentUser toEntity() => RecentUser(
    id: id,
    name: name,
    email: email,
    role: role,
    createdAt: DateTime.parse(createdAt),
  );
}

@freezed
class RecentSubscriptionModel with _$RecentSubscriptionModel {
  const factory RecentSubscriptionModel({
    required int id,
    required String club,
    required String status,
    @JsonKey(name: 'current_period_end') required String currentPeriodEnd,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _RecentSubscriptionModel;

  factory RecentSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$RecentSubscriptionModelFromJson(json);
}

extension RecentSubscriptionModelX on RecentSubscriptionModel {
  RecentSubscription toEntity() => RecentSubscription(
    id: id,
    club: club,
    status: status,
    currentPeriodEnd: currentPeriodEnd,
    createdAt: DateTime.parse(createdAt),
  );
}

// ============================================================================
// CLUB DASHBOARD MODEL
// ============================================================================

@freezed
class ClubDashboardModel with _$ClubDashboardModel {
  const factory ClubDashboardModel({
    required String role,
    required String timestamp,
    @JsonKey(name: 'club_info') required ClubInfoModel clubInfo,
    required ClubPlayersModel players,
    required ClubMatchesModel matches,
    required ClubPaymentsModel payments,
    required FederationInfoModel federation,
    ClubSubscriptionModel? subscription,
  }) = _ClubDashboardModel;

  factory ClubDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ClubDashboardModelFromJson(json);
}

extension ClubDashboardModelX on ClubDashboardModel {
  ClubDashboard toEntity() => ClubDashboard(
    role: role,
    timestamp: DateTime.parse(timestamp),
    clubInfo: clubInfo.toEntity(),
    players: players.toEntity(),
    matches: matches.toEntity(),
    payments: payments.toEntity(),
    federation: federation.toEntity(),
    subscription: subscription?.toEntity(),
  );
}

@freezed
class ClubInfoModel with _$ClubInfoModel {
  const factory ClubInfoModel({
    required int id,
    required String name,
    @JsonKey(name: 'short_name') required String shortName,
    String? logo,
    required String status,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_federated') required bool isFederated,
    @JsonKey(name: 'federation_code') String? federationCode,
    required String email,
    required String phone,
    String? address,
    String? city,
    String? department,
  }) = _ClubInfoModel;

  factory ClubInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ClubInfoModelFromJson(json);
}

extension ClubInfoModelX on ClubInfoModel {
  ClubInfo toEntity() => ClubInfo(
    id: id,
    name: name,
    shortName: shortName,
    logo: logo,
    status: status,
    isActive: isActive,
    isFederated: isFederated,
    federationCode: federationCode,
    email: email,
    phone: phone,
    address: address,
    city: city,
    department: department,
  );
}

@freezed
class ClubPlayersModel with _$ClubPlayersModel {
  const factory ClubPlayersModel({
    required int total,
    required int active,
    required int inactive,
    required int federated,
    @JsonKey(name: 'non_federated') required int nonFederated,
    @JsonKey(name: 'with_overdue_payments') required int withOverduePayments,
    @JsonKey(name: 'by_category') required Map<String, int> byCategory,
    @JsonKey(name: 'expiring_medical_certs_30_days')
    required int expiringMedicalCerts30Days,
  }) = _ClubPlayersModel;

  factory ClubPlayersModel.fromJson(Map<String, dynamic> json) =>
      _$ClubPlayersModelFromJson(json);
}

extension ClubPlayersModelX on ClubPlayersModel {
  ClubPlayers toEntity() => ClubPlayers(
    total: total,
    active: active,
    inactive: inactive,
    federated: federated,
    nonFederated: nonFederated,
    withOverduePayments: withOverduePayments,
    byCategory: byCategory,
    expiringMedicalCerts30Days: expiringMedicalCerts30Days,
  );
}

@freezed
class ClubMatchesModel with _$ClubMatchesModel {
  const factory ClubMatchesModel({
    @JsonKey(name: 'total_played') required int totalPlayed,
    required int wins,
    required int losses,
    @JsonKey(name: 'win_rate') required double winRate,
    @JsonKey(name: 'upcoming_matches')
    required List<UpcomingMatchModel> upcomingMatches,
  }) = _ClubMatchesModel;

  factory ClubMatchesModel.fromJson(Map<String, dynamic> json) =>
      _$ClubMatchesModelFromJson(json);
}

extension ClubMatchesModelX on ClubMatchesModel {
  ClubMatches toEntity() => ClubMatches(
    totalPlayed: totalPlayed,
    wins: wins,
    losses: losses,
    winRate: winRate,
    upcomingMatches: upcomingMatches.map((m) => m.toEntity()).toList(),
  );
}

@freezed
class UpcomingMatchModel with _$UpcomingMatchModel {
  const factory UpcomingMatchModel({
    required int id,
    @JsonKey(name: 'home_team') required String homeTeam,
    @JsonKey(name: 'away_team') required String awayTeam,
    required String tournament,
    @JsonKey(name: 'scheduled_at') required String scheduledAt,
    required String venue,
    @JsonKey(name: 'is_home') required bool isHome,
  }) = _UpcomingMatchModel;

  factory UpcomingMatchModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMatchModelFromJson(json);
}

extension UpcomingMatchModelX on UpcomingMatchModel {
  UpcomingMatch toEntity() => UpcomingMatch(
    id: id,
    homeTeam: homeTeam,
    awayTeam: awayTeam,
    tournament: tournament,
    scheduledAt: DateTime.parse(scheduledAt),
    venue: venue,
    isHome: isHome,
  );
}

@freezed
class ClubPaymentsModel with _$ClubPaymentsModel {
  const factory ClubPaymentsModel({
    @JsonKey(name: 'pending_count') required int pendingCount,
    @JsonKey(name: 'overdue_count') required int overdueCount,
    @JsonKey(name: 'pending_amount') required double pendingAmount,
    @JsonKey(name: 'overdue_amount') required double overdueAmount,
  }) = _ClubPaymentsModel;

  factory ClubPaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$ClubPaymentsModelFromJson(json);
}

extension ClubPaymentsModelX on ClubPaymentsModel {
  ClubPayments toEntity() => ClubPayments(
    pendingCount: pendingCount,
    overdueCount: overdueCount,
    pendingAmount: pendingAmount,
    overdueAmount: overdueAmount,
  );
}

@freezed
class FederationInfoModel with _$FederationInfoModel {
  const factory FederationInfoModel({
    @JsonKey(name: 'pending_federation') required int pendingFederation,
    @JsonKey(name: 'expiring_federation_30_days')
    required int expiringFederation30Days,
  }) = _FederationInfoModel;

  factory FederationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FederationInfoModelFromJson(json);
}

extension FederationInfoModelX on FederationInfoModel {
  FederationInfo toEntity() => FederationInfo(
    pendingFederation: pendingFederation,
    expiringFederation30Days: expiringFederation30Days,
  );
}

@freezed
class ClubSubscriptionModel with _$ClubSubscriptionModel {
  const factory ClubSubscriptionModel({
    @JsonKey(name: 'has_subscription') required bool hasSubscription,
    required String status,
    @JsonKey(name: 'current_period_end') required String currentPeriodEnd,
    @JsonKey(name: 'days_until_renewal') required int daysUntilRenewal,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_past_due') required bool isPastDue,
    @JsonKey(name: 'player_count') required int playerCount,
    @JsonKey(name: 'last_amount') required double lastAmount,
  }) = _ClubSubscriptionModel;

  factory ClubSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ClubSubscriptionModelFromJson(json);
}

extension ClubSubscriptionModelX on ClubSubscriptionModel {
  ClubSubscription toEntity() => ClubSubscription(
    hasSubscription: hasSubscription,
    status: status,
    currentPeriodEnd: currentPeriodEnd,
    daysUntilRenewal: daysUntilRenewal,
    isActive: isActive,
    isPastDue: isPastDue,
    playerCount: playerCount,
    lastAmount: lastAmount,
  );
}

// ============================================================================
// LEAGUE DASHBOARD MODEL (simplified for now - will complete in Phase B)
// ============================================================================

@freezed
class LeagueDashboardModel with _$LeagueDashboardModel {
  const factory LeagueDashboardModel({
    required String role,
    required String timestamp,
    @JsonKey(name: 'league_info') required Map<String, dynamic> leagueInfo,
    required Map<String, dynamic> clubs,
    required Map<String, dynamic> players,
    required Map<String, dynamic> tournaments,
    required Map<String, dynamic> sanctions,
    required Map<String, dynamic> verifications,
  }) = _LeagueDashboardModel;

  factory LeagueDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$LeagueDashboardModelFromJson(json);
}

extension LeagueDashboardModelX on LeagueDashboardModel {
  LeagueDashboard toEntity() {
    // Simplified conversion for Phase A - will complete in Phase B
    return LeagueDashboard(
      role: role,
      timestamp: DateTime.parse(timestamp),
      leagueInfo: LeagueInfo(
        id: leagueInfo['id'] as int,
        name: leagueInfo['name'] as String,
        shortName: leagueInfo['short_name'] as String,
        logo: leagueInfo['logo'] as String?,
        status: leagueInfo['status'] as String,
        isActive: leagueInfo['is_active'] as bool,
        email: leagueInfo['email'] as String,
        phone: leagueInfo['phone'] as String,
        website: leagueInfo['website'] as String?,
      ),
      clubs: LeagueClubs(
        total: clubs['total'] as int,
        active: clubs['active'] as int,
        inactive: clubs['inactive'] as int,
        byCategory: Map<String, int>.from(clubs['by_category'] as Map),
        byGender: Map<String, int>.from(clubs['by_gender'] as Map),
      ),
      players: LeaguePlayers(
        total: players['total'] as int,
        federated: players['federated'] as int,
        nonFederated: players['non_federated'] as int,
        federationPercentage: (players['federation_percentage'] as num)
            .toDouble(),
        byClub: Map<String, int>.from(players['by_club'] as Map),
        byCategory: Map<String, int>.from(players['by_category'] as Map),
      ),
      tournaments: LeagueTournaments(
        total: tournaments['total'] as int,
        active: tournaments['active'] as int,
        scheduled: tournaments['scheduled'] as int,
        completed: tournaments['completed'] as int,
        recent: const [], // Will complete in Phase B
      ),
      sanctions: LeagueSanctions(
        active: sanctions['active'] as int,
        byType: Map<String, int>.from(sanctions['by_type'] as Map),
        recent: const [], // Will complete in Phase B
      ),
      verifications: LeagueVerifications(
        pending: verifications['pending'] as int,
        today: verifications['today'] as int,
        thisMonth: verifications['this_month'] as int,
      ),
    );
  }
}

// ============================================================================
// VERIFIER DASHBOARD MODEL
// ============================================================================

@freezed
class VerifierDashboardModel with _$VerifierDashboardModel {
  const factory VerifierDashboardModel({
    required String role,
    required String timestamp,
    @JsonKey(name: 'verifier_stats') required VerifierStatsModel verifierStats,
    @JsonKey(name: 'recent_verifications')
    List<RecentVerificationModel>? recentVerifications,
  }) = _VerifierDashboardModel;

  factory VerifierDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$VerifierDashboardModelFromJson(json);
}

extension VerifierDashboardModelX on VerifierDashboardModel {
  VerifierDashboard toEntity() => VerifierDashboard(
        role: role,
        timestamp: DateTime.parse(timestamp),
        verifierStats: verifierStats.toEntity(),
        recentVerifications:
            recentVerifications?.map((v) => v.toEntity()).toList(),
      );
}

@freezed
class VerifierStatsModel with _$VerifierStatsModel {
  const factory VerifierStatsModel({
    @JsonKey(name: 'total_verifications') required int totalVerifications,
    @JsonKey(name: 'today_verifications') required int todayVerifications,
    @JsonKey(name: 'this_week_verifications')
    required int thisWeekVerifications,
    @JsonKey(name: 'this_month_verifications')
    required int thisMonthVerifications,
    @JsonKey(name: 'average_per_session') required double averagePerSession,
    @JsonKey(name: 'total_sessions') required int totalSessions,
    @JsonKey(name: 'unique_players_verified')
    required int uniquePlayersVerified,
    @JsonKey(name: 'weekly_verifications')
    Map<String, int>? weeklyVerifications,
    TrendDataModel? trend,
  }) = _VerifierStatsModel;

  factory VerifierStatsModel.fromJson(Map<String, dynamic> json) =>
      _$VerifierStatsModelFromJson(json);
}

extension VerifierStatsModelX on VerifierStatsModel {
  VerifierStats toEntity() => VerifierStats(
        totalVerifications: totalVerifications,
        todayVerifications: todayVerifications,
        thisWeekVerifications: thisWeekVerifications,
        thisMonthVerifications: thisMonthVerifications,
        averagePerSession: averagePerSession,
        totalSessions: totalSessions,
        uniquePlayersVerified: uniquePlayersVerified,
        weeklyVerifications: weeklyVerifications,
        trend: trend?.toEntity(),
      );
}

@freezed
class TrendDataModel with _$TrendDataModel {
  const factory TrendDataModel({
    @JsonKey(name: 'percentage_change') required double percentageChange,
    @JsonKey(name: 'is_positive') required bool isPositive,
    @JsonKey(name: 'comparison_period') required String comparisonPeriod,
  }) = _TrendDataModel;

  factory TrendDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrendDataModelFromJson(json);
}

extension TrendDataModelX on TrendDataModel {
  TrendData toEntity() => TrendData(
        percentageChange: percentageChange,
        isPositive: isPositive,
        comparisonPeriod: comparisonPeriod,
      );
}

@freezed
class RecentVerificationModel with _$RecentVerificationModel {
  const factory RecentVerificationModel({
    required int id,
    @JsonKey(name: 'player_name') required String playerName,
    @JsonKey(name: 'player_photo') String? playerPhoto,
    @JsonKey(name: 'was_eligible') required bool wasEligible,
    @JsonKey(name: 'verified_at') required String verifiedAt,
    @JsonKey(name: 'match_info') String? matchInfo,
  }) = _RecentVerificationModel;

  factory RecentVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$RecentVerificationModelFromJson(json);
}

extension RecentVerificationModelX on RecentVerificationModel {
  RecentVerification toEntity() => RecentVerification(
        id: id,
        playerName: playerName,
        playerPhoto: playerPhoto,
        wasEligible: wasEligible,
        verifiedAt: DateTime.parse(verifiedAt),
        matchInfo: matchInfo,
      );
}
