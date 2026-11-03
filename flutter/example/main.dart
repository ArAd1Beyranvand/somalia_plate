import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:somalia_plate/somalia_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: SomaliaPlates.standard, theme: SomaliaThemes.standard),
);
