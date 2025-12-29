/// Dashboard para SuperAdmin.
library;

import 'package:equatable/equatable.dart';
import 'dashboard_response.dart';

class SuperAdminDashboard extends DashboardResponse {
  final UserMetrics users;
  final SubscriptionMetrics subscriptions;
  final SystemMetrics systemMetrics;
  final RevenueMetrics revenue;
  final RecentActivity? recentActivity;

  const SuperAdminDashboard({
    required super.role,
    required super.timestamp,
    required this.users,
    required this.subscriptions,
    required this.systemMetrics,
    required this.revenue,
    this.recentActivity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        users,
        subscriptions,
        systemMetrics,
        revenue,
        recentActivity,
      ];
}

class UserMetrics extends Equatable {
  final int total;
  final int active;
  final int inactive;
  final int newLast30Days;
  final Map<String, int> byRole;

  const UserMetrics({
    required this.total,
    required this.active,
    required this.inactive,
    required this.newLast30Days,
    required this.byRole,
  });

  @override
  List<Object?> get props => [total, active, inactive, newLast30Days, byRole];
}

class SubscriptionMetrics extends Equatable {
  final int active;
  final int expired;
  final int expiringSoon7Days;
  final int pastDue;
  final int suspended;
  final int total;

  const SubscriptionMetrics({
    required this.active,
    required this.expired,
    required this.expiringSoon7Days,
    required this.pastDue,
    required this.suspended,
    required this.total,
  });

  @override
  List<Object?> get props =>
      [active, expired, expiringSoon7Days, pastDue, suspended, total];
}

class SystemMetrics extends Equatable {
  final VerificationMetrics verifications;
  final MatchMetrics matches;
  final ClubMetrics clubs;

  const SystemMetrics({
    required this.verifications,
    required this.matches,
    required this.clubs,
  });

  @override
  List<Object?> get props => [verifications, matches, clubs];
}

class VerificationMetrics extends Equatable {
  final int total;
  final int today;
  final int thisMonth;

  const VerificationMetrics({
    required this.total,
    required this.today,
    required this.thisMonth,
  });

  @override
  List<Object?> get props => [total, today, thisMonth];
}

class MatchMetrics extends Equatable {
  final int total;
  final int completed;
  final int inProgress;
  final int scheduled;

  const MatchMetrics({
    required this.total,
    required this.completed,
    required this.inProgress,
    required this.scheduled,
  });

  @override
  List<Object?> get props => [total, completed, inProgress, scheduled];
}

class ClubMetrics extends Equatable {
  final int total;
  final int active;
  final int inactive;

  const ClubMetrics({
    required this.total,
    required this.active,
    required this.inactive,
  });

  @override
  List<Object?> get props => [total, active, inactive];
}

class RevenueMetrics extends Equatable {
  final double monthlyRecurring;
  final double totalCollected;
  final double pendingCollection;
  final double overdueAmount;

  const RevenueMetrics({
    required this.monthlyRecurring,
    required this.totalCollected,
    required this.pendingCollection,
    required this.overdueAmount,
  });

  @override
  List<Object?> get props =>
      [monthlyRecurring, totalCollected, pendingCollection, overdueAmount];
}

class RecentActivity extends Equatable {
  final List<RecentUser> recentUsers;
  final List<RecentSubscription> recentSubscriptions;

  const RecentActivity({
    required this.recentUsers,
    required this.recentSubscriptions,
  });

  @override
  List<Object?> get props => [recentUsers, recentSubscriptions];
}

class RecentUser extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  const RecentUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, email, role, createdAt];
}

class RecentSubscription extends Equatable {
  final int id;
  final String club;
  final String status;
  final String currentPeriodEnd;
  final DateTime createdAt;

  const RecentSubscription({
    required this.id,
    required this.club,
    required this.status,
    required this.currentPeriodEnd,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, club, status, currentPeriodEnd, createdAt];
}
