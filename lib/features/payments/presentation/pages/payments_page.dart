/// Página de gestión de pagos.
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/payment.dart';
import '../providers/payment_providers.dart';
import '../state/payment_state.dart';
import '../widgets/payment_card.dart';
import '../widgets/payment_filter_chips.dart';
import '../widgets/empty_payments_view.dart';

class PaymentsPage extends ConsumerStatefulWidget {
  const PaymentsPage({super.key});

  @override
  ConsumerState<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends ConsumerState<PaymentsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Cargar pagos al iniciar
    Future.microtask(() {
      ref.read(paymentListNotifierProvider.notifier).loadPayments();
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
      final state = ref.read(paymentListNotifierProvider);
      state.maybeWhen(
        loaded: (_, hasMore, __) {
          if (hasMore) {
            ref.read(paymentListNotifierProvider.notifier).loadMore();
          }
        },
        orElse: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentListNotifierProvider);
    final filters = ref.watch(paymentFiltersProvider);
    final uploadState = ref.watch(uploadProofNotifierProvider);

    // Escuchar cambios en el estado de subida de comprobante
    ref.listen<UploadProofState>(uploadProofNotifierProvider, (previous, next) {
      next.when(
        initial: () {},
        uploading: (_) {},
        success: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: AppColors.success,
            ),
          );
          // Recargar lista de pagos
          ref.read(paymentListNotifierProvider.notifier).refresh();
          ref.read(uploadProofNotifierProvider.notifier).reset();
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: AppColors.error),
          );
          ref.read(uploadProofNotifierProvider.notifier).reset();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Pagos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(paymentListNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtros
          PaymentFilterChips(
            selectedStatus: filters.status,
            selectedType: filters.type,
            showOnlyOverdue: filters.showOnlyOverdue,
            onStatusChanged: (status) {
              final newFilters = filters.copyWith(status: status);
              ref.read(paymentFiltersProvider.notifier).state = newFilters;
              ref
                  .read(paymentListNotifierProvider.notifier)
                  .applyFilters(newFilters);
            },
            onTypeChanged: (type) {
              final newFilters = filters.copyWith(type: type);
              ref.read(paymentFiltersProvider.notifier).state = newFilters;
              ref
                  .read(paymentListNotifierProvider.notifier)
                  .applyFilters(newFilters);
            },
            onOverdueChanged: (showOverdue) {
              final newFilters = filters.copyWith(showOnlyOverdue: showOverdue);
              ref.read(paymentFiltersProvider.notifier).state = newFilters;
              ref
                  .read(paymentListNotifierProvider.notifier)
                  .applyFilters(newFilters);
            },
            onClearAll: () {
              ref.read(paymentFiltersProvider.notifier).state =
                  const PaymentFilters();
              ref.read(paymentListNotifierProvider.notifier).clearFilters();
            },
          ),

          const Divider(height: 1),

          // Lista de pagos
          Expanded(
            child: paymentState.when(
              initial: () => const Center(child: Text('Inicializando...')),
              loading: () => const Center(child: CircularProgressIndicator()),
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
                    const Text(
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
                            .read(paymentListNotifierProvider.notifier)
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
                    hasFilters: filters.hasActiveFilters,
                    onClearFilters: () {
                      ref.read(paymentFiltersProvider.notifier).state =
                          const PaymentFilters();
                      ref
                          .read(paymentListNotifierProvider.notifier)
                          .clearFilters();
                    },
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(paymentListNotifierProvider.notifier)
                        .refresh();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                    itemCount: payments.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == payments.length) {
                        // Indicador de carga de más pagos
                        return const Padding(
                          padding: EdgeInsets.all(AppSpacing.md),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final payment = payments[index];
                      return PaymentCard(
                        payment: payment,
                        onTap: () => _showPaymentDetail(context, payment),
                        onUploadProof: payment.canUploadProof
                            ? () => _handleUploadProof(payment)
                            : null,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Muestra el detalle de un pago
  void _showPaymentDetail(BuildContext context, Payment payment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
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
                const Text('Detalle del Pago', style: AppTextStyles.h5),
                AppSpacing.verticalSpaceMD,

                // Información del pago
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
                _buildDetailRow('Club', payment.clubName),
                if (payment.leagueName != null)
                  _buildDetailRow('Liga', payment.leagueName!),
                if (payment.verifierName != null)
                  _buildDetailRow('Verificado por', payment.verifierName!),
                if (payment.rejectionNotes != null)
                  _buildDetailRow('Notas de rechazo', payment.rejectionNotes!),

                AppSpacing.verticalSpaceLG,

                // Botones de acción
                if (payment.canUploadProof)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _handleUploadProof(payment);
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Subir Comprobante'),
                    ),
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

  /// Maneja la subida de comprobante
  Future<void> _handleUploadProof(Payment payment) async {
    try {
      // Seleccionar archivo
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = File(result.files.single.path!);

        // Confirmar subida
        if (!mounted) return;
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar Subida'),
            content: Text(
              '¿Deseas subir el comprobante para el pago de ${payment.type.displayName}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Subir'),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          ref
              .read(uploadProofNotifierProvider.notifier)
              .uploadProof(payment.id, file);
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar archivo: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
