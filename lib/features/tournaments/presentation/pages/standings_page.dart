/// Página de tabla de posiciones del torneo.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/standing.dart';
import '../providers/tournaments_providers.dart';
import '../widgets/standing_item.dart';

class StandingsPage extends ConsumerStatefulWidget {
  final int tournamentId;

  const StandingsPage({
    super.key,
    required this.tournamentId,
  });

  @override
  ConsumerState<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends ConsumerState<StandingsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(standingsNotifierProvider.notifier)
          .loadStandings(widget.tournamentId);
    });
  }

  Color _getPositionColor(int position) {
    if (position == 1) {
      return const Color(0xFFFFD700); // Oro
    } else if (position == 2) {
      return const Color(0xFFC0C0C0); // Plata
    } else if (position == 3) {
      return const Color(0xFFCD7F32); // Bronce
    } else {
      return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(standingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de Posiciones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref
                  .read(standingsNotifierProvider.notifier)
                  .refresh(widget.tournamentId);
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const Center(
          child: Text('Cargando tabla de posiciones...'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              AppSpacing.verticalSpaceMD,
              Text(
                message,
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
              AppSpacing.verticalSpaceMD,
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(standingsNotifierProvider.notifier)
                      .refresh(widget.tournamentId);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (response) {
          if (response.standings.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.leaderboard,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  AppSpacing.verticalSpaceMD,
                  Text(
                    'No hay posiciones disponibles',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(standingsNotifierProvider.notifier)
                  .refresh(widget.tournamentId);
            },
            child: SingleChildScrollView(
              padding: AppSpacing.paddingSM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header con nombre del torneo y última actualización
                  _buildHeader(response.tournament.name, response.updatedAt),
                  AppSpacing.verticalSpaceMD,

                  // Leyenda
                  _buildLegend(),
                  AppSpacing.verticalSpaceMD,

                  // Tabla de posiciones
                  _buildStandingsTable(response.standings),
                  AppSpacing.verticalSpaceLG,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(String tournamentName, DateTime updatedAt) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.leaderboard,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  tournamentName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.update,
                size: 14,
                color: Colors.white70,
              ),
              const SizedBox(width: 6),
              Text(
                'Actualizado: ${DateFormat('dd/MM/yyyy HH:mm').format(updatedAt)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              const Text(
                'Leyenda',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildLegendItem('PJ', 'Partidos Jugados'),
              _buildLegendItem('PG', 'Partidos Ganados'),
              _buildLegendItem('PP', 'Partidos Perdidos'),
              _buildLegendItem('SF', 'Sets a Favor'),
              _buildLegendItem('SC', 'Sets en Contra'),
              _buildLegendItem('DS', 'Diferencia de Sets'),
              _buildLegendItem('Pts', 'Puntos'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String abbr, String meaning) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            abbr,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          meaning,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildStandingsTable(List<Standing> standings) {
    return Column(
      children: [
        // Header de la tabla
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 40,
                child: Text(
                  'Pos',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  'Equipo',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              _buildHeaderCell('PJ', width: 35),
              _buildHeaderCell('PG', width: 35),
              _buildHeaderCell('PP', width: 35),
              _buildHeaderCell('DS', width: 35),
              _buildHeaderCell('Pts', width: 40),
            ],
          ),
        ),

        // Filas de la tabla
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: standings.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            itemBuilder: (context, index) {
              final standing = standings[index];
              final isTopThree = standing.position <= 3;

              return StandingItem(
                standing: standing,
                positionColor: _getPositionColor(standing.position),
                isTopThree: isTopThree,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCell(String text, {double width = 40}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
