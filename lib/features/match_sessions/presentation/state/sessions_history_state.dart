/// Estado para el historial de sesiones.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/match_session.dart';

part 'sessions_history_state.freezed.dart';

@freezed
class SessionsHistoryState with _$SessionsHistoryState {
  const factory SessionsHistoryState.initial() = _Initial;

  const factory SessionsHistoryState.loading() = _Loading;

  const factory SessionsHistoryState.loaded({
    required List<MatchSession> sessions,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
    String? statusFilter,
    int? matchIdFilter,
  }) = _Loaded;

  const factory SessionsHistoryState.error({
    required String message,
  }) = _Error;

  const factory SessionsHistoryState.empty() = _Empty;
}
