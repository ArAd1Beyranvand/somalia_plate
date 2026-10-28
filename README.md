FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Somalia to view examples:

https://platexample.ir/#/discover/somalia

# somalia_plate

Somali licence plates for `plate_core`: only the bilingual plate is documented, so the colonial and Puntland series are not implemented.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  somalia_plate: ^0.1.0
```

## Use

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

## Contains

- `SomaliaCountry` — country panel: `somalia`.
- `SomalilandCountry` — country panel: `somaliland`.
- `SomaliaPlates` — 1 plate spec: `standard`.
- `SomalilandPlates` — 3 plate specs: `private`, `official`, `bilingual`.
- `SomaliaThemes` — 1 theme: `standard`.
- `SomalilandThemes` — 5 themes: `private`, `government`, `ngo`, `un`, `diplomatic`.
- `SomaliaPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `SomalilandValidator` — advisory validator; flags the frame, never blocks a keystroke.
- 1 bundled asset (`Coat_of_arms_of_Somalia.png`).

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

