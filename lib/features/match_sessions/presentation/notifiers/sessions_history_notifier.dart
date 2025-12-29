/// Notifier para gestionar el historial de sesiones.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_sessions_history_usecase.dart';
import '../state/sessions_history_state.dart';

class SessionsHistoryNotifier extends StateNotifier<SessionsHistoryState> {
  final GetSessionsHistoryUseCase _getSessionsHistoryUseCase;

  SessionsHistoryNotifier(this._getSessionsHistoryUseCase)
      : super(const SessionsHistoryState.initial());

  Future<void> loadHistory({
    String? statusFilter,
    int? matchIdFilter,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = const SessionsHistoryState.loading();
    }

    final result = await _getSessionsHistoryUseCase(
      GetSessionsHistoryParams(
        status: statusFilter,
        matchId: matchIdFilter,
        page: 1,
        perPage: 20,
      ),
    );

    result.fold(
      (failure) => state = SessionsHistoryState.error(
        message: failure.message,
      ),
      (sessions) {
        if (sessions.isEmpty) {
          state = const SessionsHistoryState.empty();
        } else {
          state = SessionsHistoryState.loaded(
            sessions: sessions,
            hasMore: sessions.length >= 20,
            currentPage: 1,
            statusFilter: statusFilter,
            matchIdFilter: matchIdFilter,
          );
        }
      },
    );
  }

  Future<void> loadMore() async {
    final stateData = state.whenOrNull(
      loaded: (sessions, hasMore, currentPage, statusFilter, matchIdFilter) => (
        sessions: sessions,
        hasMore: hasMore,
        currentPage: currentPage,
        statusFilter: statusFilter,
        matchIdFilter: matchIdFilter,
      ),
    );

    if (stateData == null || !stateData.hasMore) return;

    final nextPage = stateData.currentPage + 1;
    final result = await _getSessionsHistoryUseCase(
      GetSessionsHistoryParams(
        status: stateData.statusFilter,
        matchId: stateData.matchIdFilter,
        page: nextPage,
        perPage: 20,
      ),
    );

    result.fold(
      (failure) {
        // Mantener el estado actual en caso de error en paginación
      },
      (newSessions) {
        if (newSessions.isEmpty) {
          state = SessionsHistoryState.loaded(
            sessions: stateData.sessions,
            hasMore: false,
            currentPage: stateData.currentPage,
            statusFilter: stateData.statusFilter,
            matchIdFilter: stateData.matchIdFilter,
          );
        } else {
          state = SessionsHistoryState.loaded(
            sessions: [...stateData.sessions, ...newSessions],
            hasMore: newSessions.length >= 20,
            currentPage: nextPage,
            statusFilter: stateData.statusFilter,
            matchIdFilter: stateData.matchIdFilter,
          );
        }
      },
    );
  }

  void applyFilters({String? statusFilter, int? matchIdFilter}) {
    loadHistory(statusFilter: statusFilter, matchIdFilter: matchIdFilter, refresh: true);
  }

  void reset() {
    state = const SessionsHistoryState.initial();
  }
}
