/// Página de escaneo de códigos QR.
///
/// Pantalla que permite escanear códigos QR de carnets de jugadores
/// para verificar su elegibilidad.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../../../core/network/connectivity_provider.dart';
import '../providers/verification_providers.dart';
import '../state/scanner_state.dart';
import '../widgets/qr_scanner_overlay.dart';
import 'verification_result_page.dart';
import '../../../match_sessions/presentation/providers/match_session_providers.dart';

class QRScannerPage extends ConsumerStatefulWidget {
  const QRScannerPage({super.key});

  @override
  ConsumerState<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends ConsumerState<QRScannerPage> {
  MobileScannerController? _controller;
  bool _hasScanned = false;

  @override
  void initState() {
    super.initState();
    _initScanner();

    // Load active session
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeSessionStateProvider.notifier).loadActiveSession(showLoading: false);
    });
  }

  void _initScanner() {
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );

    // Notificar al state que la cámara está lista
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(scannerStateProvider.notifier).initCamera();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;

    final barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final code = barcode.rawValue;
      if (code != null && code.isNotEmpty) {
        _hasScanned = true;

        // Get active session ID if exists
        final activeSessionState = ref.read(activeSessionStateProvider);
        final sessionId = activeSessionState.whenOrNull(
          loaded: (session) => session?.id,
        );

        // Scan with session ID
        ref.read(scannerStateProvider.notifier).onQRScanned(
              code,
              matchSessionId: sessionId,
            );
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scannerState = ref.watch(scannerStateProvider);
    final isOnline = ref.watch(isOnlineProvider);
    final activeSessionState = ref.watch(activeSessionStateProvider);

    // Escuchar cambios de estado para navegar
    ref.listen<ScannerState>(scannerStateProvider, (previous, next) {
      next.maybeWhen(
        success: (verification, player) {
          // Navegar a la página de resultados
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => VerificationResultPage(
                verification: verification,
                player: player,
              ),
            ),
          );
        },
        error: (_) {
          // Permitir escanear de nuevo después de error
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _hasScanned = false;
              });
            }
          });
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Vista de la cámara
          if (_controller != null)
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),

          // Overlay con guías
          QRScannerOverlay(isOnline: isOnline),

          // Active session info
          activeSessionState.whenOrNull(
            loaded: (session) {
              if (session == null) return const SizedBox.shrink();
              return SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.play_circle_filled,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Sesión Activa (${session.totalVerifications} verificaciones)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ) ?? const SizedBox.shrink(),

          // Botón de cerrar
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: AppSpacing.paddingMD,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 32),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),

          // Botón de flash
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: AppSpacing.paddingMD,
                child: IconButton(
                  icon: ValueListenableBuilder(
                    valueListenable: _controller?.torchState ?? ValueNotifier(TorchState.off),
                    builder: (context, state, child) {
                      return Icon(
                        state == TorchState.on ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                        size: 32,
                      );
                    },
                  ),
                  onPressed: () => _controller?.toggleTorch(),
                ),
              ),
            ),
          ),

          // Indicador de procesamiento
          scannerState.maybeWhen(
            processing: () => Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Verificando...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            error: (message) => Container(
              color: Colors.black87,
              child: Center(
                child: Padding(
                  padding: AppSpacing.paddingLG,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 64,
                      ),
                      AppSpacing.verticalSpaceMD,
                      Text(
                        'Error',
                        style: AppTextStyles.h5.copyWith(color: Colors.white),
                      ),
                      AppSpacing.verticalSpaceSM,
                      Text(
                        message,
                        style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
