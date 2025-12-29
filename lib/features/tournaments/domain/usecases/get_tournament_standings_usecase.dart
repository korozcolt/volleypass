/// Use case para obtener tabla de posiciones.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/standing.dart';
import '../repositories/tournaments_repository.dart';

class GetTournamentStandingsUseCase
    implements UseCase<StandingsResponse, int> {
  final TournamentsRepository repository;

  GetTournamentStandingsUseCase(this.repository);

  @override
  Future<Either<Failure, StandingsResponse>> call(int tournamentId) async {
    return await repository.getTournamentStandings(tournamentId);
  }
}
