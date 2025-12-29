/// Notifier para gestionar el estado del dashboard.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../state/dashboard_state.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;

  DashboardNotifier({required this.getDashboardUseCase})
    : super(const DashboardState.initial());

  /// Carga el dashboard según el rol del usuario autenticado
  Future<void> loadDashboard() async {
    state = const DashboardState.loading();

    final result = await getDashboardUseCase(const NoParams());

    result.fold(
      (failure) => state = DashboardState.error(failure.message),
      (dashboard) => state = DashboardState.loaded(dashboard),
    );
  }

  /// Recarga el dashboard
  Future<void> refresh() async {
    await loadDashboard();
  }
}
