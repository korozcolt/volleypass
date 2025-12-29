/// Notifier para gestionar los detalles de una sesión.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_session_details_usecase.dart';
import '../state/session_details_state.dart';

class SessionDetailsNotifier extends StateNotifier<SessionDetailsState> {
  final GetSessionDetailsUseCase _getSessionDetailsUseCase;

  SessionDetailsNotifier(this._getSessionDetailsUseCase)
      : super(const SessionDetailsState.initial());

  Future<void> loadSessionDetails(int sessionId) async {
    state = const SessionDetailsState.loading();

    final result = await _getSessionDetailsUseCase(
      GetSessionDetailsParams(sessionId: sessionId),
    );

    result.fold(
      (failure) => state = SessionDetailsState.error(
        message: failure.message,
      ),
      (detailData) => state = SessionDetailsState.loaded(
        session: detailData.session,
        match: detailData.match,
        verifications: detailData.verifications,
      ),
    );
  }

  Future<void> refresh(int sessionId) async {
    await loadSessionDetails(sessionId);
  }

  void reset() {
    state = const SessionDetailsState.initial();
  }
}
