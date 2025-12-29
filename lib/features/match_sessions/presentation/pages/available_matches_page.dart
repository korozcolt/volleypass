/// Página para mostrar partidos disponibles para crear planillas.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/match_session_providers.dart';
import '../widgets/available_match_card.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/loading_widget.dart';

class AvailableMatchesPage extends ConsumerStatefulWidget {
  const AvailableMatchesPage({super.key});

  @override
  ConsumerState<AvailableMatchesPage> createState() =>
      _AvailableMatchesPageState();
}

class _AvailableMatchesPageState extends ConsumerState<AvailableMatchesPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load matches on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(availableMatchesStateProvider.notifier)
          .loadMatches(refresh: true);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(availableMatchesStateProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(availableMatchesStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidos Disponibles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref
                  .read(availableMatchesStateProvider.notifier)
                  .loadMatches(refresh: true);
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const LoadingWidget(message: 'Cargando partidos...'),
        loading: () => const LoadingWidget(message: 'Cargando partidos...'),
        loaded: (matches, hasMore, _) {
          if (matches.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.sports_volleyball,
              message: 'No hay partidos disponibles en este momento',
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(availableMatchesStateProvider.notifier)
                  .loadMatches(refresh: true);
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: matches.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == matches.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final match = matches[index];
                return AvailableMatchCard(
                  match: match,
                  onTap: () =>
                      _showCreateSessionDialog(match.id, match.matchTitle),
                );
              },
            ),
          );
        },
        error: (message) => EmptyStateWidget(
          icon: Icons.error_outline,
          message: message,
          actionLabel: 'Reintentar',
          onAction: () {
            ref
                .read(availableMatchesStateProvider.notifier)
                .loadMatches(refresh: true);
          },
        ),
        empty: () => const EmptyStateWidget(
          icon: Icons.sports_volleyball,
          message: 'No hay partidos disponibles en este momento',
        ),
      ),
    );
  }

  void _showCreateSessionDialog(int matchId, String matchTitle) {
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Crear Planilla'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('¿Deseas crear una planilla para:'),
            const SizedBox(height: 8),
            Text(
              matchTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Notas (opcional)',
                hintText: 'Escribe notas sobre la planilla',
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
              await _createSession(matchId, notesController.text.trim());
            },
            child: const Text('Crear'),
          ),
        ],
      ),
    );
  }

  Future<void> _createSession(int matchId, String notes) async {
    // Show loading
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Create session
    await ref
        .read(createSessionStateProvider.notifier)
        .createSession(matchId: matchId, notes: notes.isEmpty ? null : notes);

    // Hide loading
    if (!mounted) return;
    Navigator.pop(context);

    // Handle result
    final createState = ref.read(createSessionStateProvider);
    createState.when(
      initial: () {},
      creating: () {},
      success: (session) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Planilla creada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to active session or dashboard
        Navigator.pop(context);
      },
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      },
    );
  }
}
