import 'package:plate_core/plate_core.dart';

/// Judges a `SomaliaPlates` value, two letters and four digits (`AD 4657`).
/// Reports, never bars a keystroke. The shape is read off the one documented
/// plate; the article gives no allocation rules, so none are checked.
class SomaliaPlateValidator extends RuledPlateValidator {
  const SomaliaPlateValidator();

  static const String reasonSeries = 'The series is two letters.';
  static const String reasonNumber = 'The number is four digits.';

  @override
  List<PlateCheck> get checks => const <PlateCheck>[
    PlateCheck('series', r'[A-Z]{2}', reasonSeries),
    PlateCheck('number', r'[0-9]{4}', reasonNumber),
  ];
}
