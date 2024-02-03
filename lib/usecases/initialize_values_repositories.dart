import 'package:flutter/material.dart';

import '../letter/box_details.dart';
import '../letter/letter_box.dart';
import '../line_painter/line_painter.dart';

List<CustomPaint> generateLinePainter({
  required String word,
  required Offset? start,
  required Offset? end,
}) {
  return List<CustomPaint>.generate(
    word.length - 1,
    (index) => CustomPaint(
      painter: LinePainter(
        startPosition: start,
        endPosition: end,
      ),
    ),
  );
}

List<Widget> generateLetters({
  required String word,
  required List positions,
}) {
  return List<Widget>.generate(
    word.length,
    (index) => LetterBox(
      index: index,
      child: BoxDetails(
        
        letter: word[index],
        position: Alignment(
          positions[index][0],
          positions[index][1],
        ),
      ),
    ),
  );
}
