/// Estado para la creación de sesiones.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/match_session.dart';

part 'create_session_state.freezed.dart';

@freezed
class CreateSessionState with _$CreateSessionState {
  const factory CreateSessionState.initial() = _Initial;

  const factory CreateSessionState.creating() = _Creating;

  const factory CreateSessionState.success({
    required MatchSession session,
  }) = _Success;

  const factory CreateSessionState.error({
    required String message,
  }) = _Error;
}
