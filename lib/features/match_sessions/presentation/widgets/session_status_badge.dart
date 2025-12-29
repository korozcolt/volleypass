/// Widget de badge para mostrar el estado de una sesión.
library;

import 'package:flutter/material.dart';

class SessionStatusBadge extends StatelessWidget {
  final String status;
  final bool compact;

  const SessionStatusBadge({
    required this.status,
    this.compact = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusInfo = _getStatusInfo(status);

    return Container(
      padding: compact
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusInfo.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusInfo.color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusInfo.icon,
            size: compact ? 12 : 16,
            color: statusInfo.color,
          ),
          const SizedBox(width: 4),
          Text(
            statusInfo.label,
            style: (compact ? theme.textTheme.bodySmall : theme.textTheme.bodyMedium)?.copyWith(
              color: statusInfo.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _StatusInfo _getStatusInfo(String status) {
    switch (status) {
      case 'active':
        return _StatusInfo(
          label: 'Activa',
          color: Colors.green,
          icon: Icons.play_circle_filled,
        );
      case 'paused':
        return _StatusInfo(
          label: 'Pausada',
          color: Colors.orange,
          icon: Icons.pause_circle_filled,
        );
      case 'completed':
        return _StatusInfo(
          label: 'Completada',
          color: Colors.blue,
          icon: Icons.check_circle,
        );
      default:
        return _StatusInfo(
          label: 'Desconocido',
          color: Colors.grey,
          icon: Icons.help,
        );
    }
  }
}

class _StatusInfo {
  final String label;
  final Color color;
  final IconData icon;

  _StatusInfo({
    required this.label,
    required this.color,
    required this.icon,
  });
}
