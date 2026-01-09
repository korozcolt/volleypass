/// Vista vacía cuando no hay pagos.
library;

import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';

class EmptyPaymentsView extends StatelessWidget {
  final bool hasFilters;
  final VoidCallback? onClearFilters;

  const EmptyPaymentsView({
    super.key,
    this.hasFilters = false,
    this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingLG,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hasFilters ? Icons.filter_alt_off : Icons.receipt_long,
              size: 80,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            AppSpacing.verticalSpaceMD,
            Text(
              hasFilters ? 'No hay pagos que coincidan' : 'No hay pagos',
              style: AppTextStyles.h6.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            AppSpacing.verticalSpaceSM,
            Text(
              hasFilters
                  ? 'Intenta cambiar los filtros de búsqueda'
                  : 'Cuando tengas pagos pendientes aparecerán aquí',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (hasFilters && onClearFilters != null) ...[
              AppSpacing.verticalSpaceLG,
              ElevatedButton.icon(
                onPressed: onClearFilters,
                icon: const Icon(Icons.clear_all),
                label: const Text('Limpiar Filtros'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
