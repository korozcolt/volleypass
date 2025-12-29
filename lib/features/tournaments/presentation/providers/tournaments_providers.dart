/// Riverpod providers para módulo de torneos.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/auth/token_storage.dart';
import '../../../../main.dart' show tokenStorage;
import '../../data/datasources/tournaments_remote_datasource.dart';
import '../../data/repositories/tournaments_repository_impl.dart';
import '../../domain/repositories/tournaments_repository.dart';
import '../../domain/usecases/get_tournaments_usecase.dart';
import '../../domain/usecases/get_tournament_detail_usecase.dart';
import '../../domain/usecases/get_tournament_standings_usecase.dart';
import '../notifiers/tournaments_notifier.dart';
import '../notifiers/tournament_detail_notifier.dart';
import '../notifiers/standings_notifier.dart';
import '../state/tournaments_state.dart';
import '../state/tournament_detail_state.dart';
import '../state/standings_state.dart';

// ============================================================================
// CORE PROVIDERS
// ============================================================================

/// Provider de TokenStorage
final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return tokenStorage;
});

/// Provider de ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    tokenStorage: ref.watch(tokenStorageProvider),
  );
});

// ============================================================================
// DATA SOURCES
// ============================================================================

final tournamentsRemoteDataSourceProvider = Provider<TournamentsRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TournamentsRemoteDataSourceImpl(apiClient);
});

// ============================================================================
// REPOSITORIES
// ============================================================================

final tournamentsRepositoryProvider = Provider<TournamentsRepository>((ref) {
  final remoteDataSource = ref.watch(tournamentsRemoteDataSourceProvider);
  return TournamentsRepositoryImpl(remoteDataSource: remoteDataSource);
});

// ============================================================================
// USE CASES
// ============================================================================

final getTournamentsUseCaseProvider = Provider<GetTournamentsUseCase>((ref) {
  final repository = ref.watch(tournamentsRepositoryProvider);
  return GetTournamentsUseCase(repository);
});

final getTournamentDetailUseCaseProvider = Provider<GetTournamentDetailUseCase>((ref) {
  final repository = ref.watch(tournamentsRepositoryProvider);
  return GetTournamentDetailUseCase(repository);
});

final getTournamentStandingsUseCaseProvider = Provider<GetTournamentStandingsUseCase>((ref) {
  final repository = ref.watch(tournamentsRepositoryProvider);
  return GetTournamentStandingsUseCase(repository);
});

// ============================================================================
// STATE NOTIFIERS
// ============================================================================

final tournamentsNotifierProvider =
    StateNotifierProvider<TournamentsNotifier, TournamentsState>((ref) {
  final getTournamentsUseCase = ref.watch(getTournamentsUseCaseProvider);
  return TournamentsNotifier(getTournamentsUseCase: getTournamentsUseCase);
});

final tournamentDetailNotifierProvider =
    StateNotifierProvider<TournamentDetailNotifier, TournamentDetailState>((ref) {
  final getTournamentDetailUseCase = ref.watch(getTournamentDetailUseCaseProvider);
  return TournamentDetailNotifier(getTournamentDetailUseCase: getTournamentDetailUseCase);
});

final standingsNotifierProvider =
    StateNotifierProvider<StandingsNotifier, StandingsState>((ref) {
  final getTournamentStandingsUseCase = ref.watch(getTournamentStandingsUseCaseProvider);
  return StandingsNotifier(getTournamentStandingsUseCase: getTournamentStandingsUseCase);
});
