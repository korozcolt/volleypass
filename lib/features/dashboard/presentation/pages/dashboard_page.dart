/// Página del Dashboard principal personalizado por rol.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/presentation/widgets/app_drawer.dart';
import '../../domain/entities/club_dashboard.dart';
import '../../domain/entities/league_dashboard.dart';
import '../../domain/entities/super_admin_dashboard.dart';
import '../providers/dashboard_providers.dart';
import '../state/dashboard_state.dart';
import '../widgets/stat_card.dart';
import '../widgets/upcoming_match_card.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/activity_item.dart';
import '../widgets/mini_bar_chart.dart';
import '../widgets/circular_progress_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Cargar dashboard al iniciar
    Future.microtask(() {
      ref.read(dashboardNotifierProvider.notifier).loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final dashboardState = ref.watch(dashboardNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('VolleyPass'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(dashboardNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: dashboardState.when(
        initial: () => const Center(child: Text('Inicializando...')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              AppSpacing.verticalSpaceMD,
              Text(
                'Error al cargar dashboard',
                style: AppTextStyles.h5,
              ),
              AppSpacing.verticalSpaceSM,
              Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.verticalSpaceLG,
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(dashboardNotifierProvider.notifier).loadDashboard();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (dashboard) {
          // Switch basado en el tipo de dashboard
          if (dashboard is SuperAdminDashboard) {
            return _buildSuperAdminDashboard(context, dashboard);
          } else if (dashboard is ClubDashboard) {
            return _buildClubDashboard(context, dashboard);
          } else if (dashboard is LeagueDashboard) {
            return _buildLeagueDashboard(context, dashboard);
          } else {
            return const Center(child: Text('Dashboard no soportado'));
          }
        },
      ),
    );
  }

  // ============================================================================
  // SUPER ADMIN DASHBOARD
  // ============================================================================

  Widget _buildSuperAdminDashboard(
    BuildContext context,
    SuperAdminDashboard dashboard,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(dashboardNotifierProvider.notifier).refresh();
      },
      child: SingleChildScrollView(
        padding: AppSpacing.paddingSM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard SuperAdmin', style: AppTextStyles.h4),
            AppSpacing.verticalSpaceMD,

            // Users metrics
            DashboardSection(
              title: 'Usuarios',
              subtitle: 'Métricas de usuarios del sistema',
              icon: Icons.people_outline,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Usuarios',
                  value: dashboard.users.total.toString(),
                  icon: Icons.people,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Activos',
                  value: dashboard.users.active.toString(),
                  icon: Icons.verified_user,
                  color: AppColors.success,
                ),
                StatCard(
                  title: 'SuperAdmins',
                  value: dashboard.users.byRole['SuperAdmin']?.toString() ?? '0',
                  icon: Icons.admin_panel_settings,
                  color: AppColors.error,
                ),
                StatCard(
                  title: 'League Admins',
                  value: dashboard.users.byRole['LeagueAdmin']?.toString() ?? '0',
                  icon: Icons.sports,
                  color: AppColors.info,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Subscriptions
            DashboardSection(
              title: 'Suscripciones',
              subtitle: 'Estado de suscripciones activas',
              icon: Icons.card_membership_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Activas',
                  value: dashboard.subscriptions.active.toString(),
                  icon: Icons.check_circle,
                  color: AppColors.success,
                ),
                StatCard(
                  title: 'Por Expirar (7 días)',
                  value: dashboard.subscriptions.expiringSoon7Days.toString(),
                  icon: Icons.warning,
                  color: AppColors.warning,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // System metrics
            DashboardSection(
              title: 'Actividad del Sistema',
              subtitle: 'Métricas de actividad reciente',
              icon: Icons.analytics_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Verificaciones Hoy',
                  value: dashboard.systemMetrics.verifications.today.toString(),
                  icon: Icons.qr_code_scanner,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Partidos Activos',
                  value: dashboard.systemMetrics.matches.inProgress.toString(),
                  icon: Icons.sports_volleyball,
                  color: AppColors.secondary,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Mini gráfico de actividad semanal
            DashboardSection(
              title: 'Actividad Semanal',
              subtitle: 'Verificaciones realizadas',
              icon: Icons.bar_chart,
              child: MiniBarChart(
                values: const [45, 52, 38, 65, 48, 71, 58],
                labels: const ['L', 'M', 'X', 'J', 'V', 'S', 'D'],
                color: AppColors.primary,
                height: 100,
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Actividad Reciente
            DashboardSection(
              title: 'Actividad Reciente',
              subtitle: 'Últimas acciones en el sistema',
              icon: Icons.history,
              child: Column(
                children: [
                  ActivityItem(
                    title: 'Nueva suscripción activada',
                    description: 'Club Deportivo Los Andes',
                    icon: Icons.check_circle,
                    color: AppColors.success,
                    timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
                  ),
                  ActivityItem(
                    title: 'Usuario registrado',
                    description: 'Juan Pérez - LeagueAdmin',
                    icon: Icons.person_add,
                    color: AppColors.info,
                    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
                  ),
                  ActivityItem(
                    title: 'Verificación QR realizada',
                    description: '150 jugadores verificados',
                    icon: Icons.qr_code_scanner,
                    color: AppColors.primary,
                    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
                  ),
                  ActivityItem(
                    title: 'Partido finalizado',
                    description: 'Liga Metropolitana - Fecha 5',
                    icon: Icons.sports_volleyball,
                    color: AppColors.secondary,
                    timestamp: DateTime.now().subtract(const Duration(days: 1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // CLUB ADMIN / COACH DASHBOARD
  // ============================================================================

  Widget _buildClubDashboard(BuildContext context, ClubDashboard dashboard) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(dashboardNotifierProvider.notifier).refresh();
      },
      child: SingleChildScrollView(
        padding: AppSpacing.paddingSM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Club info header
            Card(
              child: Padding(
                padding: AppSpacing.paddingSM,
                child: Row(
                  children: [
                    if (dashboard.clubInfo.logo != null)
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(dashboard.clubInfo.logo!),
                      )
                    else
                      const CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.shield, size: 32),
                      ),
                    AppSpacing.horizontalSpaceMD,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dashboard.clubInfo.name,
                            style: AppTextStyles.h5,
                          ),
                          AppSpacing.verticalSpaceXS,
                          Text(
                            dashboard.clubInfo.shortName,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Players metrics - DESTACAR JUGADORES EN MORA
            DashboardSection(
              title: 'Jugadores',
              subtitle: 'Gestión de jugadores del club',
              icon: Icons.people_outline,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Jugadores',
                  value: dashboard.players.total.toString(),
                  icon: Icons.people,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Activos',
                  value: dashboard.players.active.toString(),
                  icon: Icons.verified_user,
                  color: AppColors.success,
                ),
                StatCard(
                  title: 'EN MORA ⚠️',
                  value: dashboard.players.withOverduePayments.toString(),
                  icon: Icons.money_off,
                  color: AppColors.error,
                  subtitle: 'Requiere atención',
                ),
                StatCard(
                  title: 'Federados',
                  value: dashboard.players.federated.toString(),
                  icon: Icons.card_membership,
                  color: AppColors.info,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Upcoming matches
            if (dashboard.matches.upcomingMatches.isNotEmpty) ...[
              DashboardSection(
                title: 'Próximos Partidos',
                subtitle: '${dashboard.matches.upcomingMatches.length} partidos programados',
                icon: Icons.event,
                child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dashboard.matches.upcomingMatches.length,
                itemBuilder: (context, index) {
                  final match = dashboard.matches.upcomingMatches[index];
                  final dateTime = match.scheduledAt;
                  final date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                  final time = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

                  return UpcomingMatchCard(
                    homeTeam: match.homeTeam,
                    awayTeam: match.awayTeam,
                    date: date,
                    time: time,
                    location: match.venue,
                    tournament: match.tournament,
                  );
                },
                ),
              ),
              AppSpacing.verticalSpaceLG,
            ],

            // Payments summary
            DashboardSection(
              title: 'Pagos',
              subtitle: 'Estado de pagos del club',
              icon: Icons.payments_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Pendientes',
                  value: dashboard.payments.pendingCount.toString(),
                  icon: Icons.pending,
                  color: AppColors.warning,
                ),
                StatCard(
                  title: 'En Mora',
                  value: dashboard.payments.overdueCount.toString(),
                  icon: Icons.error,
                  color: AppColors.error,
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // LEAGUE ADMIN DASHBOARD
  // ============================================================================

  Widget _buildLeagueDashboard(
    BuildContext context,
    LeagueDashboard dashboard,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(dashboardNotifierProvider.notifier).refresh();
      },
      child: SingleChildScrollView(
        padding: AppSpacing.paddingSM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // League info header
            Card(
              child: Padding(
                padding: AppSpacing.paddingSM,
                child: Row(
                  children: [
                    if (dashboard.leagueInfo.logo != null)
                      CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            NetworkImage(dashboard.leagueInfo.logo!),
                      )
                    else
                      const CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.emoji_events, size: 32),
                      ),
                    AppSpacing.horizontalSpaceMD,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dashboard.leagueInfo.name,
                            style: AppTextStyles.h5,
                          ),
                          AppSpacing.verticalSpaceXS,
                          Text(
                            dashboard.leagueInfo.shortName,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Clubs metrics
            DashboardSection(
              title: 'Clubes',
              subtitle: 'Clubes afiliados a la liga',
              icon: Icons.shield_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Clubes',
                  value: dashboard.clubs.total.toString(),
                  icon: Icons.shield,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Activos',
                  value: dashboard.clubs.active.toString(),
                  icon: Icons.verified,
                  color: AppColors.success,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Players - FEDERADOS vs NO FEDERADOS
            DashboardSection(
              title: 'Jugadores',
              subtitle: 'Federados y no federados',
              icon: Icons.people_outline,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Jugadores',
                  value: dashboard.players.total.toString(),
                  icon: Icons.people,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Federados',
                  value: dashboard.players.federated.toString(),
                  icon: Icons.card_membership,
                  color: AppColors.success,
                  subtitle:
                      '${dashboard.players.federationPercentage.toStringAsFixed(1)}%',
                ),
                StatCard(
                  title: 'No Federados',
                  value: dashboard.players.nonFederated.toString(),
                  icon: Icons.person_outline,
                  color: AppColors.warning,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Tournaments
            DashboardSection(
              title: 'Torneos',
              subtitle: 'Gestión de torneos de la liga',
              icon: Icons.emoji_events_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Torneos',
                  value: dashboard.tournaments.total.toString(),
                  icon: Icons.emoji_events,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Activos',
                  value: dashboard.tournaments.active.toString(),
                  icon: Icons.play_circle,
                  color: AppColors.success,
                ),
                StatCard(
                  title: 'Programados',
                  value: dashboard.tournaments.scheduled.toString(),
                  icon: Icons.schedule,
                  color: AppColors.info,
                ),
                StatCard(
                  title: 'Completados',
                  value: dashboard.tournaments.completed.toString(),
                  icon: Icons.check_circle,
                  color: AppColors.textSecondary,
                ),
              ],
              ),
            ),
            AppSpacing.verticalSpaceLG,

            // Verifications
            DashboardSection(
              title: 'Verificaciones',
              subtitle: 'QR de jugadores verificados',
              icon: Icons.qr_code_scanner_outlined,
              child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Hoy',
                  value: dashboard.verifications.today.toString(),
                  icon: Icons.qr_code_scanner,
                  color: AppColors.primary,
                ),
                StatCard(
                  title: 'Este Mes',
                  value: dashboard.verifications.thisMonth.toString(),
                  icon: Icons.calendar_month,
                  color: AppColors.info,
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
