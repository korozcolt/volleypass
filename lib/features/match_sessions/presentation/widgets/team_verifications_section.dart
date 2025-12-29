/// Widget de sección para mostrar verificaciones agrupadas por equipo.
library;

import 'package:flutter/material.dart';
import '../../domain/entities/session_verification.dart';
import 'verification_list_item.dart';

class TeamVerificationsSection extends StatelessWidget {
  final List<SessionVerification> verifications;
  final String homeTeamName;
  final String awayTeamName;

  const TeamVerificationsSection({
    required this.verifications,
    required this.homeTeamName,
    required this.awayTeamName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final homeVerifications =
        verifications.where((v) => v.team == 'home').toList();
    final awayVerifications =
        verifications.where((v) => v.team == 'away').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Home team section
        if (homeVerifications.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.home, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  '$homeTeamName (${homeVerifications.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ...homeVerifications.map((v) => VerificationListItem(verification: v)),
          const SizedBox(height: 16),
        ],

        // Away team section
        if (awayVerifications.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.flight, color: theme.colorScheme.secondary),
                const SizedBox(width: 8),
                Text(
                  '$awayTeamName (${awayVerifications.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          ...awayVerifications.map((v) => VerificationListItem(verification: v)),
        ],

        // Empty state
        if (homeVerifications.isEmpty && awayVerifications.isEmpty)
          const Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.verified_user_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Aún no hay verificaciones',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
