"""Port of somalia_plate/lib/src/somalia_validators.dart."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation


class SomaliaPlateValidator(GatedPlateValidator):
    gate_group = "number"
    reason_series = "The series is two letters."
    reason_number = "The number is four digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not re.fullmatch(r"[A-Z]{2}", entry.group("series")):
            return PlateValidation.invalid(self.reason_series)
        if not re.fullmatch(r"[0-9]{4}", entry.group("number")):
            return PlateValidation.invalid(self.reason_number)
        return PlateValidation.valid()
