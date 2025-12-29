/// Entidad de partido disponible para crear sesión.
///
/// Representa un partido que está en la ventana de tiempo válida
/// para crear una sesión de verificación (6h antes - 24h después).
library;

import 'package:equatable/equatable.dart';

class AvailableMatch extends Equatable {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final DateTime scheduledAt;
  final String venue;
  final String tournamentName;
  final String? tournamentLogo;
  final String status; // 'scheduled', 'in_progress', 'finished'

  const AvailableMatch({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.scheduledAt,
    required this.venue,
    required this.tournamentName,
    this.tournamentLogo,
    required this.status,
  });

  /// Si el partido es elegible para crear sesión
  bool get isEligibleForSession {
    final now = DateTime.now();
    final sixHoursBefore = scheduledAt.subtract(const Duration(hours: 6));
    final twentyFourHoursAfter = scheduledAt.add(const Duration(hours: 24));

    return now.isAfter(sixHoursBefore) && now.isBefore(twentyFourHoursAfter);
  }

  /// Título del partido (Local vs Visitante)
  String get matchTitle => '$homeTeam vs $awayTeam';

  /// Hora programada formateada
  String get formattedScheduledTime {
    return '${scheduledAt.hour.toString().padLeft(2, '0')}:${scheduledAt.minute.toString().padLeft(2, '0')}';
  }

  /// Fecha programada formateada
  String get formattedScheduledDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final matchDate = DateTime(scheduledAt.year, scheduledAt.month, scheduledAt.day);

    if (matchDate == today) {
      return 'Hoy';
    } else if (matchDate == today.add(const Duration(days: 1))) {
      return 'Mañana';
    } else {
      return '${scheduledAt.day.toString().padLeft(2, '0')}/${scheduledAt.month.toString().padLeft(2, '0')}/${scheduledAt.year}';
    }
  }

  /// Estado legible
  String get statusMessage {
    switch (status) {
      case 'scheduled':
        return 'Programado';
      case 'in_progress':
        return 'En Vivo';
      case 'finished':
        return 'Finalizado';
      default:
        return 'Desconocido';
    }
  }

  @override
  List<Object?> get props => [
        id,
        homeTeam,
        awayTeam,
        scheduledAt,
        venue,
        tournamentName,
        tournamentLogo,
        status,
      ];
}
