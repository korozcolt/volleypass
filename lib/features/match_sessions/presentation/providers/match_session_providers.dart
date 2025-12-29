/// Providers para el módulo de sesiones de partido.
///
/// Define todos los providers de Riverpod para inyección de dependencias
/// en el módulo de sesiones de partido.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/match_session_local_datasource.dart';
import '../../data/datasources/match_session_remote_datasource.dart';
import '../../data/repositories/match_session_repository_impl.dart';
import '../../domain/repositories/match_session_repository.dart';
import '../../domain/usecases/get_available_matches_usecase.dart';
import '../../domain/usecases/create_session_usecase.dart';
import '../../domain/usecases/get_active_session_usecase.dart';
import '../../domain/usecases/get_session_details_usecase.dart';
import '../../domain/usecases/update_session_usecase.dart';
import '../../domain/usecases/complete_session_usecase.dart';
import '../../domain/usecases/get_sessions_history_usecase.dart';
import '../state/available_matches_state.dart';
import '../state/create_session_state.dart';
import '../state/active_session_state.dart';
import '../state/session_details_state.dart';
import '../state/sessions_history_state.dart';
import '../notifiers/available_matches_notifier.dart';
import '../notifiers/create_session_notifier.dart';
import '../notifiers/active_session_notifier.dart';
import '../notifiers/session_details_notifier.dart';
import '../notifiers/sessions_history_notifier.dart';
import '../../../auth/presentation/providers/auth_providers.dart'
    show apiClientProvider, connectivityProvider;
import '../../../verification/presentation/providers/verification_providers.dart'
    show offlineStorageProvider;

// ============================================================================
// DATA LAYER PROVIDERS
// ============================================================================

/// Provider del remote datasource
final matchSessionRemoteDataSourceProvider =
    Provider<MatchSessionRemoteDataSource>((ref) {
      final apiClient = ref.watch(apiClientProvider);
      return MatchSessionRemoteDataSourceImpl(apiClient);
    });

/// Provider del local datasource
final matchSessionLocalDataSourceProvider =
    Provider<MatchSessionLocalDataSource>((ref) {
      final offlineStorage = ref.watch(offlineStorageProvider);
      return MatchSessionLocalDataSourceImpl(offlineStorage);
    });

/// Provider del repositorio
final matchSessionRepositoryProvider = Provider<MatchSessionRepository>((ref) {
  final remoteDataSource = ref.watch(matchSessionRemoteDataSourceProvider);
  final localDataSource = ref.watch(matchSessionLocalDataSourceProvider);
  final connectivity = ref.watch(connectivityProvider);

  return MatchSessionRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    connectivity: connectivity,
  );
});

// ============================================================================
// DOMAIN LAYER PROVIDERS (USE CASES)
// ============================================================================

/// Provider del caso de uso de obtener partidos disponibles
final getAvailableMatchesUseCaseProvider = Provider<GetAvailableMatchesUseCase>(
  (ref) {
    final repository = ref.watch(matchSessionRepositoryProvider);
    return GetAvailableMatchesUseCase(repository);
  },
);

/// Provider del caso de uso de crear sesión
final createSessionUseCaseProvider = Provider<CreateSessionUseCase>((ref) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return CreateSessionUseCase(repository);
});

/// Provider del caso de uso de obtener sesión activa
final getActiveSessionUseCaseProvider = Provider<GetActiveSessionUseCase>((
  ref,
) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return GetActiveSessionUseCase(repository);
});

/// Provider del caso de uso de obtener detalles de sesión
final getSessionDetailsUseCaseProvider = Provider<GetSessionDetailsUseCase>((
  ref,
) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return GetSessionDetailsUseCase(repository);
});

/// Provider del caso de uso de actualizar sesión (pause/resume)
final updateSessionUseCaseProvider = Provider<UpdateSessionUseCase>((ref) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return UpdateSessionUseCase(repository);
});

/// Provider del caso de uso de completar sesión
final completeSessionUseCaseProvider = Provider<CompleteSessionUseCase>((ref) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return CompleteSessionUseCase(repository);
});

/// Provider del caso de uso de obtener historial de sesiones
final getSessionsHistoryUseCaseProvider = Provider<GetSessionsHistoryUseCase>((
  ref,
) {
  final repository = ref.watch(matchSessionRepositoryProvider);
  return GetSessionsHistoryUseCase(repository);
});

// ============================================================================
// PRESENTATION LAYER PROVIDERS (STATE NOTIFIERS)
// ============================================================================

/// Provider del state notifier de partidos disponibles
final availableMatchesStateProvider =
    StateNotifierProvider<AvailableMatchesNotifier, AvailableMatchesState>((
      ref,
    ) {
      final getAvailableMatchesUseCase = ref.watch(
        getAvailableMatchesUseCaseProvider,
      );
      return AvailableMatchesNotifier(getAvailableMatchesUseCase);
    });

/// Provider del state notifier de creación de sesión
final createSessionStateProvider =
    StateNotifierProvider<CreateSessionNotifier, CreateSessionState>((ref) {
      final createSessionUseCase = ref.watch(createSessionUseCaseProvider);
      return CreateSessionNotifier(createSessionUseCase);
    });

/// Provider del state notifier de sesión activa
final activeSessionStateProvider =
    StateNotifierProvider<ActiveSessionNotifier, ActiveSessionState>((ref) {
      final getActiveSessionUseCase = ref.watch(
        getActiveSessionUseCaseProvider,
      );
      final updateSessionUseCase = ref.watch(updateSessionUseCaseProvider);
      final completeSessionUseCase = ref.watch(completeSessionUseCaseProvider);

      return ActiveSessionNotifier(
        getActiveSessionUseCase,
        updateSessionUseCase,
        completeSessionUseCase,
      );
    });

/// Provider del state notifier de detalles de sesión
final sessionDetailsStateProvider =
    StateNotifierProvider<SessionDetailsNotifier, SessionDetailsState>((ref) {
      final getSessionDetailsUseCase = ref.watch(
        getSessionDetailsUseCaseProvider,
      );
      return SessionDetailsNotifier(getSessionDetailsUseCase);
    });

/// Provider del state notifier de historial de sesiones
final sessionsHistoryStateProvider =
    StateNotifierProvider<SessionsHistoryNotifier, SessionsHistoryState>((ref) {
      final getSessionsHistoryUseCase = ref.watch(
        getSessionsHistoryUseCaseProvider,
      );
      return SessionsHistoryNotifier(getSessionsHistoryUseCase);
    });
