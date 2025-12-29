/// Implementación del repository de torneos.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/tournament.dart';
import '../../domain/entities/tournament_detail.dart';
import '../../domain/entities/standing.dart';
import '../../domain/repositories/tournaments_repository.dart';
import '../datasources/tournaments_remote_datasource.dart';

class TournamentsRepositoryImpl implements TournamentsRepository {
  final TournamentsRemoteDataSource remoteDataSource;

  TournamentsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Tournament>>> getTournaments({
    String? status,
    String? type,
    String? category,
    String? gender,
    int page = 1,
  }) async {
    try {
      final models = await remoteDataSource.getTournaments(
        status: status,
        type: type,
        category: category,
        gender: gender,
        page: page,
      );

      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, TournamentDetail>> getTournamentById(int id) async {
    try {
      final model = await remoteDataSource.getTournamentById(id);
      final entity = model.toEntity();
      return Right(entity);
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        return Left(NotFoundFailure('Torneo no encontrado'));
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, StandingsResponse>> getTournamentStandings(
    int tournamentId,
  ) async {
    try {
      final model = await remoteDataSource.getTournamentStandings(tournamentId);
      final entity = model.toEntity();
      return Right(entity);
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        return Left(NotFoundFailure('Tabla de posiciones no encontrada'));
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }
}
