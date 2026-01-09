/// Dashboard para Verificadores (Verifier role).
library;

import 'package:equatable/equatable.dart';
import 'dashboard_response.dart';

class VerifierDashboard extends DashboardResponse {
  final VerifierStats verifierStats;
  final List<RecentVerification>? recentVerifications;

  const VerifierDashboard({
    required super.role,
    required super.timestamp,
    required this.verifierStats,
    this.recentVerifications,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        verifierStats,
        recentVerifications,
      ];
}

/// Estadísticas del verificador
class VerifierStats extends Equatable {
  final int totalVerifications;
  final int todayVerifications;
  final int thisWeekVerifications;
  final int thisMonthVerifications;
  final double averagePerSession;
  final int totalSessions;
  final int uniquePlayersVerified;
  final Map<String, int>? weeklyVerifications; // Para gráficas
  final TrendData? trend;

  const VerifierStats({
    required this.totalVerifications,
    required this.todayVerifications,
    required this.thisWeekVerifications,
    required this.thisMonthVerifications,
    required this.averagePerSession,
    required this.totalSessions,
    required this.uniquePlayersVerified,
    this.weeklyVerifications,
    this.trend,
  });

  @override
  List<Object?> get props => [
        totalVerifications,
        todayVerifications,
        thisWeekVerifications,
        thisMonthVerifications,
        averagePerSession,
        totalSessions,
        uniquePlayersVerified,
        weeklyVerifications,
        trend,
      ];
}

/// Datos de tendencia (comparativa con período anterior)
class TrendData extends Equatable {
  final double percentageChange;
  final bool isPositive;
  final String comparisonPeriod; // e.g., "vs. mes anterior"

  const TrendData({
    required this.percentageChange,
    required this.isPositive,
    required this.comparisonPeriod,
  });

  @override
  List<Object?> get props => [percentageChange, isPositive, comparisonPeriod];
}

/// Verificación reciente
class RecentVerification extends Equatable {
  final int id;
  final String playerName;
  final String? playerPhoto;
  final bool wasEligible;
  final DateTime verifiedAt;
  final String? matchInfo;

  const RecentVerification({
    required this.id,
    required this.playerName,
    this.playerPhoto,
    required this.wasEligible,
    required this.verifiedAt,
    this.matchInfo,
  });

  @override
  List<Object?> get props => [
        id,
        playerName,
        playerPhoto,
        wasEligible,
        verifiedAt,
        matchInfo,
      ];
}
