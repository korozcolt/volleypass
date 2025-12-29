/// Use case para obtener detalle de un torneo.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tournament_detail.dart';
import '../repositories/tournaments_repository.dart';

class GetTournamentDetailUseCase
    implements UseCase<TournamentDetail, int> {
  final TournamentsRepository repository;

  GetTournamentDetailUseCase(this.repository);

  @override
  Future<Either<Failure, TournamentDetail>> call(int tournamentId) async {
    return await repository.getTournamentById(tournamentId);
  }
}
