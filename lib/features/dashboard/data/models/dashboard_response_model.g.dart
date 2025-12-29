// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardResponseModelImpl _$$DashboardResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardResponseModelImpl(
      success: json['success'] as bool,
      role: json['role'] as String,
      data: json['data'] as Map<String, dynamic>,
      timestamp: json['timestamp'] as String,
      message: json['message'] as String?,
      redirectTo: json['redirect_to'] as String?,
    );

Map<String, dynamic> _$$DashboardResponseModelImplToJson(
        _$DashboardResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'role': instance.role,
      'data': instance.data,
      'timestamp': instance.timestamp,
      'message': instance.message,
      'redirect_to': instance.redirectTo,
    };

_$SuperAdminDashboardModelImpl _$$SuperAdminDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuperAdminDashboardModelImpl(
      role: json['role'] as String,
      timestamp: json['timestamp'] as String,
      users: UserMetricsModel.fromJson(json['users'] as Map<String, dynamic>),
      subscriptions: SubscriptionMetricsModel.fromJson(
          json['subscriptions'] as Map<String, dynamic>),
      systemMetrics: SystemMetricsModel.fromJson(
          json['system_metrics'] as Map<String, dynamic>),
      revenue:
          RevenueMetricsModel.fromJson(json['revenue'] as Map<String, dynamic>),
      recentActivity: json['recent_activity'] == null
          ? null
          : RecentActivityModel.fromJson(
              json['recent_activity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SuperAdminDashboardModelImplToJson(
        _$SuperAdminDashboardModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'timestamp': instance.timestamp,
      'users': instance.users,
      'subscriptions': instance.subscriptions,
      'system_metrics': instance.systemMetrics,
      'revenue': instance.revenue,
      'recent_activity': instance.recentActivity,
    };

_$UserMetricsModelImpl _$$UserMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserMetricsModelImpl(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      inactive: (json['inactive'] as num).toInt(),
      newLast30Days: (json['new_last_30_days'] as num).toInt(),
      byRole: Map<String, int>.from(json['by_role'] as Map),
    );

Map<String, dynamic> _$$UserMetricsModelImplToJson(
        _$UserMetricsModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'inactive': instance.inactive,
      'new_last_30_days': instance.newLast30Days,
      'by_role': instance.byRole,
    };

_$SubscriptionMetricsModelImpl _$$SubscriptionMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionMetricsModelImpl(
      active: (json['active'] as num).toInt(),
      expired: (json['expired'] as num).toInt(),
      expiringSoon7Days: (json['expiring_soon_7_days'] as num).toInt(),
      pastDue: (json['past_due'] as num).toInt(),
      suspended: (json['suspended'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$SubscriptionMetricsModelImplToJson(
        _$SubscriptionMetricsModelImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'expired': instance.expired,
      'expiring_soon_7_days': instance.expiringSoon7Days,
      'past_due': instance.pastDue,
      'suspended': instance.suspended,
      'total': instance.total,
    };

_$SystemMetricsModelImpl _$$SystemMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SystemMetricsModelImpl(
      verifications: VerificationMetricsModel.fromJson(
          json['verifications'] as Map<String, dynamic>),
      matches:
          MatchMetricsModel.fromJson(json['matches'] as Map<String, dynamic>),
      clubs: ClubMetricsModel.fromJson(json['clubs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SystemMetricsModelImplToJson(
        _$SystemMetricsModelImpl instance) =>
    <String, dynamic>{
      'verifications': instance.verifications,
      'matches': instance.matches,
      'clubs': instance.clubs,
    };

_$VerificationMetricsModelImpl _$$VerificationMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationMetricsModelImpl(
      total: (json['total'] as num).toInt(),
      today: (json['today'] as num).toInt(),
      thisMonth: (json['this_month'] as num).toInt(),
    );

Map<String, dynamic> _$$VerificationMetricsModelImplToJson(
        _$VerificationMetricsModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'today': instance.today,
      'this_month': instance.thisMonth,
    };

_$MatchMetricsModelImpl _$$MatchMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchMetricsModelImpl(
      total: (json['total'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      inProgress: (json['in_progress'] as num).toInt(),
      scheduled: (json['scheduled'] as num).toInt(),
    );

Map<String, dynamic> _$$MatchMetricsModelImplToJson(
        _$MatchMetricsModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'completed': instance.completed,
      'in_progress': instance.inProgress,
      'scheduled': instance.scheduled,
    };

_$ClubMetricsModelImpl _$$ClubMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubMetricsModelImpl(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      inactive: (json['inactive'] as num).toInt(),
    );

Map<String, dynamic> _$$ClubMetricsModelImplToJson(
        _$ClubMetricsModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'inactive': instance.inactive,
    };

_$RevenueMetricsModelImpl _$$RevenueMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RevenueMetricsModelImpl(
      monthlyRecurring: (json['monthly_recurring'] as num).toDouble(),
      totalCollected: (json['total_collected'] as num).toDouble(),
      pendingCollection: (json['pending_collection'] as num).toDouble(),
      overdueAmount: (json['overdue_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$RevenueMetricsModelImplToJson(
        _$RevenueMetricsModelImpl instance) =>
    <String, dynamic>{
      'monthly_recurring': instance.monthlyRecurring,
      'total_collected': instance.totalCollected,
      'pending_collection': instance.pendingCollection,
      'overdue_amount': instance.overdueAmount,
    };

_$RecentActivityModelImpl _$$RecentActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentActivityModelImpl(
      recentUsers: (json['recent_users'] as List<dynamic>)
          .map((e) => RecentUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentSubscriptions: (json['recent_subscriptions'] as List<dynamic>)
          .map((e) =>
              RecentSubscriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecentActivityModelImplToJson(
        _$RecentActivityModelImpl instance) =>
    <String, dynamic>{
      'recent_users': instance.recentUsers,
      'recent_subscriptions': instance.recentSubscriptions,
    };

_$RecentUserModelImpl _$$RecentUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentUserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$RecentUserModelImplToJson(
        _$RecentUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'created_at': instance.createdAt,
    };

_$RecentSubscriptionModelImpl _$$RecentSubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentSubscriptionModelImpl(
      id: (json['id'] as num).toInt(),
      club: json['club'] as String,
      status: json['status'] as String,
      currentPeriodEnd: json['current_period_end'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$RecentSubscriptionModelImplToJson(
        _$RecentSubscriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'club': instance.club,
      'status': instance.status,
      'current_period_end': instance.currentPeriodEnd,
      'created_at': instance.createdAt,
    };

_$ClubDashboardModelImpl _$$ClubDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubDashboardModelImpl(
      role: json['role'] as String,
      timestamp: json['timestamp'] as String,
      clubInfo:
          ClubInfoModel.fromJson(json['club_info'] as Map<String, dynamic>),
      players:
          ClubPlayersModel.fromJson(json['players'] as Map<String, dynamic>),
      matches:
          ClubMatchesModel.fromJson(json['matches'] as Map<String, dynamic>),
      payments:
          ClubPaymentsModel.fromJson(json['payments'] as Map<String, dynamic>),
      federation: FederationInfoModel.fromJson(
          json['federation'] as Map<String, dynamic>),
      subscription: json['subscription'] == null
          ? null
          : ClubSubscriptionModel.fromJson(
              json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClubDashboardModelImplToJson(
        _$ClubDashboardModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'timestamp': instance.timestamp,
      'club_info': instance.clubInfo,
      'players': instance.players,
      'matches': instance.matches,
      'payments': instance.payments,
      'federation': instance.federation,
      'subscription': instance.subscription,
    };

_$ClubInfoModelImpl _$$ClubInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$ClubInfoModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      shortName: json['short_name'] as String,
      logo: json['logo'] as String?,
      status: json['status'] as String,
      isActive: json['is_active'] as bool,
      isFederated: json['is_federated'] as bool,
      federationCode: json['federation_code'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      department: json['department'] as String?,
    );

Map<String, dynamic> _$$ClubInfoModelImplToJson(_$ClubInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.shortName,
      'logo': instance.logo,
      'status': instance.status,
      'is_active': instance.isActive,
      'is_federated': instance.isFederated,
      'federation_code': instance.federationCode,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'department': instance.department,
    };

_$ClubPlayersModelImpl _$$ClubPlayersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubPlayersModelImpl(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      inactive: (json['inactive'] as num).toInt(),
      federated: (json['federated'] as num).toInt(),
      nonFederated: (json['non_federated'] as num).toInt(),
      withOverduePayments: (json['with_overdue_payments'] as num).toInt(),
      byCategory: Map<String, int>.from(json['by_category'] as Map),
      expiringMedicalCerts30Days:
          (json['expiring_medical_certs_30_days'] as num).toInt(),
    );

Map<String, dynamic> _$$ClubPlayersModelImplToJson(
        _$ClubPlayersModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'inactive': instance.inactive,
      'federated': instance.federated,
      'non_federated': instance.nonFederated,
      'with_overdue_payments': instance.withOverduePayments,
      'by_category': instance.byCategory,
      'expiring_medical_certs_30_days': instance.expiringMedicalCerts30Days,
    };

_$ClubMatchesModelImpl _$$ClubMatchesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubMatchesModelImpl(
      totalPlayed: (json['total_played'] as num).toInt(),
      wins: (json['wins'] as num).toInt(),
      losses: (json['losses'] as num).toInt(),
      winRate: (json['win_rate'] as num).toDouble(),
      upcomingMatches: (json['upcoming_matches'] as List<dynamic>)
          .map((e) => UpcomingMatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClubMatchesModelImplToJson(
        _$ClubMatchesModelImpl instance) =>
    <String, dynamic>{
      'total_played': instance.totalPlayed,
      'wins': instance.wins,
      'losses': instance.losses,
      'win_rate': instance.winRate,
      'upcoming_matches': instance.upcomingMatches,
    };

_$UpcomingMatchModelImpl _$$UpcomingMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpcomingMatchModelImpl(
      id: (json['id'] as num).toInt(),
      homeTeam: json['home_team'] as String,
      awayTeam: json['away_team'] as String,
      tournament: json['tournament'] as String,
      scheduledAt: json['scheduled_at'] as String,
      venue: json['venue'] as String,
      isHome: json['is_home'] as bool,
    );

Map<String, dynamic> _$$UpcomingMatchModelImplToJson(
        _$UpcomingMatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'tournament': instance.tournament,
      'scheduled_at': instance.scheduledAt,
      'venue': instance.venue,
      'is_home': instance.isHome,
    };

_$ClubPaymentsModelImpl _$$ClubPaymentsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubPaymentsModelImpl(
      pendingCount: (json['pending_count'] as num).toInt(),
      overdueCount: (json['overdue_count'] as num).toInt(),
      pendingAmount: (json['pending_amount'] as num).toDouble(),
      overdueAmount: (json['overdue_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClubPaymentsModelImplToJson(
        _$ClubPaymentsModelImpl instance) =>
    <String, dynamic>{
      'pending_count': instance.pendingCount,
      'overdue_count': instance.overdueCount,
      'pending_amount': instance.pendingAmount,
      'overdue_amount': instance.overdueAmount,
    };

_$FederationInfoModelImpl _$$FederationInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FederationInfoModelImpl(
      pendingFederation: (json['pending_federation'] as num).toInt(),
      expiringFederation30Days:
          (json['expiring_federation_30_days'] as num).toInt(),
    );

Map<String, dynamic> _$$FederationInfoModelImplToJson(
        _$FederationInfoModelImpl instance) =>
    <String, dynamic>{
      'pending_federation': instance.pendingFederation,
      'expiring_federation_30_days': instance.expiringFederation30Days,
    };

_$ClubSubscriptionModelImpl _$$ClubSubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubSubscriptionModelImpl(
      hasSubscription: json['has_subscription'] as bool,
      status: json['status'] as String,
      currentPeriodEnd: json['current_period_end'] as String,
      daysUntilRenewal: (json['days_until_renewal'] as num).toInt(),
      isActive: json['is_active'] as bool,
      isPastDue: json['is_past_due'] as bool,
      playerCount: (json['player_count'] as num).toInt(),
      lastAmount: (json['last_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClubSubscriptionModelImplToJson(
        _$ClubSubscriptionModelImpl instance) =>
    <String, dynamic>{
      'has_subscription': instance.hasSubscription,
      'status': instance.status,
      'current_period_end': instance.currentPeriodEnd,
      'days_until_renewal': instance.daysUntilRenewal,
      'is_active': instance.isActive,
      'is_past_due': instance.isPastDue,
      'player_count': instance.playerCount,
      'last_amount': instance.lastAmount,
    };

_$LeagueDashboardModelImpl _$$LeagueDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeagueDashboardModelImpl(
      role: json['role'] as String,
      timestamp: json['timestamp'] as String,
      leagueInfo: json['league_info'] as Map<String, dynamic>,
      clubs: json['clubs'] as Map<String, dynamic>,
      players: json['players'] as Map<String, dynamic>,
      tournaments: json['tournaments'] as Map<String, dynamic>,
      sanctions: json['sanctions'] as Map<String, dynamic>,
      verifications: json['verifications'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$LeagueDashboardModelImplToJson(
        _$LeagueDashboardModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'timestamp': instance.timestamp,
      'league_info': instance.leagueInfo,
      'clubs': instance.clubs,
      'players': instance.players,
      'tournaments': instance.tournaments,
      'sanctions': instance.sanctions,
      'verifications': instance.verifications,
    };
