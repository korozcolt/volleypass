/// Widget de item de lista para mostrar una verificación en la sesión.
library;

import 'package:flutter/material.dart';
import '../../domain/entities/session_verification.dart';

class VerificationListItem extends StatelessWidget {
  final SessionVerification verification;

  const VerificationListItem({
    required this.verification,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEligible = verification.isEligible;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isEligible ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        child: Text(
          verification.statusIcon,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      title: Text(
        verification.playerName,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Carnet: ${verification.cardNumber}'),
          if (!isEligible && verification.restrictionReason != null)
            Text(
              verification.restrictionReason!,
              style: TextStyle(
                color: theme.colorScheme.error,
                fontSize: 12,
              ),
            ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: verification.isHomeTeam
                  ? theme.colorScheme.primaryContainer
                  : theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              verification.team == 'home' ? 'Local' : 'Visitante',
              style: theme.textTheme.bodySmall?.copyWith(
                color: verification.isHomeTeam
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _formatTime(verification.verifiedAt),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
