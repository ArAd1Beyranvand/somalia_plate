import { PlateCheck, RuledPlateValidator } from 'plate_core/core/validators/plate_validator';

/** Judges a `SomaliaPlates` value, two letters and four digits (`AD 4657`).
 * Reports, never bars a keystroke. The shape is read off the one documented
 * plate; the article gives no allocation rules, so none are checked. */
export class SomaliaPlateValidator extends RuledPlateValidator {
  readonly checks = [
    new PlateCheck('series', '[A-Z]{2}', 'The series is two letters.'),
    new PlateCheck('number', '[0-9]{4}', 'The number is four digits.'),
  ];
}
