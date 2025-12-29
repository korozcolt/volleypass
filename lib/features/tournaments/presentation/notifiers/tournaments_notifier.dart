/// Notifier para gestionar el estado de lista de torneos.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_tournaments_usecase.dart';
import '../state/tournaments_state.dart';

class TournamentsNotifier extends StateNotifier<TournamentsState> {
  final GetTournamentsUseCase getTournamentsUseCase;

  TournamentsNotifier({
    required this.getTournamentsUseCase,
  }) : super(const TournamentsState.initial());

  Future<void> loadTournaments({
    String? status,
    String? type,
    String? category,
    String? gender,
    int page = 1,
  }) async {
    state = const TournamentsState.loading();

    final params = GetTournamentsParams(
      status: status,
      type: type,
      category: category,
      gender: gender,
      page: page,
    );

    final result = await getTournamentsUseCase(params);

    result.fold(
      (failure) => state = TournamentsState.error(failure.message),
      (tournaments) => state = TournamentsState.loaded(tournaments),
    );
  }

  Future<void> refresh({
    String? status,
    String? type,
    String? category,
    String? gender,
  }) async {
    await loadTournaments(
      status: status,
      type: type,
      category: category,
      gender: gender,
      page: 1,
    );
  }
}
