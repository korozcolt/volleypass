/// Widget de sección para mostrar información del partido.
library;

import 'package:flutter/material.dart';
import '../../domain/entities/available_match.dart';

class MatchInfoSection extends StatelessWidget {
  final AvailableMatch match;

  const MatchInfoSection({
    required this.match,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información del Partido',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Tournament
            _InfoRow(
              icon: Icons.emoji_events,
              label: 'Torneo',
              value: match.tournamentName,
            ),
            const SizedBox(height: 12),

            // Teams
            _InfoRow(
              icon: Icons.sports_volleyball,
              label: 'Equipos',
              value: match.matchTitle,
            ),
            const SizedBox(height: 12),

            // Date and time
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Fecha',
              value: match.formattedScheduledDate,
            ),
            const SizedBox(height: 12),

            // Venue
            _InfoRow(
              icon: Icons.location_on,
              label: 'Lugar',
              value: match.venue,
            ),
            const SizedBox(height: 12),

            // Status
            _InfoRow(
              icon: Icons.info_outline,
              label: 'Estado',
              value: _getStatusLabel(match.status),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'scheduled':
        return 'Programado';
      case 'in_progress':
        return 'En Progreso';
      case 'finished':
        return 'Finalizado';
      default:
        return status;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
