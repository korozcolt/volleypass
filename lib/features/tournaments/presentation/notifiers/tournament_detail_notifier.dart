/// Notifier para gestionar el estado de detalle de torneo.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_tournament_detail_usecase.dart';
import '../state/tournament_detail_state.dart';

class TournamentDetailNotifier extends StateNotifier<TournamentDetailState> {
  final GetTournamentDetailUseCase getTournamentDetailUseCase;

  TournamentDetailNotifier({
    required this.getTournamentDetailUseCase,
  }) : super(const TournamentDetailState.initial());

  Future<void> loadTournamentDetail(int tournamentId) async {
    state = const TournamentDetailState.loading();

    final result = await getTournamentDetailUseCase(tournamentId);

    result.fold(
      (failure) => state = TournamentDetailState.error(failure.message),
      (tournament) => state = TournamentDetailState.loaded(tournament),
    );
  }

  Future<void> refresh(int tournamentId) async {
    await loadTournamentDetail(tournamentId);
  }
}
