FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Somalia to view examples:

https://platexample.ir/#/discover/somalia:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/somalia/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/somalia';

const spec = country.specs.get('so.standard');
console.log(country.package);
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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`SomaliaPlateValidator`, `SomalilandValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/somalia_plate/blob/main/LICENSE).
