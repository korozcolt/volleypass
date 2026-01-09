/// Notifier para gestionar el estado del dashboard.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../state/dashboard_state.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;
  final Ref ref;

  DashboardNotifier({
    required this.getDashboardUseCase,
    required this.ref,
  }) : super(const DashboardState.initial());

  /// Carga el dashboard según el rol del usuario autenticado
  ///
  /// [userRole] - Rol del usuario para determinar qué endpoint usar
  Future<void> loadDashboard({String? userRole}) async {
    state = const DashboardState.loading();

    final result = await getDashboardUseCase(
      DashboardParams(userRole: userRole),
    );

    result.fold(
      (failure) => state = DashboardState.error(failure.message),
      (dashboard) => state = DashboardState.loaded(dashboard),
    );
  }

  /// Recarga el dashboard
  ///
  /// [userRole] - Rol del usuario para determinar qué endpoint usar
  Future<void> refresh({String? userRole}) async {
    await loadDashboard(userRole: userRole);
  }
}
