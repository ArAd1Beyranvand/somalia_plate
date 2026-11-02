"""Port of somalia_plate/lib/src/somaliland/src/somaliland_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re
from dataclasses import dataclass

from plates.core.validators.plate_validator import PlateEntry, PlateValidation, restriction_verdict

_SERIAL = re.compile(r'[A-E][0-9]{4}')
_OLD = re.compile(r'[A-Z][0-9]{1,3}')
_REGION_CODES = ('AW', 'MJ', 'SL', 'SN', 'SX', 'TG')


@dataclass(frozen=True)
class SomalilandValidator:
    def validate(self, entry: PlateEntry) -> PlateValidation:
        refused = restriction_verdict(entry)
        if refused is not None:
            return refused
        groups = entry.spec.text_groups
        if not groups or not entry.group(groups[-1].key):
            return PlateValidation.valid()
        keys = {g.key for g in groups}
        if 'letter' in keys:
            if not _OLD.fullmatch(entry.group('letter') + entry.group('number')):
                return PlateValidation.invalid('A letter and one to three digits.')
            return PlateValidation.valid()
        if not _SERIAL.fullmatch(entry.group('serial')):
            return PlateValidation.invalid('A class letter A–E and four digits.')
        if 'region' in keys and entry.group('region') not in _REGION_CODES:
            return PlateValidation.invalid('Unknown division code.')
        return PlateValidation.valid()
