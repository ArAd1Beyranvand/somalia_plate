FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Somalia to view examples:

https://platexample.ir/#/discover/somalia:python

# somalia_plate

Somalia's licence plates for the plate_core library — the bilingual SOM / الصومال plate with the coat of arms, its theme and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/somalia_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/somalia:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/somalia_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/somalia:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/somalia_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/somalia:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/somalia_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/somalia:typescript) |

## Quick start

### Install (Python)

Copy `python/plates/countries/somalia/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.somalia.data import SPECS, THEMES

spec = SPECS["so.standard"]
theme = THEMES["SomaliaThemes.standard"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `so.standard`
- `xs.private`
- `xs.official`
- `xs.bilingual`

## Themes

- `SomaliaThemes.standard`
- `SomalilandThemes.private`
- `SomalilandThemes.government`
- `SomalilandThemes.ngo`
- `SomalilandThemes.un`
- `SomalilandThemes.diplomatic`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `SomaliaPlateValidator`, `SomalilandValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/somalia_plate/blob/main/LICENSE).
