/// Providers del dashboard.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../notifiers/dashboard_notifier.dart';
import '../state/dashboard_state.dart';

// ============================================================================
// DATA SOURCES
// ============================================================================

final dashboardRemoteDataSourceProvider = Provider<DashboardRemoteDataSource>(
  (ref) => DashboardRemoteDataSourceImpl(
    ref.watch(apiClientProvider),
  ),
);

// ============================================================================
// REPOSITORIES
// ============================================================================

final dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) => DashboardRepositoryImpl(
    remoteDataSource: ref.watch(dashboardRemoteDataSourceProvider),
  ),
);

// ============================================================================
// USE CASES
// ============================================================================

final getDashboardUseCaseProvider = Provider<GetDashboardUseCase>(
  (ref) => GetDashboardUseCase(
    ref.watch(dashboardRepositoryProvider),
  ),
);

// ============================================================================
// STATE NOTIFIERS
// ============================================================================

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(
    getDashboardUseCase: ref.watch(getDashboardUseCaseProvider),
  ),
);
