"""Port of somalia_plate/lib/src/somalia_validators.dart."""

from plates.core.validators.plate_validator import PlateCheck, RuledPlateValidator


class SomaliaPlateValidator(RuledPlateValidator):
    checks = (
        PlateCheck("series", r"[A-Z]{2}", "The series is two letters."),
        PlateCheck("number", r"[0-9]{4}", "The number is four digits."),
    )
