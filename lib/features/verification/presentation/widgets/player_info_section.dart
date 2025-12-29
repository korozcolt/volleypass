/// Widget de sección de información del jugador.
///
/// Componente reutilizable para agrupar información con un título e icono.
library;

import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';

class PlayerInfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final List<Widget> children;

  const PlayerInfoSection({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusMD,
      ),
      child: Padding(
        padding: AppSpacing.paddingLG,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header de la sección
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor ?? AppColors.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTextStyles.h6.copyWith(
                    color: iconColor ?? AppColors.primary,
                  ),
                ),
              ],
            ),
            AppSpacing.verticalSpaceMD,
            const Divider(),
            AppSpacing.verticalSpaceSM,

            // Contenido de la sección
            ...children,
          ],
        ),
      ),
    );
  }
}
