/// Widget de tarjeta de pago para ClubAdmin.
library;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/payment_status.dart';

class ClubPaymentCard extends StatelessWidget {
  final Payment payment;
  final VoidCallback? onTap;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;
  final VoidCallback? onViewProof;

  const ClubPaymentCard({
    super.key,
    required this.payment,
    this.onTap,
    this.onApprove,
    this.onReject,
    this.onViewProof,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: AppSpacing.paddingSM,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Jugador y Estado
              Row(
                children: [
                  // Avatar del jugador
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      payment.playerName.isNotEmpty
                          ? payment.playerName[0].toUpperCase()
                          : '?',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AppSpacing.horizontalSpaceSM,
                  // Nombre del jugador
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          payment.playerName,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          payment.type.displayName,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Badge de estado
                  _buildStatusBadge(),
                ],
              ),
              AppSpacing.verticalSpaceSM,

              // Divider
              const Divider(height: 1),
              AppSpacing.verticalSpaceSM,

              // Información del pago
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Monto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monto',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(payment.amount),
                        style: AppTextStyles.h6.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Fecha de vencimiento
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        payment.isOverdue ? 'Vencido' : 'Vence',
                        style: AppTextStyles.caption.copyWith(
                          color: payment.isOverdue
                              ? AppColors.error
                              : AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd/MM/yyyy').format(payment.dueDate),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: payment.isOverdue
                              ? AppColors.error
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Comprobante si existe
              if (payment.hasProof) ...[
                AppSpacing.verticalSpaceSM,
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.info.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_file,
                        size: 16,
                        color: AppColors.info,
                      ),
                      AppSpacing.horizontalSpaceXS,
                      Expanded(
                        child: Text(
                          'Comprobante adjunto',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.info,
                          ),
                        ),
                      ),
                      if (onViewProof != null)
                        TextButton(
                          onPressed: onViewProof,
                          child: const Text('Ver'),
                        ),
                    ],
                  ),
                ),
              ],

              // Botones de acción si puede ser verificado
              if (payment.canBeVerified &&
                  (onApprove != null || onReject != null)) ...[
                AppSpacing.verticalSpaceSM,
                Row(
                  children: [
                    if (onReject != null)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: onReject,
                          icon: const Icon(Icons.close, size: 18),
                          label: const Text('Rechazar'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: const BorderSide(color: AppColors.error),
                          ),
                        ),
                      ),
                    if (onReject != null && onApprove != null)
                      AppSpacing.horizontalSpaceSM,
                    if (onApprove != null)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onApprove,
                          icon: const Icon(Icons.check, size: 18),
                          label: const Text('Aprobar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                          ),
                        ),
                      ),
                  ],
                ),
              ],

              // Descripción
              if (payment.description.isNotEmpty) ...[
                AppSpacing.verticalSpaceSM,
                Text(
                  payment.description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final color = _getStatusColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        payment.status.displayName,
        style: AppTextStyles.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (payment.status) {
      case PaymentStatus.pending:
        return AppColors.warning;
      case PaymentStatus.underVerification:
        return AppColors.info;
      case PaymentStatus.verified:
      case PaymentStatus.completed:
        return AppColors.success;
      case PaymentStatus.rejected:
      case PaymentStatus.overdue:
        return AppColors.error;
      case PaymentStatus.cancelled:
      case PaymentStatus.refunded:
        return AppColors.textSecondary;
    }
  }
}
