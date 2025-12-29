/// Entity de Posición en tabla de torneo.
library;

import 'package:equatable/equatable.dart';

class Standing extends Equatable {
  final int position;
  final int teamId;
  final String teamName;
  final String? teamLogo;
  final int matchesPlayed;
  final int wins;
  final int losses;
  final int points;
  final int setsFor;
  final int setsAgainst;
  final int setDifference;
  final int pointsFor;
  final int pointsAgainst;

  const Standing({
    required this.position,
    required this.teamId,
    required this.teamName,
    this.teamLogo,
    required this.matchesPlayed,
    required this.wins,
    required this.losses,
    required this.points,
    required this.setsFor,
    required this.setsAgainst,
    required this.setDifference,
    required this.pointsFor,
    required this.pointsAgainst,
  });

  double get winPercentage =>
      matchesPlayed > 0 ? (wins / matchesPlayed) * 100 : 0.0;

  @override
  List<Object?> get props => [
        position,
        teamId,
        teamName,
        teamLogo,
        matchesPlayed,
        wins,
        losses,
        points,
        setsFor,
        setsAgainst,
        setDifference,
        pointsFor,
        pointsAgainst,
      ];
}

class StandingsResponse extends Equatable {
  final TournamentInfo tournament;
  final List<Standing> standings;
  final DateTime updatedAt;

  const StandingsResponse({
    required this.tournament,
    required this.standings,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [tournament, standings, updatedAt];
}

class TournamentInfo extends Equatable {
  final int id;
  final String name;

  const TournamentInfo({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
