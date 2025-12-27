/// Espaciado y dimensiones de la aplicación.
///
/// Define todos los valores de espaciado, padding, margin, y dimensiones
/// para mantener consistencia en el diseño.
library;

import 'package:flutter/material.dart';

class AppSpacing {
  // Prevenir instanciación
  AppSpacing._();

  // ============================================================================
  // ESPACIADO BASE
  // ============================================================================

  /// Espaciado extra pequeño (4px)
  static const double xs = 4.0;

  /// Espaciado pequeño (8px)
  static const double sm = 8.0;

  /// Espaciado medio (16px) - Base
  static const double md = 16.0;

  /// Espaciado grande (24px)
  static const double lg = 24.0;

  /// Espaciado extra grande (32px)
  static const double xl = 32.0;

  /// Espaciado extra extra grande (48px)
  static const double xxl = 48.0;

  // ============================================================================
  // PADDING
  // ============================================================================

  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  // Padding horizontal
  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets paddingHorizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(horizontal: xl);

  // Padding vertical
  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(vertical: xl);

  // ============================================================================
  // BORDES Y RADIOS
  // ============================================================================

  /// Radio de borde pequeño (4px)
  static const double radiusXS = 4.0;

  /// Radio de borde medio (8px)
  static const double radiusSM = 8.0;

  /// Radio de borde medio (12px)
  static const double radiusMD = 12.0;

  /// Radio de borde grande (16px)
  static const double radiusLG = 16.0;

  /// Radio de borde extra grande (24px)
  static const double radiusXL = 24.0;

  /// Radio circular completo
  static const double radiusFull = 9999.0;

  // BorderRadius predefinidos
  static const BorderRadius borderRadiusXS = BorderRadius.all(Radius.circular(radiusXS));
  static const BorderRadius borderRadiusSM = BorderRadius.all(Radius.circular(radiusSM));
  static const BorderRadius borderRadiusMD = BorderRadius.all(Radius.circular(radiusMD));
  static const BorderRadius borderRadiusLG = BorderRadius.all(Radius.circular(radiusLG));
  static const BorderRadius borderRadiusXL = BorderRadius.all(Radius.circular(radiusXL));

  // ============================================================================
  // DIMENSIONES DE COMPONENTES
  // ============================================================================

  // Altura de botones
  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  // Altura de inputs
  static const double inputHeight = 48.0;
  static const double inputHeightLarge = 56.0;

  // Tamaño de íconos
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // Avatares
  static const double avatarSizeSmall = 32.0;
  static const double avatarSizeMedium = 48.0;
  static const double avatarSizeLarge = 64.0;
  static const double avatarSizeXLarge = 96.0;

  // AppBar
  static const double appBarHeight = 56.0;
  static const double appBarElevation = 2.0;

  // Bottom Navigation
  static const double bottomNavHeight = 56.0;
  static const double bottomNavElevation = 8.0;

  // Cards
  static const double cardElevation = 2.0;
  static const double cardElevationHover = 4.0;

  // Dividers
  static const double dividerThickness = 1.0;
  static const double dividerIndent = md;

  // ============================================================================
  // TAMAÑOS DE PANTALLA (Breakpoints)
  // ============================================================================

  static const double mobileMaxWidth = 600.0;
  static const double tabletMaxWidth = 900.0;
  static const double desktopMinWidth = 900.0;

  // ============================================================================
  // SOMBRAS
  // ============================================================================

  /// Sombra baja (elevación 2)
  static const List<BoxShadow> shadowLow = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  /// Sombra media (elevación 4)
  static const List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  /// Sombra alta (elevación 8)
  static const List<BoxShadow> shadowHigh = [
    BoxShadow(
      color: Color(0x29000000),
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // ============================================================================
  // DURACIONES DE ANIMACIONES
  // ============================================================================

  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ============================================================================
  // HELPERS
  // ============================================================================

  /// SizedBox vertical con altura personalizada
  static SizedBox verticalSpace(double height) => SizedBox(height: height);

  /// SizedBox horizontal con ancho personalizado
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  /// SizedBox vertical con espaciado xs
  static const SizedBox verticalSpaceXS = SizedBox(height: xs);
  static const SizedBox verticalSpaceSM = SizedBox(height: sm);
  static const SizedBox verticalSpaceMD = SizedBox(height: md);
  static const SizedBox verticalSpaceLG = SizedBox(height: lg);
  static const SizedBox verticalSpaceXL = SizedBox(height: xl);

  /// SizedBox horizontal con espaciado predefinido
  static const SizedBox horizontalSpaceXS = SizedBox(width: xs);
  static const SizedBox horizontalSpaceSM = SizedBox(width: sm);
  static const SizedBox horizontalSpaceMD = SizedBox(width: md);
  static const SizedBox horizontalSpaceLG = SizedBox(width: lg);
  static const SizedBox horizontalSpaceXL = SizedBox(width: xl);

  /// Divider con espaciado
  static const Divider divider = Divider(
    thickness: dividerThickness,
    height: md,
  );

  /// Divider con indent
  static const Divider dividerIndented = Divider(
    thickness: dividerThickness,
    height: md,
    indent: dividerIndent,
    endIndent: dividerIndent,
  );
}
