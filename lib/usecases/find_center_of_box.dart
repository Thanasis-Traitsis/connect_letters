import 'package:flutter/material.dart';

import '../constants/circle_values.dart';

Offset findCenterOfBox({
  required double x,
  required double y,
}) {
  Offset center = Offset(
      calculateCenterFromPosition(x, true, x != 0.89 && x != -0.89),
      calculateCenterFromPosition(y, false, y != 0.89 && y != -0.89));

  return center;
}

double calculateCenterFromPosition(
  double value,
  bool isX,
  bool isCorner,
) {
  double num = (circleSize / 2);
  double extraSpace = isCorner ? (boxSize / 2) - (boxSize / 4) : (boxSize / 2);

  if (value != 0) {
    num = (circleSize / 2) - (-value * (circleSize / 2));

    if (isX) {
      if (value < 0) {
        num += extraSpace + (boxSize / 6);
      } else {
        num -= extraSpace + (boxSize / 6);
      }
    } else {
      if (value < 0) {
        num += extraSpace;
      } else {
        num -= extraSpace;
      }
    }
  }

  return num;
}
