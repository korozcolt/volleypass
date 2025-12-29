/// Widget para mostrar una fila de la tabla de posiciones.
library;

import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../domain/entities/standing.dart';

class StandingItem extends StatelessWidget {
  final Standing standing;
  final Color positionColor;
  final bool isTopThree;

  const StandingItem({
    super.key,
    required this.standing,
    required this.positionColor,
    this.isTopThree = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isTopThree ? positionColor.withOpacity(0.03) : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navegar a detalles del equipo si es necesario
            _showStandingDetails(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Posición
                SizedBox(
                  width: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isTopThree)
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                positionColor.withOpacity(0.3),
                                positionColor.withOpacity(0.1),
                              ],
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: positionColor.withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                        ),
                      Text(
                        '${standing.position}',
                        style: TextStyle(
                          fontSize: isTopThree ? 16 : 14,
                          fontWeight: isTopThree ? FontWeight.w800 : FontWeight.w600,
                          color: isTopThree ? positionColor : Colors.grey[700],
                        ),
                      ),
                      if (standing.position == 1)
                        const Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            Icons.emoji_events,
                            size: 12,
                            color: Color(0xFFFFD700),
                          ),
                        ),
                    ],
                  ),
                ),

                // Equipo con logo
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      if (standing.teamLogo != null)
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              standing.teamLogo!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildDefaultLogo();
                              },
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8),
                          child: _buildDefaultLogo(),
                        ),
                      Expanded(
                        child: Text(
                          standing.teamName,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isTopThree ? FontWeight.w700 : FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Estadísticas
                _buildStatCell(standing.matchesPlayed.toString(), width: 35),
                _buildStatCell(standing.wins.toString(), width: 35),
                _buildStatCell(standing.losses.toString(), width: 35),
                _buildStatCell(
                  standing.setDifference >= 0
                      ? '+${standing.setDifference}'
                      : '${standing.setDifference}',
                  width: 35,
                  color: standing.setDifference >= 0
                      ? AppColors.success
                      : AppColors.error,
                ),
                _buildStatCell(
                  standing.points.toString(),
                  width: 40,
                  isBold: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultLogo() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.2),
            AppColors.primary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.groups,
        size: 18,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildStatCell(
    String text, {
    double width = 40,
    bool isBold = false,
    Color? color,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          color: color ?? Colors.grey[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _showStandingDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        standing.teamName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: positionColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Posición ${standing.position}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: positionColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Estadísticas detalladas
            _buildDetailSection('Rendimiento General', [
              _buildDetailRow('Partidos Jugados', standing.matchesPlayed),
              _buildDetailRow('Partidos Ganados', standing.wins),
              _buildDetailRow('Partidos Perdidos', standing.losses),
              _buildDetailRow(
                'Porcentaje de Victorias',
                '${standing.winPercentage.toStringAsFixed(1)}%',
              ),
            ]),
            const SizedBox(height: 16),

            _buildDetailSection('Estadísticas de Sets', [
              _buildDetailRow('Sets a Favor', standing.setsFor),
              _buildDetailRow('Sets en Contra', standing.setsAgainst),
              _buildDetailRow(
                'Diferencia de Sets',
                standing.setDifference,
                valueColor: standing.setDifference >= 0
                    ? AppColors.success
                    : AppColors.error,
              ),
            ]),
            const SizedBox(height: 16),

            _buildDetailSection('Estadísticas de Puntos', [
              _buildDetailRow('Puntos a Favor', standing.pointsFor),
              _buildDetailRow('Puntos en Contra', standing.pointsAgainst),
              _buildDetailRow(
                'Diferencia de Puntos',
                standing.pointsFor - standing.pointsAgainst,
                valueColor: (standing.pointsFor - standing.pointsAgainst) >= 0
                    ? AppColors.success
                    : AppColors.error,
              ),
            ]),
            const SizedBox(height: 16),

            // Puntos totales
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PUNTOS TOTALES',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    '${standing.points}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String label,
    dynamic value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
