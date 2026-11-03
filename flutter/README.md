FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Somalia to view examples:

https://platexample.ir/#/discover/somalia:flutter

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

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  somalia_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:somalia_plate/somalia_plate.dart';

PlateCanvas(
  spec: SomaliaPlates.standard,
  theme: SomaliaThemes.standard,
  validator: const SomaliaPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `SomaliaPlates.standard` — id `so.standard`

## Themes

- `SomaliaThemes.standard`

## Change it

`PlateCanvas` takes `spec:` (an entry of `SomaliaPlates`) and `theme:` (an entry of `SomaliaThemes`). Set `validator:` to `SomaliaPlateValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `SomaliaCountry` — the country panel.
- `SomaliaPlateValidator` — the plate validator.

## Plates

Somaliland's plates, in two designs.

* 2018 (`private`, `official`): the emblem and
  `SOMALILAND` across the top, a class code at the left and the serial, a
  class letter and four digits (`C1234`), as one field. Private plates
  stack `PR` over a division code picked from the article's table; the
  other four classes print their code once.
* 2005 (`bilingual`): `S.LAND` and a Latin letter and number with the number
  repeated in Arabic numerals below and the name in Arabic.

The emblem is a green and gold oval crest the spec cannot draw; it is a
plain gold disc ringed in green and the crest is left out. No vector of this
crest was found (Commons' `Emblem of Somaliland` is a different, yellow
design).

Not implemented: the 1996 series (`SOMALILAND` in full, superseded). The
article names no Israel-specific value.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/somalia_plate/blob/main/LICENSE).
