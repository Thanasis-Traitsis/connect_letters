import 'package:flutter/material.dart';

import '../constants/circle_values.dart';
import '../constants/colors.dart';

// ignore: must_be_immutable
class BoxDetails extends StatelessWidget {
  final String letter;
  final Alignment position;
  bool isSelected;

  BoxDetails({
    Key? key,
    required this.letter,
    required this.position,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? textColor : highlightColor,
        ),
        alignment: Alignment.center,
        width: boxSize,
        height: boxSize,
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? whiteColor : textColor,
          ),
        ),
      ),
    );
  }
}
