import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'somaliland_colors.dart';

/// One ink on one field, the frame in the ink. The photos show a thin light
/// rim and rounded corners; neither width is measured.
abstract final class SomalilandThemes {
  static final PlateTheme private = _ink(SomalilandColors.white, SomalilandColors.whiteInk);
  static final PlateTheme government = _ink(SomalilandColors.green, SomalilandColors.greenInk);
  static final PlateTheme ngo = _ink(SomalilandColors.red, SomalilandColors.redInk);
  static final PlateTheme un = _ink(SomalilandColors.blue, SomalilandColors.blueInk);
  static final PlateTheme diplomatic = _ink(SomalilandColors.yellow, SomalilandColors.yellowInk);
}

PlateTheme _ink(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: SomalilandColors.inactive,
  borderWidthRatio: 0.025,
  plateRadiusRatio: 0.05,
);
