import 'dart:ui';

import 'package:flutter/material.dart';

class CustomSliderThumbCircle extends RangeSliderThumbShape {
  final double thumbRadius;
  final int min;
  final int max;
  final IconData icon;
  const CustomSliderThumbCircle({
    @required this.icon,
    @required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  String getValue(double value) {
    return ((max * value).round()).toString();
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      bool isEnabled,
      bool isOnTop,
      TextDirection textDirection,
      SliderThemeData sliderTheme,
      Thumb thumb}) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.red
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.5)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius * .9, paint);
    _paintIconOnCanvas(canvas, center);
  }

  _paintIconOnCanvas(Canvas canvas, Offset center) {
    // * to use icon within a customThumbShape

    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(fontSize: 20.0, fontFamily: icon.fontFamily));

    textPainter.layout();
    Offset textCenter1 = Offset(center.dx - (textPainter.width / 2),
        center.dy - (textPainter.height / 2));

    textPainter.paint(canvas, textCenter1);
  }
}
