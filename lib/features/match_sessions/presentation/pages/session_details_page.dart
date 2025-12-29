/// Página para mostrar los detalles completos de una planilla.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/match_session_providers.dart';
import '../widgets/session_stats_card.dart';
import '../widgets/match_info_section.dart';
import '../widgets/team_verifications_section.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/loading_widget.dart';

class SessionDetailsPage extends ConsumerStatefulWidget {
  final int sessionId;

  const SessionDetailsPage({
    required this.sessionId,
    super.key,
  });

  @override
  ConsumerState<SessionDetailsPage> createState() =>
      _SessionDetailsPageState();
}

class _SessionDetailsPageState extends ConsumerState<SessionDetailsPage> {
  @override
  void initState() {
    super.initState();
    // Load session details on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(sessionDetailsStateProvider.notifier)
          .loadSessionDetails(widget.sessionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sessionDetailsStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Planilla'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref
                  .read(sessionDetailsStateProvider.notifier)
                  .refresh(widget.sessionId);
            },
          ),
        ],
      ),
      body: state.when(
        initial: () =>
            const LoadingWidget(message: 'Cargando detalles de planilla...'),
        loading: () =>
            const LoadingWidget(message: 'Cargando detalles de planilla...'),
        loaded: (session, match, verifications) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(sessionDetailsStateProvider.notifier)
                  .refresh(widget.sessionId);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Match info
                  MatchInfoSection(match: match),

                  // Session stats
                  SessionStatsCard(session: session),

                  // Verifications by team
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Verificaciones (${verifications.length})',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),

                  TeamVerificationsSection(
                    verifications: verifications,
                    homeTeamName: match.homeTeam,
                    awayTeamName: match.awayTeam,
                  ),

                  const SizedBox(height: 16),

                  // Notes section
                  if (session.notes != null && session.notes!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.note,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Notas',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(session.notes!),
                            ],
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
        error: (message) => EmptyStateWidget(
          icon: Icons.error_outline,
          message: message,
          actionLabel: 'Reintentar',
          onAction: () {
            ref
                .read(sessionDetailsStateProvider.notifier)
                .loadSessionDetails(widget.sessionId);
          },
        ),
      ),
    );
  }
}
