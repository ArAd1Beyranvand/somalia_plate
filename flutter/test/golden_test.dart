import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';
import 'package:somalia_plate/somalia_plate.dart';

/// One golden per design, rendered with real faces so the ink can be measured
/// against the article's photograph.
void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final loader = FontLoader('Roboto');
    for (final path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
      '/usr/share/fonts/truetype/noto/NotoSansArabic-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  final cases = <(String, PlateSpec, PlateTheme, String)>[
    ('standard', SomaliaPlates.standard, SomaliaThemes.standard, 'AD4657'),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), SomaliaPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(spec, <String?>[
        values.substring(0, 2),
        values.substring(2),
      ]);
      await pumpPlateGolden(
        tester,
        controller,
        'goldens/$name.png',
        theme: theme,
        scoped: false,
        country: SomaliaCountry.somalia,
        stage: Size(520, 520 * spec.canvasHeight / spec.canvasWidth),
        decodeDelay: const Duration(milliseconds: 50),
      );
    });
  }

  test('the series and the number are one slot each', () {
    expect(SomaliaPlates.standard.slots.map((PlateSlot s) => s.length), <int>[
      2,
      4,
    ]);
  });
}
