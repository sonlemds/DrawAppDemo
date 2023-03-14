import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import './stroke_painter.dart';
import 'models/stroke.dart';
import 'dart:ui' as ui;

class StrokesPainter extends CustomPainter {
  final BuiltList<Stroke> strokes;
  final StrokeCap strokeCap;
  final ui.Image? image;

  StrokesPainter({
    required this.strokes,
    required this.strokeCap,
    required this.image
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      canvas.drawImage(image!, Offset.zero, Paint());
    }
    for (final stroke in strokes) {
      StrokePainter(stroke: stroke, strokeCap: strokeCap).paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(StrokesPainter oldDelegate) =>
      strokes != oldDelegate.strokes;
}
