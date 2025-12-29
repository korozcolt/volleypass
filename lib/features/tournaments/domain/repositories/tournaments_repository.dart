/// Repository interface para torneos.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/tournament.dart';
import '../entities/tournament_detail.dart';
import '../entities/standing.dart';

abstract class TournamentsRepository {
  /// Obtener lista de torneos con filtros y paginación
  Future<Either<Failure, List<Tournament>>> getTournaments({
    String? status,
    String? type,
    String? category,
    String? gender,
    int page = 1,
  });

  /// Obtener detalle completo de un torneo
  Future<Either<Failure, TournamentDetail>> getTournamentById(int id);

  /// Obtener tabla de posiciones de un torneo
  Future<Either<Failure, StandingsResponse>> getTournamentStandings(int tournamentId);
}
