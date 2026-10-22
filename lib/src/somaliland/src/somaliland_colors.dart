import 'package:flutter/widgets.dart';

/// Colours of the 2018 plates (`Somaliland_vehicle_registration_plates`, the
/// chart of all five classes) and the 2005 red plate.
///
/// Sampled: the modal colour of each plate's interior in the chart photo
/// (`orig_*`), and its ink as the modal colour far from the field. The chart is
/// a photograph of a printed sheet, so the whites are grey and the yellow is
/// dim; [white] and [yellow] with their inks are therefore NOT sampled and are
/// marked CALIBRATE.
abstract final class SomalilandColors {
  /// Government: chart `GT` plate, `229E7E`.
  static const Color green = Color(0xFF229E7E);
  static const Color greenInk = Color(0xFFC2D2D2);

  /// NGO / humanitarian aid: `NG` plate, `C63232`; the brief's balanced fit
  /// of the same plate gives `C63030` with ink `DACACA`.
  static const Color red = Color(0xFFC63030);
  static const Color redInk = Color(0xFFDACACA);

  /// UN: `UN` plate, `3A72A6`.
  static const Color blue = Color(0xFF3A72A6);
  static const Color blueInk = Color(0xFFB6B6BA);

  /// Private: ink sampled `3A3E42`; the field is the article's "white".
  static const Color white = Color(0xFFF5F5F5); // CALIBRATE
  static const Color whiteInk = Color(0xFF3A3E42);

  /// Diplomatic (`CD`): yellow with red ink as pictured; raw pixels are too
  /// dim to trust.
  static const Color yellow = Color(0xFFEAB02D); // CALIBRATE
  static const Color yellowInk = Color(0xFFC4201C); // CALIBRATE

  /// Emblem disc, read off the chart's crest.
  static const Color emblemGold = Color(0xFFD9B545); // CALIBRATE
  static const Color emblemGreen = Color(0xFF5E9B3C); // CALIBRATE

  static const Color inactive = Color(0xFFB0B0B0);
}
