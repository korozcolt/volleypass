/// Página de detalles del jugador.
///
/// Muestra la información completa de un jugador verificado.
library;

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../../domain/entities/player.dart';
import '../widgets/player_info_section.dart';

class PlayerDetailsPage extends StatelessWidget {
  final Player player;

  const PlayerDetailsPage({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Jugador'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header con foto
            Container(
              padding: AppSpacing.paddingXL,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Foto
                  if (player.photoUrl != null)
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: player.photoUrl!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 150,
                          height: 150,
                          color: AppColors.surface,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              player.initials,
                              style: AppTextStyles.h1.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          player.initials,
                          style: AppTextStyles.h1.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),

                  AppSpacing.verticalSpaceMD,

                  // Nombre
                  Text(
                    player.fullName,
                    style: AppTextStyles.h4,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.verticalSpaceXS,

                  // Número de carnet
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      player.cardNumber,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Secciones de información
            Padding(
              padding: AppSpacing.paddingLG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información Básica
                  PlayerInfoSection(
                    title: 'Información Básica',
                    icon: Icons.info_outline,
                    children: [
                      _buildInfoRow('Club', player.clubName),
                      _buildInfoRow('Posición', player.position),
                      _buildInfoRow('Categoría', player.category),
                      _buildInfoRow('Género', _formatGender(player.gender)),
                      _buildInfoRow('Edad', '${player.age} años'),
                      _buildInfoRow(
                        'Fecha de Nacimiento',
                        _formatDate(player.birthDate),
                      ),
                    ],
                  ),

                  AppSpacing.verticalSpaceXL,

                  // Información de Emergencia
                  PlayerInfoSection(
                    title: 'Información de Emergencia',
                    icon: Icons.emergency,
                    iconColor: AppColors.error,
                    children: [
                      if (player.bloodType != null)
                        _buildInfoRow('Tipo de Sangre', player.bloodType!),
                      if (player.emergencyContact != null)
                        _buildInfoRow(
                          'Contacto de Emergencia',
                          player.emergencyContact!,
                        ),
                      if (player.bloodType == null &&
                          player.emergencyContact == null)
                        Padding(
                          padding: AppSpacing.paddingMD,
                          child: Text(
                            'No hay información de emergencia registrada',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),

                  AppSpacing.verticalSpaceXL,

                  // Estado del Carnet
                  PlayerInfoSection(
                    title: 'Estado del Carnet',
                    icon: Icons.badge,
                    iconColor: player.isActive ? AppColors.success : AppColors.error,
                    children: [
                      Row(
                        children: [
                          Icon(
                            player.isActive ? Icons.check_circle : Icons.cancel,
                            color: player.isActive
                                ? AppColors.success
                                : AppColors.error,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estado: ${player.cardStatus}',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: player.isActive
                                        ? AppColors.success
                                        : AppColors.error,
                                  ),
                                ),
                                AppSpacing.verticalSpaceXS,
                                Text(
                                  player.isActive
                                      ? 'El jugador está habilitado para jugar'
                                      : 'El jugador NO está habilitado para jugar',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.verticalSpaceMD,
                      _buildInfoRow('Número de Licencia', player.licenseNumber),
                    ],
                  ),

                  AppSpacing.verticalSpaceXL,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
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
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Masculino';
      case 'female':
        return 'Femenino';
      case 'mixed':
        return 'Mixto';
      default:
        return gender;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
