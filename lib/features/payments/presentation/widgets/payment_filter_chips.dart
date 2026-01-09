/// Chips de filtrado para pagos.
library;

import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/payment_status.dart';
import '../../domain/entities/payment_type.dart';

class PaymentFilterChips extends StatelessWidget {
  final String? selectedStatus;
  final String? selectedType;
  final bool showOnlyOverdue;
  final Function(String?) onStatusChanged;
  final Function(String?) onTypeChanged;
  final Function(bool) onOverdueChanged;
  final VoidCallback onClearAll;

  const PaymentFilterChips({
    super.key,
    required this.selectedStatus,
    required this.selectedType,
    required this.showOnlyOverdue,
    required this.onStatusChanged,
    required this.onTypeChanged,
    required this.onOverdueChanged,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    final hasFilters = selectedStatus != null ||
        selectedType != null ||
        showOnlyOverdue;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Filtros',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (hasFilters)
                TextButton.icon(
                  onPressed: onClearAll,
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Limpiar'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.error,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Filtro de estado
                _buildStatusChips(),
                const SizedBox(width: 8),
                // Filtro de tipo
                _buildTypeChips(),
                const SizedBox(width: 8),
                // Filtro de vencidos
                FilterChip(
                  label: const Text('Solo Vencidos'),
                  selected: showOnlyOverdue,
                  onSelected: onOverdueChanged,
                  selectedColor: AppColors.error.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.error,
                  labelStyle: TextStyle(
                    color: showOnlyOverdue ? AppColors.error : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChips() {
    return PopupMenuButton<String>(
      child: Chip(
        label: Text(
          selectedStatus != null
              ? PaymentStatus.fromJson(selectedStatus!).displayName
              : 'Estado',
        ),
        deleteIcon: selectedStatus != null ? const Icon(Icons.close, size: 16) : null,
        onDeleted: selectedStatus != null ? () => onStatusChanged(null) : null,
        avatar: const Icon(Icons.filter_list, size: 16),
      ),
      onSelected: (value) {
        if (value == selectedStatus) {
          onStatusChanged(null);
        } else {
          onStatusChanged(value);
        }
      },
      itemBuilder: (context) => [
        for (final status in PaymentStatus.values)
          PopupMenuItem(
            value: status.toJson(),
            child: Row(
              children: [
                if (selectedStatus == status.toJson())
                  const Icon(Icons.check, size: 16, color: AppColors.primary)
                else
                  const SizedBox(width: 16),
                const SizedBox(width: 8),
                Text(status.displayName),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTypeChips() {
    return PopupMenuButton<String>(
      child: Chip(
        label: Text(
          selectedType != null
              ? PaymentType.fromJson(selectedType!).displayName
              : 'Tipo',
        ),
        deleteIcon: selectedType != null ? const Icon(Icons.close, size: 16) : null,
        onDeleted: selectedType != null ? () => onTypeChanged(null) : null,
        avatar: const Icon(Icons.category, size: 16),
      ),
      onSelected: (value) {
        if (value == selectedType) {
          onTypeChanged(null);
        } else {
          onTypeChanged(value);
        }
      },
      itemBuilder: (context) => [
        for (final type in PaymentType.values)
          PopupMenuItem(
            value: type.toJson(),
            child: Row(
              children: [
                if (selectedType == type.toJson())
                  const Icon(Icons.check, size: 16, color: AppColors.primary)
                else
                  const SizedBox(width: 16),
                const SizedBox(width: 8),
                Text(type.displayName),
              ],
            ),
          ),
      ],
    );
  }
}
