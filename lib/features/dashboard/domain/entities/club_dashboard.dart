/// Dashboard para ClubAdmin y Coach.
library;

import 'package:equatable/equatable.dart';
import 'dashboard_response.dart';

class ClubDashboard extends DashboardResponse {
  final ClubInfo clubInfo;
  final ClubPlayers players;
  final ClubMatches matches;
  final ClubPayments payments;
  final FederationInfo federation;
  final ClubSubscription? subscription;

  const ClubDashboard({
    required super.role,
    required super.timestamp,
    required this.clubInfo,
    required this.players,
    required this.matches,
    required this.payments,
    required this.federation,
    this.subscription,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        clubInfo,
        players,
        matches,
        payments,
        federation,
        subscription,
      ];
}

class ClubInfo extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String? logo;
  final String status;
  final bool isActive;
  final bool isFederated;
  final String? federationCode;
  final String email;
  final String phone;
  final String? address;
  final String? city;
  final String? department;

  const ClubInfo({
    required this.id,
    required this.name,
    required this.shortName,
    this.logo,
    required this.status,
    required this.isActive,
    required this.isFederated,
    this.federationCode,
    required this.email,
    required this.phone,
    this.address,
    this.city,
    this.department,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        shortName,
        logo,
        status,
        isActive,
        isFederated,
        federationCode,
        email,
        phone,
        address,
        city,
        department,
      ];
}

class ClubPlayers extends Equatable {
  final int total;
  final int active;
  final int inactive;
  final int federated;
  final int nonFederated;
  final int withOverduePayments; // ⚠️ IMPORTANTE: Jugadores en mora
  final Map<String, int> byCategory;
  final int expiringMedicalCerts30Days;

  const ClubPlayers({
    required this.total,
    required this.active,
    required this.inactive,
    required this.federated,
    required this.nonFederated,
    required this.withOverduePayments,
    required this.byCategory,
    required this.expiringMedicalCerts30Days,
  });

  @override
  List<Object?> get props => [
        total,
        active,
        inactive,
        federated,
        nonFederated,
        withOverduePayments,
        byCategory,
        expiringMedicalCerts30Days,
      ];
}

class ClubMatches extends Equatable {
  final int totalPlayed;
  final int wins;
  final int losses;
  final double winRate;
  final List<UpcomingMatch> upcomingMatches;

  const ClubMatches({
    required this.totalPlayed,
    required this.wins,
    required this.losses,
    required this.winRate,
    required this.upcomingMatches,
  });

  @override
  List<Object?> get props =>
      [totalPlayed, wins, losses, winRate, upcomingMatches];
}

class UpcomingMatch extends Equatable {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final String tournament;
  final DateTime scheduledAt;
  final String venue;
  final bool isHome;

  const UpcomingMatch({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.tournament,
    required this.scheduledAt,
    required this.venue,
    required this.isHome,
  });

  @override
  List<Object?> get props =>
      [id, homeTeam, awayTeam, tournament, scheduledAt, venue, isHome];
}

class ClubPayments extends Equatable {
  final int pendingCount;
  final int overdueCount;
  final double pendingAmount;
  final double overdueAmount;

  const ClubPayments({
    required this.pendingCount,
    required this.overdueCount,
    required this.pendingAmount,
    required this.overdueAmount,
  });

  @override
  List<Object?> get props =>
      [pendingCount, overdueCount, pendingAmount, overdueAmount];
}

class FederationInfo extends Equatable {
  final int pendingFederation;
  final int expiringFederation30Days;

  const FederationInfo({
    required this.pendingFederation,
    required this.expiringFederation30Days,
  });

  @override
  List<Object?> get props => [pendingFederation, expiringFederation30Days];
}

class ClubSubscription extends Equatable {
  final bool hasSubscription;
  final String status;
  final String currentPeriodEnd;
  final int daysUntilRenewal;
  final bool isActive;
  final bool isPastDue;
  final int playerCount;
  final double lastAmount;

  const ClubSubscription({
    required this.hasSubscription,
    required this.status,
    required this.currentPeriodEnd,
    required this.daysUntilRenewal,
    required this.isActive,
    required this.isPastDue,
    required this.playerCount,
    required this.lastAmount,
  });

  @override
  List<Object?> get props => [
        hasSubscription,
        status,
        currentPeriodEnd,
        daysUntilRenewal,
        isActive,
        isPastDue,
        playerCount,
        lastAmount,
      ];
}
