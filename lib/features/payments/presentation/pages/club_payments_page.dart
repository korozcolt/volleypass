/// Página de gestión de pagos para ClubAdmin.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/payment_status.dart';
import '../providers/payment_providers.dart';
import '../state/payment_state.dart';
import '../widgets/club_payment_card.dart';
import '../widgets/empty_payments_view.dart';

class ClubPaymentsPage extends ConsumerStatefulWidget {
  const ClubPaymentsPage({super.key});

  @override
  ConsumerState<ClubPaymentsPage> createState() => _ClubPaymentsPageState();
}

class _ClubPaymentsPageState extends ConsumerState<ClubPaymentsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Cargar pagos al iniciar
    Future.microtask(() {
      ref.read(clubPaymentListNotifierProvider.notifier).loadPayments();
    });

    // Escuchar scroll para cargar más
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = ref.read(clubPaymentListNotifierProvider);
      state.maybeWhen(
        loaded: (_, hasMore, __) {
          if (hasMore) {
            ref.read(clubPaymentListNotifierProvider.notifier).loadMore();
          }
        },
        orElse: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(clubPaymentListNotifierProvider);
    final statusFilter = ref.watch(clubPaymentStatusFilterProvider);
    final verifyState = ref.watch(verifyPaymentNotifierProvider);

    // Escuchar cambios en el estado de verificación
    ref.listen<VerifyPaymentState>(
      verifyPaymentNotifierProvider,
      (previous, next) {
        next.when(
          initial: () {},
          processing: () {},
          success: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.success,
              ),
            );
            // Recargar lista de pagos
            ref.read(clubPaymentListNotifierProvider.notifier).refresh();
            ref.read(verifyPaymentNotifierProvider.notifier).reset();
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.error,
              ),
            );
            ref.read(verifyPaymentNotifierProvider.notifier).reset();
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos del Club'),
        actions: [
          // Filtro por estado
          PopupMenuButton<String?>(
            icon: Icon(
              statusFilter != null ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            tooltip: 'Filtrar por estado',
            onSelected: (value) {
              ref.read(clubPaymentStatusFilterProvider.notifier).state = value;
              ref
                  .read(clubPaymentListNotifierProvider.notifier)
                  .filterByStatus(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: null,
                child: Text('Todos'),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: PaymentStatus.underVerification.toJson(),
                child: Row(
                  children: [
                    if (statusFilter == PaymentStatus.underVerification.toJson())
                      const Icon(Icons.check, size: 16, color: AppColors.primary)
                    else
                      const SizedBox(width: 16),
                    const SizedBox(width: 8),
                    const Text('En Verificación'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PaymentStatus.verified.toJson(),
                child: Row(
                  children: [
                    if (statusFilter == PaymentStatus.verified.toJson())
                      const Icon(Icons.check, size: 16, color: AppColors.primary)
                    else
                      const SizedBox(width: 16),
                    const SizedBox(width: 8),
                    const Text('Verificados'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PaymentStatus.rejected.toJson(),
                child: Row(
                  children: [
                    if (statusFilter == PaymentStatus.rejected.toJson())
                      const Icon(Icons.check, size: 16, color: AppColors.primary)
                    else
                      const SizedBox(width: 16),
                    const SizedBox(width: 8),
                    const Text('Rechazados'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: PaymentStatus.overdue.toJson(),
                child: Row(
                  children: [
                    if (statusFilter == PaymentStatus.overdue.toJson())
                      const Icon(Icons.check, size: 16, color: AppColors.primary)
                    else
                      const SizedBox(width: 16),
                    const SizedBox(width: 8),
                    const Text('Vencidos'),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(clubPaymentListNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: paymentState.when(
        initial: () => const Center(
          child: Text('Inicializando...'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              AppSpacing.verticalSpaceMD,
              Text(
                'Error al cargar pagos',
                style: AppTextStyles.h6,
              ),
              AppSpacing.verticalSpaceSM,
              Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.verticalSpaceLG,
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(clubPaymentListNotifierProvider.notifier)
                      .loadPayments();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (payments, hasMore, currentPage) {
          if (payments.isEmpty) {
            return EmptyPaymentsView(
              hasFilters: statusFilter != null,
              onClearFilters: () {
                ref.read(clubPaymentStatusFilterProvider.notifier).state = null;
                ref
                    .read(clubPaymentListNotifierProvider.notifier)
                    .filterByStatus(null);
              },
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(clubPaymentListNotifierProvider.notifier)
                  .refresh();
            },
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: payments.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == payments.length) {
                  // Indicador de carga de más pagos
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final payment = payments[index];
                return ClubPaymentCard(
                  payment: payment,
                  onTap: () => _showPaymentDetail(context, payment),
                  onApprove: payment.canBeVerified
                      ? () => _handleApprove(payment)
                      : null,
                  onReject: payment.canBeVerified
                      ? () => _handleReject(context, payment)
                      : null,
                  onViewProof: payment.hasProof
                      ? () => _viewProof(context, payment)
                      : null,
                );
              },
            ),
          );
        },
      ),
    );
  }

  /// Muestra el detalle de un pago
  void _showPaymentDetail(BuildContext context, Payment payment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: AppSpacing.paddingMD,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Indicador de arrastre
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Título
                Text(
                  'Detalle del Pago',
                  style: AppTextStyles.h5,
                ),
                AppSpacing.verticalSpaceMD,

                // Información del pago
                _buildDetailRow('Jugador', payment.playerName),
                _buildDetailRow('Tipo', payment.type.displayName),
                _buildDetailRow('Estado', payment.status.displayName),
                _buildDetailRow('Descripción', payment.description),
                _buildDetailRow(
                  'Monto',
                  '\$${payment.amount.toStringAsFixed(2)}',
                ),
                _buildDetailRow(
                  'Fecha de vencimiento',
                  '${payment.dueDate.day}/${payment.dueDate.month}/${payment.dueDate.year}',
                ),
                if (payment.verifierName != null)
                  _buildDetailRow('Verificado por', payment.verifierName!),
                if (payment.rejectionNotes != null)
                  _buildDetailRow('Notas de rechazo', payment.rejectionNotes!),

                AppSpacing.verticalSpaceLG,

                // Botones de acción
                if (payment.canBeVerified)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _handleApprove(payment);
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Aprobar Pago'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                          ),
                        ),
                      ),
                      AppSpacing.verticalSpaceSM,
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _handleReject(context, payment);
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('Rechazar Pago'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: const BorderSide(color: AppColors.error),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Maneja la aprobación del pago
  Future<void> _handleApprove(Payment payment) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Aprobar Pago'),
        content: Text(
          '¿Estás seguro de aprobar el pago de ${payment.playerName} por \$${payment.amount.toStringAsFixed(2)}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
            ),
            child: const Text('Aprobar'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      ref.read(verifyPaymentNotifierProvider.notifier).approvePayment(payment.id);
    }
  }

  /// Maneja el rechazo del pago
  Future<void> _handleReject(BuildContext context, Payment payment) async {
    final TextEditingController notesController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rechazar Pago'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Por qué rechazas el pago de ${payment.playerName}?',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.verticalSpaceMD,
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Escribe el motivo del rechazo...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (notesController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Debes escribir el motivo del rechazo'),
                    backgroundColor: AppColors.error,
                  ),
                );
                return;
              }
              Navigator.pop(context, true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Rechazar'),
          ),
        ],
      ),
    );

    if (confirmed == true && notesController.text.trim().isNotEmpty) {
      ref
          .read(verifyPaymentNotifierProvider.notifier)
          .rejectPayment(payment.id, notesController.text.trim());
    }
  }

  /// Ver comprobante de pago
  void _viewProof(BuildContext context, Payment payment) {
    // TODO: Implementar visualización de comprobante (imagen o PDF)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ver comprobante: ${payment.paymentProofUrl}'),
      ),
    );
  }
}
