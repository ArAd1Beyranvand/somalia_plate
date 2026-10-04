import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
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
      final controller = PlateController.fromValues(
        spec,
        values.split('').toList(),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: SomaliaCountry.somalia,
                ),
              ),
            ),
          ),
        ),
      );
      // The arms decode off the real event loop, which fake time does not
      // advance; runAsync gives them a real slice of time.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 50)),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/$name.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
