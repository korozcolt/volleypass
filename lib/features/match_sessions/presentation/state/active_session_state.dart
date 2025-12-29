/// Estado para la sesión activa del usuario.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/match_session.dart';

part 'active_session_state.freezed.dart';

@freezed
class ActiveSessionState with _$ActiveSessionState {
  const factory ActiveSessionState.initial() = _Initial;

  const factory ActiveSessionState.loading() = _Loading;

  const factory ActiveSessionState.loaded({
    required MatchSession? session,
  }) = _Loaded;

  const factory ActiveSessionState.updating() = _Updating;

  const factory ActiveSessionState.error({
    required String message,
  }) = _Error;
}
