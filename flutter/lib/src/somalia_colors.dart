import 'package:flutter/widgets.dart';

/// The colours of the Somali plate, sampled from its one photograph: the
/// field is the modal colour of the face, the ink that of the serial, the
/// frame that of the left rim.
abstract final class SomaliaColors {
  static const Color white = Color(0xFFFFFFFF);

  /// A blue-black, not the pure black of the frame.
  static const Color ink = Color(0xFF161C2C);

  static const Color frame = Color(0xFF000000);

  static const Color inactive = Color(0xFFB0B0B0);
}
