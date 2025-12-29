/// State para tabla de posiciones.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/standing.dart';

part 'standings_state.freezed.dart';

@freezed
class StandingsState with _$StandingsState {
  const factory StandingsState.initial() = _Initial;
  const factory StandingsState.loading() = _Loading;
  const factory StandingsState.loaded(StandingsResponse response) = _Loaded;
  const factory StandingsState.error(String message) = _Error;
}
