/// Somali licence plates for `plate_core`: only the bilingual plate is
/// documented, so the colonial and Puntland series are not implemented.
library;

// TODO(py): [D5] one module `plates.countries.somalia`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/somalia`; tree-shakable.
// TODO(kt): [D5] package `countries.somalia` in the countries module.
export 'src/somalia_alphabets.dart';
export 'src/somalia_colors.dart';
export 'src/somalia_country.dart';
export 'src/somalia_plates.dart';
export 'src/somalia_themes.dart';
export 'src/somalia_validators.dart';
export 'src/somaliland/somaliland_plate.dart';
