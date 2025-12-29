/// Notifier para gestionar la sesión activa del usuario.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_active_session_usecase.dart';
import '../../domain/usecases/update_session_usecase.dart';
import '../../domain/usecases/complete_session_usecase.dart';
import '../state/active_session_state.dart';

class ActiveSessionNotifier extends StateNotifier<ActiveSessionState> {
  final GetActiveSessionUseCase _getActiveSessionUseCase;
  final UpdateSessionUseCase _updateSessionUseCase;
  final CompleteSessionUseCase _completeSessionUseCase;

  ActiveSessionNotifier(
    this._getActiveSessionUseCase,
    this._updateSessionUseCase,
    this._completeSessionUseCase,
  ) : super(const ActiveSessionState.initial());

  Future<void> loadActiveSession({bool showLoading = true}) async {
    if (showLoading) {
      state = const ActiveSessionState.loading();
    }

    final result = await _getActiveSessionUseCase(NoParams());

    result.fold(
      (failure) => state = ActiveSessionState.error(
        message: failure.message,
      ),
      (session) => state = ActiveSessionState.loaded(
        session: session,
      ),
    );
  }

  Future<void> pauseSession(int sessionId) async {
    state = const ActiveSessionState.updating();

    final result = await _updateSessionUseCase(
      UpdateSessionParams(sessionId: sessionId, action: 'pause'),
    );

    result.fold(
      (failure) => state = ActiveSessionState.error(
        message: failure.message,
      ),
      (session) => state = ActiveSessionState.loaded(
        session: session,
      ),
    );
  }

  Future<void> resumeSession(int sessionId) async {
    state = const ActiveSessionState.updating();

    final result = await _updateSessionUseCase(
      UpdateSessionParams(sessionId: sessionId, action: 'resume'),
    );

    result.fold(
      (failure) => state = ActiveSessionState.error(
        message: failure.message,
      ),
      (session) => state = ActiveSessionState.loaded(
        session: session,
      ),
    );
  }

  Future<void> completeSession({
    required int sessionId,
    String? notes,
  }) async {
    state = const ActiveSessionState.updating();

    final result = await _completeSessionUseCase(
      CompleteSessionParams(sessionId: sessionId, notes: notes),
    );

    result.fold(
      (failure) => state = ActiveSessionState.error(
        message: failure.message,
      ),
      (session) {
        // Al completar, la sesión activa es null
        state = const ActiveSessionState.loaded(session: null);
      },
    );
  }

  void reset() {
    state = const ActiveSessionState.initial();
  }
}
