/// Entity de Torneo con detalles completos.
library;

import 'package:equatable/equatable.dart';

class TournamentDetail extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String type;
  final String status;
  final DateTime startDate;
  final DateTime? endDate;
  final TournamentLeague league;
  final List<TournamentTeam> teams;
  final List<TournamentMatch> matches;
  final TournamentStatistics statistics;

  const TournamentDetail({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.status,
    required this.startDate,
    this.endDate,
    required this.league,
    required this.teams,
    required this.matches,
    required this.statistics,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        type,
        status,
        startDate,
        endDate,
        league,
        teams,
        matches,
        statistics,
      ];
}

class TournamentLeague extends Equatable {
  final int id;
  final String name;
  final String? logoUrl;

  const TournamentLeague({
    required this.id,
    required this.name,
    this.logoUrl,
  });

  @override
  List<Object?> get props => [id, name, logoUrl];
}

class TournamentTeam extends Equatable {
  final int id;
  final String name;
  final String? logo;
  final String club;

  const TournamentTeam({
    required this.id,
    required this.name,
    this.logo,
    required this.club,
  });

  @override
  List<Object?> get props => [id, name, logo, club];
}

class TournamentMatch extends Equatable {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final DateTime scheduledAt;
  final String status; // scheduled, in_progress, finished
  final int? homeScore;
  final int? awayScore;
  final String? venue;

  const TournamentMatch({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.scheduledAt,
    required this.status,
    this.homeScore,
    this.awayScore,
    this.venue,
  });

  bool get isFinished => status == 'finished';
  bool get isInProgress => status == 'in_progress';
  bool get isScheduled => status == 'scheduled';

  @override
  List<Object?> get props => [
        id,
        homeTeam,
        awayTeam,
        scheduledAt,
        status,
        homeScore,
        awayScore,
        venue,
      ];
}

class TournamentStatistics extends Equatable {
  final int totalTeams;
  final int totalMatches;
  final int completedMatches;
  final int pendingMatches;
  final int inProgressMatches;

  const TournamentStatistics({
    required this.totalTeams,
    required this.totalMatches,
    required this.completedMatches,
    required this.pendingMatches,
    required this.inProgressMatches,
  });

  @override
  List<Object> get props => [
        totalTeams,
        totalMatches,
        completedMatches,
        pendingMatches,
        inProgressMatches,
      ];
}
