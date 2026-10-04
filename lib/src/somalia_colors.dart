import 'package:flutter/widgets.dart';

/// The colours of the Somali plate, sampled from `Somalia_vehicle_registration_plate.jpg`
/// (the only plate image the article carries): the field is the modal colour of
/// the face, the ink of the serial's glyphs, the frame of the left rim.
abstract final class SomaliaColors {
  static const Color white = Color(0xFFFFFFFF);

  /// The serial and captions, `161C2C`: a blue-black, not the pure black of the
  /// frame.
  static const Color ink = Color(0xFF161C2C);

  /// The rim, `000002`.
  static const Color frame = Color(0xFF000000);

  static const Color inactive = Color(0xFFB0B0B0);
}
