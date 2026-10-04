import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'somalia_alphabets.dart';
import 'somalia_country.dart';

/// Where the ink sits on the Somali plate, in plate coordinates.
///
/// Measured off `Somalia_vehicle_registration_plate.jpg` (715×292; the plate
/// is the 683×263 inside the page margin, aspect 2.60). The article gives no
/// physical size, so the canvas is the artwork's own proportion, 520×200 —
/// both axes then scale by 0.761. The image is the only plate artwork there
/// is, and it is a photograph; the arms come from Wikimedia Commons'
/// `Coat of arms of Somalia.svg`.
///
/// * `SOM`: black ink x 28.9..179.7, y 16.7..71.5 (centre 104.3, 44.1).
/// * Arms: x 191.8..258.1, y 22.1..67.0 — the plate's own are drawn wider than
///   the SVG's 1.24, so the decal is fitted by height (46) and centred at 225.
/// * `الصومال`: x 284.0..492.6, y 17.5..70.0 (centre 388.3, 43.8).
/// * Serial: ink y 85.2..180.2 (93.5 tall, centre 133.3). `A` 43.4..107.3,
///   `D` 142.4..201.0; digits 225.4..282.5, 297.7..347.2, 365.4..414.9,
///   436.3..482.7 — centres 253.9, 322.5, 390.2, 459.5, pitch 68.5.
///
/// Rendered with DejaVu Bold and Noto Sans Arabic Bold and measured the same
/// way: `SOM` x 30..177, y 21..67; `الصومال` x 283..492, y 19..70; digits
/// within 3 of the reference on x.
///
/// **Under-height serial and `SOM`, accepted.** The plate prints a glyph 93.5
/// tall on a 200 canvas; a slot's ink is ~55% of its box, so the reference
/// would need a 170 box centred at 133.3, which runs off the canvas. The box
/// is 130, the tallest that stays inside once centred, and the ink is y 98..167
/// (69 tall, 74% of the reference, centred 2 low). `SOM` is width-limited by
/// DejaVu's wider letters: 46 tall against 54.8. `plate_core` is unchanged.
///
/// **Not drawn.** The faint embossed rivet marks and the plate's shadow.
abstract final class _Layout {
  static const double width = 520;
  static const double height = 200;

  static const PlateBox som = PlateBox(24, 14, 160, 60);
  static const double somGlyph = 85;

  static const PlateBox arabic = PlateBox(278, 10, 220, 60);
  static const double arabicGlyph = 72;

  static const PlateBox arms = PlateBox(196.5, 21, 57, 46);

  static const double serialTop = 69.8;
  static const double serialHeight = 130;
  static const double letterWidth = 96;
  static const List<double> letterCentres = <double>[75.4, 171.7];
  static const double digitPitch = 68.5;
  static const double digitFirstCentre = 253.9;
  static const int digits = 4;
}

abstract final class SomaliaPlates {
  /// `AD 4657`: two letters and four digits under `SOM`, the arms and
  /// `الصومال`. Pair with `SomaliaThemes.standard`.
  ///
  /// Slots: the two letters, then the four digits.
  static final PlateSpec standard = PlateSpec(
    id: 'so.standard',
    country: SomaliaCountry.somalia,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    labels: const <PlateLabel>[
      PlateLabel(
        text: 'SOM',
        box: _Layout.som,
        glyphHeight: _Layout.somGlyph,
      ),
      PlateLabel(
        text: 'الصومال',
        box: _Layout.arabic,
        glyphHeight: _Layout.arabicGlyph,
      ),
    ],
    decals: const <PlateDecal>[
      PlateDecal(
        image: AssetImage(
          'assets/emblem/Coat_of_arms_of_Somalia.png',
          package: 'somalia_plate',
        ),
        box: _Layout.arms,
      ),
    ],
    slots: <PlateSlot>[
      for (final double c in _Layout.letterCentres)
        PlateSlot(
          alphabet: SomaliaAlphabets.letters,
          box: PlateBox(
            c - _Layout.letterWidth / 2,
            _Layout.serialTop,
            _Layout.letterWidth,
            _Layout.serialHeight,
          ),
        ),
      ...plateRegister(
        alphabet: SomaliaAlphabets.digits,
        count: _Layout.digits,
        left: _Layout.digitFirstCentre - _Layout.digitPitch / 2,
        top: _Layout.serialTop,
        width: _Layout.digitPitch,
        height: _Layout.serialHeight,
        pitch: _Layout.digitPitch,
      ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1], key: 'series'),
      PlateTextGroup(<int>[2, 3, 4, 5], key: 'number'),
    ],
  );

  static final List<PlateSpec> all = <PlateSpec>[standard];
}
