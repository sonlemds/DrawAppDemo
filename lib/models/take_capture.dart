import 'dart:ui';

import 'package:test_svg_detect/strokes_painter.dart';

import 'draw_event.dart';

class TakeCapture extends DrawEvent {
  Image renderedImage;
  TakeCapture(this.renderedImage);
}