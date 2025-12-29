/// Dashboard para LeagueAdmin.
library;

import 'package:equatable/equatable.dart';
import 'dashboard_response.dart';

class LeagueDashboard extends DashboardResponse {
  final LeagueInfo leagueInfo;
  final LeagueClubs clubs;
  final LeaguePlayers players;
  final LeagueTournaments tournaments;
  final LeagueSanctions sanctions;
  final LeagueVerifications verifications;

  const LeagueDashboard({
    required super.role,
    required super.timestamp,
    required this.leagueInfo,
    required this.clubs,
    required this.players,
    required this.tournaments,
    required this.sanctions,
    required this.verifications,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        leagueInfo,
        clubs,
        players,
        tournaments,
        sanctions,
        verifications,
      ];
}

class LeagueInfo extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String? logo;
  final String status;
  final bool isActive;
  final String email;
  final String phone;
  final String? website;

  const LeagueInfo({
    required this.id,
    required this.name,
    required this.shortName,
    this.logo,
    required this.status,
    required this.isActive,
    required this.email,
    required this.phone,
    this.website,
  });

  @override
  List<Object?> get props =>
      [id, name, shortName, logo, status, isActive, email, phone, website];
}

class LeagueClubs extends Equatable {
  final int total;
  final int active;
  final int inactive;
  final Map<String, int> byCategory;
  final Map<String, int> byGender;

  const LeagueClubs({
    required this.total,
    required this.active,
    required this.inactive,
    required this.byCategory,
    required this.byGender,
  });

  @override
  List<Object?> get props => [total, active, inactive, byCategory, byGender];
}

class LeaguePlayers extends Equatable {
  final int total;
  final int federated;
  final int nonFederated;
  final double federationPercentage;
  final Map<String, int> byClub;
  final Map<String, int> byCategory;

  const LeaguePlayers({
    required this.total,
    required this.federated,
    required this.nonFederated,
    required this.federationPercentage,
    required this.byClub,
    required this.byCategory,
  });

  @override
  List<Object?> get props => [
        total,
        federated,
        nonFederated,
        federationPercentage,
        byClub,
        byCategory,
      ];
}

class LeagueTournaments extends Equatable {
  final int total;
  final int active;
  final int scheduled;
  final int completed;
  final List<RecentTournament> recent;

  const LeagueTournaments({
    required this.total,
    required this.active,
    required this.scheduled,
    required this.completed,
    required this.recent,
  });

  @override
  List<Object?> get props => [total, active, scheduled, completed, recent];
}

class RecentTournament extends Equatable {
  final int id;
  final String name;
  final String status;
  final String type;
  final String category;
  final String gender;
  final String startDate;
  final int totalTeams;

  const RecentTournament({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.category,
    required this.gender,
    required this.startDate,
    required this.totalTeams,
  });

  @override
  List<Object?> get props =>
      [id, name, status, type, category, gender, startDate, totalTeams];
}

class LeagueSanctions extends Equatable {
  final int active;
  final Map<String, int> byType;
  final List<RecentSanction> recent;

  const LeagueSanctions({
    required this.active,
    required this.byType,
    required this.recent,
  });

  @override
  List<Object?> get props => [active, byType, recent];
}

class RecentSanction extends Equatable {
  final int id;
  final String player;
  final String club;
  final String type;
  final String status;
  final String startDate;
  final String? endDate;

  const RecentSanction({
    required this.id,
    required this.player,
    required this.club,
    required this.type,
    required this.status,
    required this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [id, player, club, type, status, startDate, endDate];
}

class LeagueVerifications extends Equatable {
  final int pending;
  final int today;
  final int thisMonth;

  const LeagueVerifications({
    required this.pending,
    required this.today,
    required this.thisMonth,
  });

  @override
  List<Object?> get props => [pending, today, thisMonth];
}
