import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// Judges a 2018 plate: a class letter and four digits (`C1234`) and, on
/// private plates, a division code. Reports, never bars a keystroke.
class SomalilandValidator extends PlateValidator {
  const SomalilandValidator();

  static final RegExp _serial = RegExp(r'^[A-E][0-9]{4}$');
  static final RegExp _old = RegExp(r'^[A-Z][0-9]{1,3}$');

  @override
  PlateValidation validate(PlateEntry entry) {
    final PlateValidation? refused = restrictionVerdict(entry);
    if (refused != null) return refused;
    final List<PlateTextGroup> groups = entry.spec.textGroups;
    if (groups.isEmpty || entry.group(groups.last.key!).isEmpty) {
      return const PlateValidation.valid();
    }
    final bool old = groups.any((PlateTextGroup g) => g.key == 'letter');
    if (old) {
      final String number = entry.group('letter') + entry.group('number');
      if (!_old.hasMatch(number)) {
        return const PlateValidation.invalid('A letter and one to three digits.');
      }
      return const PlateValidation.valid();
    }
    if (!_serial.hasMatch(entry.group('serial'))) {
      return const PlateValidation.invalid('A class letter A–E and four digits.');
    }
    final bool hasRegion = groups.any((PlateTextGroup g) => g.key == 'region');
    if (hasRegion && !SomalilandAlphabets.regionCodes.contains(entry.group('region'))) {
      return const PlateValidation.invalid('Unknown division code.');
    }
    return const PlateValidation.valid();
  }
}
