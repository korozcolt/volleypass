/// Página de lista de torneos públicos.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../providers/tournaments_providers.dart';
import '../widgets/tournament_card.dart';
import '../widgets/tournament_filters.dart';

class TournamentsListPage extends ConsumerStatefulWidget {
  const TournamentsListPage({super.key});

  @override
  ConsumerState<TournamentsListPage> createState() =>
      _TournamentsListPageState();
}

class _TournamentsListPageState extends ConsumerState<TournamentsListPage> {
  String? _selectedStatus;
  String? _selectedType;
  String? _selectedCategory;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tournamentsNotifierProvider.notifier).loadTournaments();
    });
  }

  void _applyFilters({
    String? status,
    String? type,
    String? category,
    String? gender,
  }) {
    setState(() {
      _selectedStatus = status;
      _selectedType = type;
      _selectedCategory = category;
      _selectedGender = gender;
    });

    ref
        .read(tournamentsNotifierProvider.notifier)
        .loadTournaments(
          status: status,
          type: type,
          category: category,
          gender: gender,
        );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TournamentFilters(
        selectedStatus: _selectedStatus,
        selectedType: _selectedType,
        selectedCategory: _selectedCategory,
        selectedGender: _selectedGender,
        onApply: _applyFilters,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tournamentsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Torneos'),
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible:
                  _selectedStatus != null ||
                  _selectedType != null ||
                  _selectedCategory != null ||
                  _selectedGender != null,
              child: const Icon(Icons.filter_list),
            ),
            onPressed: _showFilters,
          ),
        ],
      ),
      body: state.when(
        initial: () => const Center(child: Text('Cargando torneos...')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              AppSpacing.verticalSpaceMD,
              Text(
                message,
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
              AppSpacing.verticalSpaceMD,
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(tournamentsNotifierProvider.notifier)
                      .refresh(
                        status: _selectedStatus,
                        type: _selectedType,
                        category: _selectedCategory,
                        gender: _selectedGender,
                      );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (tournaments) {
          if (tournaments.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.emoji_events_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  AppSpacing.verticalSpaceMD,
                  Text(
                    'No hay torneos disponibles',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  if (_selectedStatus != null ||
                      _selectedType != null ||
                      _selectedCategory != null ||
                      _selectedGender != null) ...[
                    AppSpacing.verticalSpaceSM,
                    TextButton.icon(
                      onPressed: () => _applyFilters(),
                      icon: const Icon(Icons.clear),
                      label: const Text('Limpiar filtros'),
                    ),
                  ],
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(tournamentsNotifierProvider.notifier)
                  .refresh(
                    status: _selectedStatus,
                    type: _selectedType,
                    category: _selectedCategory,
                    gender: _selectedGender,
                  );
            },
            child: ListView.builder(
              padding: AppSpacing.paddingSM,
              itemCount: tournaments.length,
              itemBuilder: (context, index) {
                return TournamentCard(
                  tournament: tournaments[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tournament-detail',
                      arguments: tournaments[index].id,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
