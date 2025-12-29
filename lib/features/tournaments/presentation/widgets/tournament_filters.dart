/// Widget de filtros para torneos.
library;

import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';

class TournamentFilters extends StatefulWidget {
  final String? selectedStatus;
  final String? selectedType;
  final String? selectedCategory;
  final String? selectedGender;
  final Function({
    String? status,
    String? type,
    String? category,
    String? gender,
  }) onApply;

  const TournamentFilters({
    super.key,
    this.selectedStatus,
    this.selectedType,
    this.selectedCategory,
    this.selectedGender,
    required this.onApply,
  });

  @override
  State<TournamentFilters> createState() => _TournamentFiltersState();
}

class _TournamentFiltersState extends State<TournamentFilters> {
  String? _status;
  String? _type;
  String? _category;
  String? _gender;

  @override
  void initState() {
    super.initState();
    _status = widget.selectedStatus;
    _type = widget.selectedType;
    _category = widget.selectedCategory;
    _gender = widget.selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filtros',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            AppSpacing.verticalSpaceMD,

            // Estado
            const Text(
              'Estado',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            _FilterChips(
              options: const {
                null: 'Todos',
                'scheduled': 'Programados',
                'in_progress': 'En Progreso',
                'finished': 'Finalizados',
              },
              selectedValue: _status,
              onSelected: (value) => setState(() => _status = value),
            ),
            AppSpacing.verticalSpaceMD,

            // Tipo
            const Text(
              'Tipo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            _FilterChips(
              options: const {
                null: 'Todos',
                'championship': 'Campeonato',
                'league': 'Liga',
                'friendly': 'Amistoso',
              },
              selectedValue: _type,
              onSelected: (value) => setState(() => _type = value),
            ),
            AppSpacing.verticalSpaceMD,

            // Categoría
            const Text(
              'Categoría',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            _FilterChips(
              options: const {
                null: 'Todas',
                'senior': 'Senior',
                'junior': 'Junior',
                'sub_17': 'Sub-17',
              },
              selectedValue: _category,
              onSelected: (value) => setState(() => _category = value),
            ),
            AppSpacing.verticalSpaceMD,

            // Género
            const Text(
              'Género',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            _FilterChips(
              options: const {
                null: 'Todos',
                'male': 'Masculino',
                'female': 'Femenino',
                'mixed': 'Mixto',
              },
              selectedValue: _gender,
              onSelected: (value) => setState(() => _gender = value),
            ),
            AppSpacing.verticalSpaceLG,

            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _status = null;
                        _type = null;
                        _category = null;
                        _gender = null;
                      });
                      widget.onApply();
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Limpiar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(
                        status: _status,
                        type: _type,
                        category: _category,
                        gender: _gender,
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Aplicar Filtros'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  final Map<String?, String> options;
  final String? selectedValue;
  final ValueChanged<String?> onSelected;

  const _FilterChips({
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.entries.map((entry) {
        final isSelected = entry.key == selectedValue;

        return ChoiceChip(
          label: Text(entry.value),
          selected: isSelected,
          onSelected: (_) => onSelected(entry.key),
          selectedColor: AppColors.primary.withOpacity(0.2),
          checkmarkColor: AppColors.primary,
          labelStyle: TextStyle(
            color: isSelected ? AppColors.primary : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? AppColors.primary : Colors.grey[300]!,
              width: isSelected ? 1.5 : 1,
            ),
          ),
        );
      }).toList(),
    );
  }
}
