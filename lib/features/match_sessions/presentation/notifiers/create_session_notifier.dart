/// Notifier para gestionar la creación de sesiones.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/create_session_usecase.dart';
import '../state/create_session_state.dart';

class CreateSessionNotifier extends StateNotifier<CreateSessionState> {
  final CreateSessionUseCase _createSessionUseCase;

  CreateSessionNotifier(this._createSessionUseCase)
      : super(const CreateSessionState.initial());

  Future<void> createSession({
    required int matchId,
    String? notes,
  }) async {
    state = const CreateSessionState.creating();

    final result = await _createSessionUseCase(
      CreateSessionParams(matchId: matchId, notes: notes),
    );

    result.fold(
      (failure) => state = CreateSessionState.error(
        message: failure.message,
      ),
      (session) => state = CreateSessionState.success(
        session: session,
      ),
    );
  }

  void reset() {
    state = const CreateSessionState.initial();
  }
}
