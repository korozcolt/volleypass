/// Entity de Torneo para listado.
library;

import 'package:equatable/equatable.dart';

class Tournament extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String type; // championship, league, friendly
  final String format; // groups, knockout, round_robin
  final String category; // senior, junior, sub_17
  final String gender; // male, female, mixed
  final String status; // scheduled, in_progress, finished
  final DateTime startDate;
  final DateTime? endDate;
  final String? venue;
  final int maxTeams;
  final int totalTeams;
  final int teamCount;
  final bool isRegistrationOpen;
  final String? logoUrl;

  const Tournament({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.type,
    required this.format,
    required this.category,
    required this.gender,
    required this.status,
    required this.startDate,
    this.endDate,
    this.venue,
    required this.maxTeams,
    required this.totalTeams,
    required this.teamCount,
    required this.isRegistrationOpen,
    this.logoUrl,
  });

  bool get isActive => status == 'in_progress';
  bool get isFinished => status == 'finished';
  bool get isScheduled => status == 'scheduled';

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        type,
        format,
        category,
        gender,
        status,
        startDate,
        endDate,
        venue,
        maxTeams,
        totalTeams,
        teamCount,
        isRegistrationOpen,
        logoUrl,
      ];
}
