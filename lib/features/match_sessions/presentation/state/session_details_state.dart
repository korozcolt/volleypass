/// Estado para los detalles completos de una sesión.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/match_session.dart';
import '../../domain/entities/available_match.dart';
import '../../domain/entities/session_verification.dart';

part 'session_details_state.freezed.dart';

@freezed
class SessionDetailsState with _$SessionDetailsState {
  const factory SessionDetailsState.initial() = _Initial;

  const factory SessionDetailsState.loading() = _Loading;

  const factory SessionDetailsState.loaded({
    required MatchSession session,
    required AvailableMatch match,
    required List<SessionVerification> verifications,
  }) = _Loaded;

  const factory SessionDetailsState.error({
    required String message,
  }) = _Error;
}
