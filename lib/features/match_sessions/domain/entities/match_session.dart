/// Entidad de sesión de partido.
///
/// Representa una sesión de verificación activa vinculada a un partido específico.
library;

import 'package:equatable/equatable.dart';

class MatchSession extends Equatable {
  final int id;
  final int matchId;
  final int userId;
  final String status; // 'active', 'paused', 'completed'
  final DateTime startedAt;
  final DateTime? pausedAt;
  final DateTime? completedAt;
  final int totalVerifications;
  final int homeTeamVerifications;
  final int awayTeamVerifications;
  final String? notes;

  const MatchSession({
    required this.id,
    required this.matchId,
    required this.userId,
    required this.status,
    required this.startedAt,
    this.pausedAt,
    this.completedAt,
    this.totalVerifications = 0,
    this.homeTeamVerifications = 0,
    this.awayTeamVerifications = 0,
    this.notes,
  });

  /// Duración de la sesión
  Duration get duration {
    final endTime = completedAt ?? DateTime.now();
    return endTime.difference(startedAt);
  }

  /// Si la sesión está activa
  bool get isActive => status == 'active';

  /// Si la sesión está pausada
  bool get isPaused => status == 'paused';

  /// Si la sesión está completada
  bool get isCompleted => status == 'completed';

  /// Mensaje de estado legible
  String get statusMessage {
    switch (status) {
      case 'active':
        return 'Activa';
      case 'paused':
        return 'Pausada';
      case 'completed':
        return 'Completada';
      default:
        return 'Desconocido';
    }
  }

  /// Duración formateada en minutos
  String get formattedDuration {
    final minutes = duration.inMinutes;
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;

    if (hours > 0) {
      return '$hours h $remainingMinutes min';
    }
    return '$minutes min';
  }

  /// Hora de inicio formateada
  String get formattedStartTime {
    return '${startedAt.hour.toString().padLeft(2, '0')}:${startedAt.minute.toString().padLeft(2, '0')}';
  }

  @override
  List<Object?> get props => [
        id,
        matchId,
        userId,
        status,
        startedAt,
        pausedAt,
        completedAt,
        totalVerifications,
        homeTeamVerifications,
        awayTeamVerifications,
        notes,
      ];
}
