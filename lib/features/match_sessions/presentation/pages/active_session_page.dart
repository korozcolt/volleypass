/// Página para mostrar y controlar la planilla activa.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/match_session_providers.dart';
import '../widgets/session_header.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/loading_widget.dart';

class ActiveSessionPage extends ConsumerStatefulWidget {
  const ActiveSessionPage({super.key});

  @override
  ConsumerState<ActiveSessionPage> createState() => _ActiveSessionPageState();
}

class _ActiveSessionPageState extends ConsumerState<ActiveSessionPage> {
  @override
  void initState() {
    super.initState();
    // Load active session on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeSessionStateProvider.notifier).loadActiveSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeSessionStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planilla Activa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(activeSessionStateProvider.notifier).loadActiveSession();
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/sessions-history');
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const LoadingWidget(message: 'Cargando planilla...'),
        loading: () => const LoadingWidget(message: 'Cargando planilla...'),
        loaded: (session) {
          if (session == null) {
            return EmptyStateWidget(
              icon: Icons.play_circle_outline,
              message: 'No tienes una planilla activa',
              actionLabel: 'Crear Planilla',
              onAction: () {
                Navigator.pushNamed(context, '/available-matches');
              },
            );
          }

          // TODO: Get match title from session details or cache
          final matchTitle = 'Partido #${session.matchId}';

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(activeSessionStateProvider.notifier)
                  .loadActiveSession(showLoading: false);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SessionHeader(
                    session: session,
                    matchTitle: matchTitle,
                    onPause: session.isActive
                        ? () => _pauseSession(session.id)
                        : null,
                    onResume: session.isPaused
                        ? () => _resumeSession(session.id)
                        : null,
                    onComplete: (session.isActive || session.isPaused)
                        ? () => _completeSessionDialog(session.id)
                        : null,
                    onViewDetails: () => _viewDetails(session.id),
                  ),
                  const SizedBox(height: 16),
                  // Quick actions
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Acciones Rápidas',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              leading: const Icon(Icons.qr_code_scanner),
                              title: const Text('Escanear QR'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.pushNamed(context, '/scanner');
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.info_outline),
                              title: const Text('Ver Detalles'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () => _viewDetails(session.id),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        updating: () => const LoadingWidget(message: 'Actualizando planilla...'),
        error: (message) => EmptyStateWidget(
          icon: Icons.error_outline,
          message: message,
          actionLabel: 'Reintentar',
          onAction: () {
            ref.read(activeSessionStateProvider.notifier).loadActiveSession();
          },
        ),
      ),
    );
  }

  Future<void> _pauseSession(int sessionId) async {
    await ref.read(activeSessionStateProvider.notifier).pauseSession(sessionId);

    if (!mounted) return;
    final state = ref.read(activeSessionStateProvider);
    state.whenOrNull(
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }

  Future<void> _resumeSession(int sessionId) async {
    await ref.read(activeSessionStateProvider.notifier).resumeSession(sessionId);

    if (!mounted) return;
    final state = ref.read(activeSessionStateProvider);
    state.whenOrNull(
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }

  void _completeSessionDialog(int sessionId) {
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Completar Planilla'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Estás seguro de completar esta planilla?'),
            const SizedBox(height: 16),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Notas finales (opcional)',
                hintText: 'Escribe observaciones sobre la planilla',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await _completeSession(sessionId, notesController.text.trim());
            },
            child: const Text('Completar'),
          ),
        ],
      ),
    );
  }

  Future<void> _completeSession(int sessionId, String notes) async {
    await ref.read(activeSessionStateProvider.notifier).completeSession(
          sessionId: sessionId,
          notes: notes.isEmpty ? null : notes,
        );

    if (!mounted) return;
    final state = ref.read(activeSessionStateProvider);
    state.when(
      loaded: (session) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Planilla completada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      },
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
      },
      initial: () {},
      loading: () {},
      updating: () {},
    );
  }

  void _viewDetails(int sessionId) {
    Navigator.pushNamed(
      context,
      '/session-details',
      arguments: sessionId,
    );
  }
}
