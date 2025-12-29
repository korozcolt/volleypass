/// Estado para la lista de partidos disponibles.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/available_match.dart';

part 'available_matches_state.freezed.dart';

@freezed
class AvailableMatchesState with _$AvailableMatchesState {
  const factory AvailableMatchesState.initial() = _Initial;

  const factory AvailableMatchesState.loading() = _Loading;

  const factory AvailableMatchesState.loaded({
    required List<AvailableMatch> matches,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
  }) = _Loaded;

  const factory AvailableMatchesState.error({
    required String message,
  }) = _Error;

  const factory AvailableMatchesState.empty() = _Empty;
}
