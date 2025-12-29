/// Notifier para gestionar el estado de tabla de posiciones.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_tournament_standings_usecase.dart';
import '../state/standings_state.dart';

class StandingsNotifier extends StateNotifier<StandingsState> {
  final GetTournamentStandingsUseCase getTournamentStandingsUseCase;

  StandingsNotifier({
    required this.getTournamentStandingsUseCase,
  }) : super(const StandingsState.initial());

  Future<void> loadStandings(int tournamentId) async {
    state = const StandingsState.loading();

    final result = await getTournamentStandingsUseCase(tournamentId);

    result.fold(
      (failure) => state = StandingsState.error(failure.message),
      (response) => state = StandingsState.loaded(response),
    );
  }

  Future<void> refresh(int tournamentId) async {
    await loadStandings(tournamentId);
  }
}
