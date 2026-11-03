package plates.countries.somalia

import plates.core.validators.PlateCheck
import plates.core.validators.RuledPlateValidator

/** Judges a `SomaliaPlates` value, two letters and four digits (`AD 4657`). Reports, never bars a keystroke. */
class SomaliaPlateValidator : RuledPlateValidator() {
    override val checks = listOf(
        PlateCheck("series", "[A-Z]{2}", "The series is two letters."),
        PlateCheck("number", "[0-9]{4}", "The number is four digits."),
    )
}
