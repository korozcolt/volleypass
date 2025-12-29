/// Widget de tarjeta para mostrar una sesión en el historial.
library;

import 'package:flutter/material.dart';
import '../../domain/entities/match_session.dart';
import 'session_status_badge.dart';

class SessionCard extends StatelessWidget {
  final MatchSession session;
  final String matchTitle;
  final VoidCallback? onTap;

  const SessionCard({
    required this.session,
    required this.matchTitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with match title and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      matchTitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SessionStatusBadge(status: session.status),
                ],
              ),
              const SizedBox(height: 12),

              // Stats
              Row(
                children: [
                  _StatItem(
                    icon: Icons.verified_user,
                    label: 'Verificaciones',
                    value: '${session.totalVerifications}',
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    icon: Icons.access_time,
                    label: 'Duración',
                    value: session.formattedDuration,
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Team verifications
              Row(
                children: [
                  Expanded(
                    child: _TeamStat(
                      label: 'Local',
                      count: session.homeTeamVerifications,
                      isHome: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _TeamStat(
                      label: 'Visitante',
                      count: session.awayTeamVerifications,
                      isHome: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    'Iniciada: ${_formatDate(session.startedAt)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TeamStat extends StatelessWidget {
  final String label;
  final int count;
  final bool isHome;

  const _TeamStat({
    required this.label,
    required this.count,
    required this.isHome,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isHome
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isHome
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSecondaryContainer,
            ),
          ),
          Text(
            '$count',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isHome
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
