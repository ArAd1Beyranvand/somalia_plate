import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:somalia_plate/somalia_plate.dart';

void main() {
  PlateValidation judge(String value) => const SomaliaPlateValidator().validate(
    PlateEntry(
      spec: SomaliaPlates.standard,
      values: <String?>[value.substring(0, 2), value.substring(2)],
    ),
  );

  test('accepts two letters and four digits', () {
    expect(judge('AD4657').isValid, isTrue);
  });

  test('rejects a digit in the series', () {
    expect(judge('A14657').isValid, isFalse);
  });

  test('has a series slot and a number slot', () {
    expect(SomaliaPlates.standard.slots.length, 2);
  });
}
