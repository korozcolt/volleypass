/// Página de resultado de verificación.
///
/// Muestra el resultado de la verificación de un jugador (Apto/No Apto)
/// junto con su información básica.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/verification.dart';
import '../providers/verification_providers.dart';
import 'player_details_page.dart';
import 'qr_scanner_page.dart';

class VerificationResultPage extends ConsumerStatefulWidget {
  final Verification verification;
  final Player player;

  const VerificationResultPage({
    super.key,
    required this.verification,
    required this.player,
  });

  @override
  ConsumerState<VerificationResultPage> createState() =>
      _VerificationResultPageState();
}

class _VerificationResultPageState
    extends ConsumerState<VerificationResultPage> {
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    // Auto-dismiss después de 10 segundos
    _autoDismissTimer = Timer(const Duration(seconds: 10), () {
      if (mounted) {
        _goBackToScanner();
      }
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    super.dispose();
  }

  void _goBackToScanner() {
    // Resetear el scanner state
    ref.read(scannerStateProvider.notifier).resetScanner();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const QRScannerPage(),
      ),
    );
  }

  void _viewDetails() {
    _autoDismissTimer?.cancel();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PlayerDetailsPage(player: widget.player),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEligible = widget.verification.result == VerificationResult.eligible;
    final bgColor = isEligible ? AppColors.success : AppColors.error;
    final icon = isEligible ? Icons.check_circle : Icons.cancel;

    return Scaffold(
      backgroundColor: bgColor.withOpacity(0.1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _goBackToScanner,
        ),
        title: const Text('Resultado de Verificación'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.paddingLG,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icono de resultado
              Icon(
                icon,
                size: 120,
                color: bgColor,
              ),
              AppSpacing.verticalSpaceMD,

              // Mensaje de estado
              Text(
                widget.verification.statusMessage,
                style: AppTextStyles.h3.copyWith(
                  color: bgColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // Badge de offline si aplica
              if (widget.verification.isOffline) ...[
                AppSpacing.verticalSpaceSM,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cloud_off,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Verificado Offline - Pendiente Sync',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              AppSpacing.verticalSpaceXL,

              // Tarjeta con información del jugador
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: AppSpacing.borderRadiusMD,
                ),
                child: Padding(
                  padding: AppSpacing.paddingLG,
                  child: Column(
                    children: [
                      // Foto del jugador
                      if (widget.player.photoUrl != null)
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: widget.player.photoUrl!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 100,
                              height: 100,
                              color: AppColors.surface,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  widget.player.initials,
                                  style: AppTextStyles.h3.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              widget.player.initials,
                              style: AppTextStyles.h3.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                      AppSpacing.verticalSpaceMD,

                      // Nombre completo
                      Text(
                        widget.player.fullName,
                        style: AppTextStyles.h5,
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.verticalSpaceXS,

                      // Número de carnet
                      Text(
                        widget.player.cardNumber,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      AppSpacing.verticalSpaceMD,
                      const Divider(),
                      AppSpacing.verticalSpaceMD,

                      // Información básica
                      if (!widget.verification.isOffline) ...[
                        _buildInfoRow('Club', widget.player.clubName),
                        AppSpacing.verticalSpaceSM,
                        _buildInfoRow('Posición', widget.player.position),
                        AppSpacing.verticalSpaceSM,
                        _buildInfoRow('Categoría', widget.player.category),

                        if (widget.player.bloodType != null) ...[
                          AppSpacing.verticalSpaceSM,
                          _buildInfoRow('Tipo de Sangre', widget.player.bloodType!),
                        ],

                        if (widget.player.emergencyContact != null) ...[
                          AppSpacing.verticalSpaceSM,
                          _buildInfoRow('Contacto', widget.player.emergencyContact!),
                        ],
                      ],

                      // Razón de restricción si aplica
                      if (widget.verification.hasRestriction) ...[
                        AppSpacing.verticalSpaceMD,
                        const Divider(),
                        AppSpacing.verticalSpaceMD,
                        Container(
                          padding: AppSpacing.paddingMD,
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            borderRadius: AppSpacing.borderRadiusSM,
                            border: Border.all(color: AppColors.error),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.warning_amber,
                                    color: AppColors.error,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'RAZÓN:',
                                    style: AppTextStyles.labelMedium.copyWith(
                                      color: AppColors.error,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.verticalSpaceSM,
                              Text(
                                widget.verification.restrictionReason!,
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              AppSpacing.verticalSpaceXL,

              // Botones de acción
              Column(
                children: [
                  if (!widget.verification.isOffline)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _viewDetails,
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Ver Detalles'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  AppSpacing.verticalSpaceMD,
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _goBackToScanner,
                      icon: const Icon(Icons.qr_code_scanner),
                      label: const Text('Escanear Otro'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),

              AppSpacing.verticalSpaceMD,

              // Contador de auto-dismiss
              Text(
                'Esta pantalla se cerrará automáticamente en 10 segundos',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium,
          ),
        ),
      ],
    );
  }
}
