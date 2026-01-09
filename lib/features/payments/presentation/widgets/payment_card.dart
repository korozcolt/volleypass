/// Widget de tarjeta de pago.
library;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/payment_status.dart';

class PaymentCard extends StatelessWidget {
  final Payment payment;
  final VoidCallback? onTap;
  final VoidCallback? onUploadProof;

  const PaymentCard({
    super.key,
    required this.payment,
    this.onTap,
    this.onUploadProof,
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
              // Header: Tipo y Estado
              Row(
                children: [
                  // Icono del tipo de pago
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getTypeColor().withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getTypeIcon(),
                      color: _getTypeColor(),
                      size: 20,
                    ),
                  ),
                  AppSpacing.horizontalSpaceSM,
                  // Tipo de pago
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          payment.type.displayName,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          payment.description,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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

              // Botón de acción si puede subir comprobante
              if (payment.canUploadProof && onUploadProof != null) ...[
                AppSpacing.verticalSpaceSM,
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: onUploadProof,
                    icon: const Icon(Icons.upload_file, size: 18),
                    label: const Text('Subir Comprobante'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ),
              ],

              // Mostrar mensaje si tiene comprobante
              if (payment.hasProof && payment.status == PaymentStatus.underVerification) ...[
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
                        Icons.info_outline,
                        size: 16,
                        color: AppColors.info,
                      ),
                      AppSpacing.horizontalSpaceXS,
                      Expanded(
                        child: Text(
                          'Comprobante en revisión por el club',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.info,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Mostrar notas de rechazo si fue rechazado
              if (payment.status == PaymentStatus.rejected &&
                  payment.rejectionNotes != null) ...[
                AppSpacing.verticalSpaceSM,
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning_amber,
                        size: 16,
                        color: AppColors.error,
                      ),
                      AppSpacing.horizontalSpaceXS,
                      Expanded(
                        child: Text(
                          'Rechazado: ${payment.rejectionNotes}',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
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

  Color _getTypeColor() {
    return AppColors.primary;
  }

  IconData _getTypeIcon() {
    final iconName = payment.type.iconName;
    switch (iconName) {
      case 'calendar_month':
        return Icons.calendar_month;
      case 'person_add':
        return Icons.person_add;
      case 'emoji_events':
        return Icons.emoji_events;
      case 'warning':
        return Icons.warning;
      case 'card_membership':
        return Icons.card_membership;
      case 'payments':
      default:
        return Icons.payments;
    }
  }
}
