import 'dart:math';

import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'somaliland_colors.dart';
import 'somaliland_country.dart';
import 'somaliland_themes.dart';

/// Where the ink sits, in plate units.
///
/// 2018 plates: the chart photo (`Somaliland_vehicle_registration_plates`) is
/// a flat of a stack of five plates. The offline fit forced it to 2.18 and its
/// row table does not match the picture, so the numbers below are read off a
/// 20-unit grid laid over the flat and then rescaled (x − 10) × 1.036,
/// (y − 32) × 1.033 so the visible plate (502 × 180, aspect 2.79, as in the
/// unflattened chart) fills 520 × 186. They are read by eye on that grid, good
/// to about 3 units: caption ink y 17–52, x 124–497; emblem x 21–104, y 15–73;
/// class code x 27–93, ink y 93–124; serial ink y 79–170, x 135–482.
///
/// 2005 plate (`Somaliland_license_plate_NEW_special_red`), 520×238 as the
/// fit: `S.LAND` x 20–135, y 20–48; letter x 168–217, y 20–113; digits x
/// 325–470 y 20–113; Arabic digits x 323–470, y 128–213; Arabic name x 20–137,
/// y 175–205. Read on the same kind of grid.
///
/// Serial ink is ~91 tall on a 186 plate; the box that gives it would leave no
/// room for the caption, so it is capped at 118 (~73%). The 0.72 in
/// `glyphStyle` is the engine's and is left alone.
abstract final class _Layout {
  static const double width = 520;

  static const double height = 186;
  static const double captionCx = 310.5, captionCy = 34.5, captionBox = 62;
  static const double captionWidth = 380;
  static const double emblemCx = 62.5, emblemCy = 44, emblemSize = 58;
  static const double codeX0 = 27, codeX1 = 93, codeWidth = codeX1 - codeX0;
  static const double codeCy = 108.5, codeBox = 56;
  static const double stackedBox = 40, prCy = 90, regionCy = 140;
  static const double serialX0 = 135, serialX1 = 482;
  static const double serialCy = 124.5, serialBox = 118;

  static const double oldHeight = 238;
  static const double oldNameBox = 50, oldCaptionCy = 34;
  static const PlateBox oldCaption = PlateBox(20, 9, 115, 50);
  static const PlateBox oldArabicName = PlateBox(20, 165, 117, 50);
  static const double oldRowCy = 66.5, oldRowBox = 120;
  static const double letterX0 = 168, letterX1 = 217;
  static const double digitsX0 = 325, digitsX1 = 470;
  static const PlateBox oldArabicDigits = PlateBox(323, 110, 147, 120);
}

/// Somaliland's plates, in two designs.
///
/// * 2018 ([private], [government], [ngo], [un], [diplomatic]): the emblem and
///   `SOMALILAND` across the top, a class code at the left and the serial, a
///   class letter and four digits (`C1234`), as one field. Private plates
///   stack `PR` over a division code picked from the article's table; the
///   other four classes print their code once.
/// * 2005 ([bilingual]): `S.LAND` and a Latin letter and number with the number
///   repeated in Arabic numerals below and the name in Arabic.
///
/// The emblem is a green and gold oval crest the spec cannot draw; it is a
/// plain gold disc ringed in green and the crest is left out. No vector of this
/// crest was found (Commons' `Emblem of Somaliland` is a different, yellow
/// design).
///
/// Not implemented: the 1996 series (`SOMALILAND` in full, superseded). The
/// article names no Israel-specific value.
abstract final class SomalilandPlates {
  static final PlateSpec private = _modern('xs.private', code: 'PR', region: true);
  static final PlateSpec government = _modern('xs.government', code: 'GT');
  static final PlateSpec ngo = _modern('xs.ngo', code: 'NG');
  static final PlateSpec un = _modern('xs.un', code: 'UN');
  static final PlateSpec diplomatic = _modern('xs.diplomatic', code: 'CD');

