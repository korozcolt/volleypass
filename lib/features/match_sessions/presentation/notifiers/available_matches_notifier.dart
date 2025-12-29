/// Notifier para gestionar el estado de partidos disponibles.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_available_matches_usecase.dart';
import '../state/available_matches_state.dart';

class AvailableMatchesNotifier extends StateNotifier<AvailableMatchesState> {
  final GetAvailableMatchesUseCase _getAvailableMatchesUseCase;

  AvailableMatchesNotifier(this._getAvailableMatchesUseCase)
    : super(const AvailableMatchesState.initial());

  Future<void> loadMatches({bool refresh = false}) async {
    if (refresh) {
      state = const AvailableMatchesState.loading();
    }

    final result = await _getAvailableMatchesUseCase(
      const GetAvailableMatchesParams(page: 1, perPage: 20),
    );

    result.fold(
      (failure) =>
          state = AvailableMatchesState.error(message: failure.message),
      (matches) {
        if (matches.isEmpty) {
          state = const AvailableMatchesState.empty();
        } else {
          state = AvailableMatchesState.loaded(
            matches: matches,
            hasMore: matches.length >= 20,
            currentPage: 1,
          );
        }
      },
    );
  }

  Future<void> loadMore() async {
    final stateData = state.whenOrNull(
      loaded: (matches, hasMore, currentPage) =>
          (matches: matches, hasMore: hasMore, currentPage: currentPage),
    );

    if (stateData == null || !stateData.hasMore) return;

    final nextPage = stateData.currentPage + 1;
    final result = await _getAvailableMatchesUseCase(
      GetAvailableMatchesParams(page: nextPage, perPage: 20),
    );

    result.fold(
      (failure) {
        // Mantener el estado actual en caso de error en paginación
      },
      (newMatches) {
        if (newMatches.isEmpty) {
          state = AvailableMatchesState.loaded(
            matches: stateData.matches,
            hasMore: false,
            currentPage: stateData.currentPage,
          );
        } else {
          state = AvailableMatchesState.loaded(
            matches: [...stateData.matches, ...newMatches],
            hasMore: newMatches.length >= 20,
            currentPage: nextPage,
          );
        }
      },
    );
  }

  void reset() {
    state = const AvailableMatchesState.initial();
  }
}
