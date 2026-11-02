import 'package:plate_core/plate_core.dart';

import 'somaliland_colors.dart';

/// Somaliland as a `PlateCountry`. The plates carry no country block; the
/// name is a label on the face, so every spec sets `noPanel`.
abstract final class SomalilandCountry {
  static const PlateCountry somaliland = PlateCountry(
    code: 'xs',
    captionLines: <String>[],
    panelColor: SomalilandColors.white,
    panelTextColor: SomalilandColors.whiteInk,
  );
}
