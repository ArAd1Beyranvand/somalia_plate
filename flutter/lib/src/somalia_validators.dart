import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// Judges a `SomaliaPlates` value, two letters and four digits (`AD 4657`).
/// Reports, never bars a keystroke. The shape is read off the one documented
/// plate; the article gives no allocation rules, so none are checked.
class SomaliaPlateValidator extends GatedPlateValidator {
  const SomaliaPlateValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonSeries = 'The series is two letters.';
  static const String reasonNumber = 'The number is four digits.';

  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
  static final RegExp _series = RegExp(r'^[A-Z]{2}$');
  static final RegExp _number = RegExp(r'^[0-9]{4}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_series.hasMatch(entry.group('series'))) {
      return const PlateValidation.invalid(reasonSeries);
    }
    if (!_number.hasMatch(entry.group('number'))) {
      return const PlateValidation.invalid(reasonNumber);
    }
    return const PlateValidation.valid();
  }
}
