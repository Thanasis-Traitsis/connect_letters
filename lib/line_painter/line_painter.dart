import 'package:connect_letters/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/circle_values.dart';

class LinePainter extends CustomPainter {
  Offset? startPosition;
  Offset? endPosition;

  LinePainter({required this.startPosition, required this.endPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = textColor
      ..strokeWidth = boxSize / 6;

    if (startPosition != null && endPosition != null) {
      canvas.drawLine(
        startPosition!,
        endPosition!,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.startPosition != startPosition ||
        oldDelegate.endPosition != endPosition;
  }
}
