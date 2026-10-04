import 'package:plate_core/plate_core.dart';

import 'somalia_colors.dart';

/// Somalia as a `PlateCountry`. The plate carries no flag: `SOM`, the arms and
/// `الصومال` are labels and a decal on the spec, so it sets `noPanel`.
abstract final class SomaliaCountry {
  static const PlateCountry somalia = PlateCountry(
    code: 'so',
    captionLines: <String>[],
    panelColor: SomaliaColors.white,
    panelTextColor: SomaliaColors.ink,
  );
}
