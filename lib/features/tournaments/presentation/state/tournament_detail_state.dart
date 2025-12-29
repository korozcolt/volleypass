/// State para detalle de torneo.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tournament_detail.dart';

part 'tournament_detail_state.freezed.dart';

@freezed
class TournamentDetailState with _$TournamentDetailState {
  const factory TournamentDetailState.initial() = _Initial;
  const factory TournamentDetailState.loading() = _Loading;
  const factory TournamentDetailState.loaded(TournamentDetail tournament) =
      _Loaded;
  const factory TournamentDetailState.error(String message) = _Error;
}
