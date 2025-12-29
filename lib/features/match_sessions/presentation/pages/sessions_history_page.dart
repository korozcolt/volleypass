/// Página para mostrar el historial de planillas.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/match_session_providers.dart';
import '../widgets/session_card.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/loading_widget.dart';

class SessionsHistoryPage extends ConsumerStatefulWidget {
  const SessionsHistoryPage({super.key});

  @override
  ConsumerState<SessionsHistoryPage> createState() =>
      _SessionsHistoryPageState();
}

class _SessionsHistoryPageState extends ConsumerState<SessionsHistoryPage> {
  final _scrollController = ScrollController();
  String? _statusFilter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load history on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sessionsHistoryStateProvider.notifier).loadHistory(refresh: true);
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
      ref.read(sessionsHistoryStateProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sessionsHistoryStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Planillas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(sessionsHistoryStateProvider.notifier).loadHistory(
                    statusFilter: _statusFilter,
                    refresh: true,
                  );
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const LoadingWidget(message: 'Cargando historial...'),
        loading: () => const LoadingWidget(message: 'Cargando historial...'),
        loaded: (sessions, hasMore, _, statusFilter, __) {
          if (sessions.isEmpty) {
            return EmptyStateWidget(
              icon: Icons.history,
              message: statusFilter != null
                  ? 'No hay planillas con el filtro seleccionado'
                  : 'Aún no tienes planillas',
              actionLabel: statusFilter != null ? 'Limpiar Filtro' : null,
              onAction: statusFilter != null
                  ? () {
                      setState(() => _statusFilter = null);
                      ref
                          .read(sessionsHistoryStateProvider.notifier)
                          .loadHistory(refresh: true);
                    }
                  : null,
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(sessionsHistoryStateProvider.notifier).loadHistory(
                    statusFilter: _statusFilter,
                    refresh: true,
                  );
            },
            child: Column(
              children: [
                // Filter chip
                if (_statusFilter != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Chip(
                          label: Text('Filtro: ${_getStatusLabel(_statusFilter!)}'),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () {
                            setState(() => _statusFilter = null);
                            ref
                                .read(sessionsHistoryStateProvider.notifier)
                                .loadHistory(refresh: true);
                          },
                        ),
                      ],
                    ),
                  ),

                // List
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: sessions.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == sessions.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final session = sessions[index];
                      // TODO: Get match title from cache or API
                      final matchTitle = 'Partido #${session.matchId}';

                      return SessionCard(
                        session: session,
                        matchTitle: matchTitle,
                        onTap: () => _viewDetails(session.id),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (message) => EmptyStateWidget(
          icon: Icons.error_outline,
          message: message,
          actionLabel: 'Reintentar',
          onAction: () {
            ref.read(sessionsHistoryStateProvider.notifier).loadHistory(
                  statusFilter: _statusFilter,
                  refresh: true,
                );
          },
        ),
        empty: () => const EmptyStateWidget(
          icon: Icons.history,
          message: 'Aún no tienes planillas',
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrar por Estado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Todas'),
              leading: Radio<String?>(
                value: null,
                groupValue: _statusFilter,
                onChanged: (value) {
                  setState(() => _statusFilter = value);
                  Navigator.pop(context);
                  ref.read(sessionsHistoryStateProvider.notifier).applyFilters(
                        statusFilter: value,
                      );
                },
              ),
            ),
            ListTile(
              title: const Text('Activas'),
              leading: Radio<String?>(
                value: 'active',
                groupValue: _statusFilter,
                onChanged: (value) {
                  setState(() => _statusFilter = value);
                  Navigator.pop(context);
                  ref.read(sessionsHistoryStateProvider.notifier).applyFilters(
                        statusFilter: value,
                      );
                },
              ),
            ),
            ListTile(
              title: const Text('Pausadas'),
              leading: Radio<String?>(
                value: 'paused',
                groupValue: _statusFilter,
                onChanged: (value) {
                  setState(() => _statusFilter = value);
                  Navigator.pop(context);
                  ref.read(sessionsHistoryStateProvider.notifier).applyFilters(
                        statusFilter: value,
                      );
                },
              ),
            ),
            ListTile(
              title: const Text('Completadas'),
              leading: Radio<String?>(
                value: 'completed',
                groupValue: _statusFilter,
                onChanged: (value) {
                  setState(() => _statusFilter = value);
                  Navigator.pop(context);
                  ref.read(sessionsHistoryStateProvider.notifier).applyFilters(
                        statusFilter: value,
                      );
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'active':
        return 'Activas';
      case 'paused':
        return 'Pausadas';
      case 'completed':
        return 'Completadas';
      default:
        return status;
    }
  }

  void _viewDetails(int sessionId) {
    Navigator.pushNamed(
      context,
      '/session-details',
      arguments: sessionId,
    );
  }
}
