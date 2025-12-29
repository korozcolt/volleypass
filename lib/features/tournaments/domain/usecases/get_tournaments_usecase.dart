/// Use case para obtener lista de torneos.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tournament.dart';
import '../repositories/tournaments_repository.dart';

class GetTournamentsUseCase
    implements UseCase<List<Tournament>, GetTournamentsParams> {
  final TournamentsRepository repository;

  GetTournamentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Tournament>>> call(
    GetTournamentsParams params,
  ) async {
    return await repository.getTournaments(
      status: params.status,
      type: params.type,
      category: params.category,
      gender: params.gender,
      page: params.page,
    );
  }
}

class GetTournamentsParams extends Equatable {
  final String? status;
  final String? type;
  final String? category;
  final String? gender;
  final int page;

  const GetTournamentsParams({
    this.status,
    this.type,
    this.category,
    this.gender,
    this.page = 1,
  });

  @override
  List<Object?> get props => [status, type, category, gender, page];
}
