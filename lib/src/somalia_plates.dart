import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'somalia_alphabets.dart';
import 'somalia_country.dart';

/// Plate-unit geometry measured off the one plate photograph (aspect 2.60).
/// The article gives no physical size, so the canvas keeps the artwork's own
/// proportion, 520×200. The arms are drawn wider than the vector's 1.24
/// aspect, so the decal is fitted by height and centred.
///
/// The plate prints a serial glyph 93.5 tall on a 200 canvas; a slot's ink is
/// ~55% of its box, so matching it would need a 170 box centred at 133.3,
/// which runs off the canvas. The box is 130, the tallest that stays inside
/// once centred, so the serial renders at about 74% of the reference. `SOM` is
/// width-limited by the fallback font's wider letters.
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
}

PlateSlot _serialSlot(PlateAlphabet alphabet, double firstCentre, double pitch, int length) {
  return PlateSlot(
    alphabet: alphabet,
    box: PlateBox(firstCentre - pitch / 2, _Layout.serialTop, length * pitch, _Layout.serialHeight),
    length: length,
    spacing: max(0, pitch - 0.6 * 0.72 * _Layout.serialHeight),
  );
}

abstract final class SomaliaPlates {
  /// `AD 4657`: two letters and four digits under `SOM`, the arms and
  /// `الصومال`. Pair with `SomaliaThemes.standard`.
  static final PlateSpec standard = PlateSpec(
    id: 'so.standard',
    country: SomaliaCountry.somalia,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    labels: const <PlateLabel>[
      PlateLabel(text: 'SOM', box: _Layout.som, glyphHeight: _Layout.somGlyph),
      PlateLabel(text: 'الصومال', box: _Layout.arabic, glyphHeight: _Layout.arabicGlyph),
    ],
    decals: const <PlateDecal>[
      PlateDecal(
        image: AssetImage('assets/emblem/Coat_of_arms_of_Somalia.png', package: 'somalia_plate'),
        box: _Layout.arms,
      ),
    ],
    slots: <PlateSlot>[
      _serialSlot(SomaliaAlphabets.letters, 75.4, 96.3, 2),
      _serialSlot(SomaliaAlphabets.digits, 253.9, 68.5, 4),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'series'),
      PlateTextGroup(<int>[1], key: 'number'),
    ],
  );

  static final List<PlateSpec> all = <PlateSpec>[standard];
}