  static final PlateSpec bilingual = PlateSpec(
    id: 'xs.bilingual',
    country: SomalilandCountry.somaliland,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.oldHeight,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    slots: <PlateSlot>[
      PlateSlot(
        alphabet: SomalilandAlphabets.letters,
        box: _row(_Layout.letterX0, _Layout.letterX1),
      ),
      PlateSlot(
        alphabet: SomalilandAlphabets.digits,
        box: _row(_Layout.digitsX0, _Layout.digitsX1),
        length: 3,
        minLength: 1,
      ),
    ],
    mirrors: const <PlateMirror>[
      PlateMirror(
        source: 1,
        box: _Layout.oldArabicDigits,
        glyphHeight: _Layout.oldRowBox,
        alphabet: SomalilandAlphabets.iranshahrDigits,
      ),
    ],
    labels: const <PlateLabel>[
      PlateLabel(text: 'S.LAND', box: _Layout.oldCaption, glyphHeight: _Layout.oldNameBox),
      PlateLabel(text: 'ص.لاند', box: _Layout.oldArabicName, glyphHeight: _Layout.oldNameBox),
    ],
    textGroups: <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'letter'),
      PlateTextGroup(<int>[1], key: 'number'),
    ],
  );

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    government,
    ngo,
    un,
    diplomatic,
    bilingual,
  ];

  static PlateBox _row(double x0, double x1) =>
      PlateBox(x0, _Layout.oldRowCy - _Layout.oldRowBox / 2, x1 - x0, _Layout.oldRowBox);

  static PlateSpec _modern(String id, {required String code, bool region = false}) {
    const double serialWidth = _Layout.serialX1 - _Layout.serialX0;
    return PlateSpec(
      id: id,
      country: SomalilandCountry.somaliland,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      slots: <PlateSlot>[
        PlateSlot(
          alphabet: SomalilandAlphabets.serial,
          box: PlateBox(
            _Layout.serialX0,
            _Layout.serialCy - _Layout.serialBox / 2,
            serialWidth,
            _Layout.serialBox,
          ),
          length: 5,
          spacing: max(0, serialWidth / 5 - 0.6 * 0.72 * _Layout.serialBox),
        ),
        if (region)
          PlateSlot(
            alphabet: SomalilandAlphabets.region,
            box: PlateBox(
              _Layout.codeX0,
              _Layout.regionCy - _Layout.stackedBox / 2,
              _Layout.codeWidth,
              _Layout.stackedBox,
            ),
          ),
      ],
      labels: <PlateLabel>[
        const PlateLabel(
          text: 'SOMALILAND',
          box: PlateBox(
            _Layout.captionCx - _Layout.captionWidth / 2,
            _Layout.captionCy - _Layout.captionBox / 2,
            _Layout.captionWidth,
            _Layout.captionBox,
          ),
          glyphHeight: _Layout.captionBox,
        ),
        PlateLabel(
          text: code,
          box: region
              ? PlateBox(
                  _Layout.codeX0,
                  _Layout.prCy - _Layout.stackedBox / 2,
                  _Layout.codeWidth,
                  _Layout.stackedBox,
                )
              : PlateBox(
                  _Layout.codeX0,
                  _Layout.codeCy - _Layout.codeBox / 2,
                  _Layout.codeWidth,
                  _Layout.codeBox,
                ),
          glyphHeight: region ? _Layout.stackedBox : _Layout.codeBox,
        ),
      ],
      decals: const <PlateDecal>[PlateDecal(drawing: _emblem, box: _emblemBox)],
      textGroups: <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'serial'),
        if (region) PlateTextGroup(<int>[1], key: 'region'),
      ],
    );
  }

  static const PlateBox _emblemBox = PlateBox(
    _Layout.emblemCx - _Layout.emblemSize / 2,
    _Layout.emblemCy - _Layout.emblemSize / 2,
    _Layout.emblemSize,
    _Layout.emblemSize,
  );

  static const PlateDrawing _emblem = PlateDrawing(100, 100, <PlateShape>[
    PlateCircleShape(50, 50, 50, SomalilandColors.emblemGreen),
    PlateCircleShape(50, 50, 40, SomalilandColors.emblemGold),
  ]);

  /// The theme each spec is drawn in by default.
  static PlateTheme themeOf(PlateSpec spec) => switch (spec.id) {
    'xs.private' => SomalilandThemes.private,
    'xs.government' => SomalilandThemes.government,
    'xs.un' => SomalilandThemes.un,
    'xs.diplomatic' => SomalilandThemes.diplomatic,
    _ => SomalilandThemes.ngo,
  };
}
