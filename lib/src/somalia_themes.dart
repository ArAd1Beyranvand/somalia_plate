import 'package:plate_core/plate_core.dart';

import 'somalia_colors.dart';

/// Ink on white in a black rim. The rim is 6 px of the artwork's 263, 0.023 of
/// the height; the outer corner is drawn at 0.05.
abstract final class SomaliaThemes {
  static final PlateTheme standard = PlateTheme(
    plateBackground: SomaliaColors.white,
    plateBorder: SomaliaColors.frame,
    ink: SomaliaColors.ink,
    dividerColor: SomaliaColors.ink,
    borderWidthRatio: 0.023,
    plateRadiusRatio: 0.05,
    activeColor: SomaliaColors.ink,
    inactiveColor: SomaliaColors.inactive,
  );
}
