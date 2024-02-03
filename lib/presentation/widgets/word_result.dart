import 'package:flutter/material.dart';

import '../../constants/circle_values.dart';
import '../../constants/colors.dart';

Widget WordResult({
  required List<String> letters,
}) {
  return Container(
    alignment: Alignment.center,
    width: circleSize,
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
      border: letters.isEmpty
          ? null
          : Border.all(
              color: highlightColor,
              width: 2,
            ),
    ),
    child: Wrap(
      alignment: WrapAlignment.center,
      children: letters.map((letter) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: textColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            letter.toUpperCase(),
            style: const TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    ),
  );
}
