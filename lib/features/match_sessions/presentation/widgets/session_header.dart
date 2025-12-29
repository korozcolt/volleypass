/// Widget de encabezado para mostrar la sesión activa con controles.
library;

import 'package:flutter/material.dart';
import '../../domain/entities/match_session.dart';
import 'session_status_badge.dart';

class SessionHeader extends StatelessWidget {
  final MatchSession session;
  final String matchTitle;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onComplete;
  final VoidCallback? onViewDetails;

  const SessionHeader({
    required this.session,
    required this.matchTitle,
    this.onPause,
    this.onResume,
    this.onComplete,
    this.onViewDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    matchTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SessionStatusBadge(status: session.status),
              ],
            ),
            const SizedBox(height: 16),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatColumn(
                  icon: Icons.verified_user,
                  label: 'Total',
                  value: '${session.totalVerifications}',
                  color: theme.colorScheme.primary,
                ),
                _StatColumn(
                  icon: Icons.home,
                  label: 'Local',
                  value: '${session.homeTeamVerifications}',
                  color: theme.colorScheme.secondary,
                ),
                _StatColumn(
                  icon: Icons.flight,
                  label: 'Visitante',
                  value: '${session.awayTeamVerifications}',
                  color: theme.colorScheme.tertiary,
                ),
                _StatColumn(
                  icon: Icons.access_time,
                  label: 'Duración',
                  value: session.formattedDuration,
                  color: theme.colorScheme.error,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                if (session.isActive && onPause != null)
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onPause,
                      icon: const Icon(Icons.pause),
                      label: const Text('Pausar'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                if (session.isPaused && onResume != null)
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onResume,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Reanudar'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                if ((session.isActive || session.isPaused) && onComplete != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onComplete,
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Completar'),
                    ),
                  ),
                ],
                if (onViewDetails != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onViewDetails,
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Detalles'),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatColumn({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, size: 28, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
