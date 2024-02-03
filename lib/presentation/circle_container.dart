// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants/circle_values.dart';
import '../constants/colors.dart';
import '../letter/box_details.dart';
import '../letter/letter_box.dart';
import '../line_painter/line_painter.dart';
import '../usecases/find_center_of_box.dart';
import '../usecases/initialize_values_repositories.dart';
import 'widgets/word_result.dart';

class CircleContainer extends StatefulWidget {
  final String word;

  CircleContainer({
    Key? key,
    required this.word,
  }) : super(key: key);

  @override
  State<CircleContainer> createState() => _CircleContainerState();
}

class _CircleContainerState extends State<CircleContainer> {
  String chosenLetters = "";

  final key = GlobalKey();
  Offset? startPosition;
  Offset? endPosition;
  int count = 0;

  Set<LetterBoxProxy> trackTaped = <LetterBoxProxy>{};
  List startingPositions = [];

  List positionList = [];
  List<CustomPaint> lineConnections = [];
  List<Widget> stackLetters = [];

  // Choose letters and create a line
  void tapAndHoverLetter(PointerEvent event) {
    final RenderBox box =
        key.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);

    setState(() {
      endPosition = local;

      if (count != 0 && count < widget.word.length) {
        lineConnections[count - 1] = CustomPaint(
          painter: LinePainter(
            startPosition: startingPositions[count - 1],
            endPosition: endPosition,
          ),
        );
      }
      if (count > 1 && count <= widget.word.length) {
        lineConnections[count - 2] = CustomPaint(
          painter: LinePainter(
            startPosition: startPosition,
            endPosition: startingPositions[count - 2],
          ),
        );
      }
    });

    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        final target = hit.target;

        if (target is LetterBoxProxy && !trackTaped.contains(target)) {
          setState(() {
            startPosition = findCenterOfBox(
              x: positionList[target.index][0],
              y: positionList[target.index][1],
            );

            stackLetters[target.index] = LetterBox(
              index: target.index,
              child: BoxDetails(
                isSelected: true,
                letter: widget.word[target.index],
                position: Alignment(
                  positionList[target.index][0],
                  positionList[target.index][1],
                ),
              ),
            );

            if (count < widget.word.length - 1) {
              lineConnections[count] = CustomPaint(
                painter: LinePainter(
                  startPosition: startPosition,
                  endPosition: endPosition,
                ),
              );
            }

            chosenLetters += widget.word[target.index];

            startingPositions.add(startPosition);

            count++;
            trackTaped.add(target);
          });
        }
      }
    }
  }

  // Initialize position and line values
  void initializeValues() {
    if (count == 0) {
      positionList = boxPositions
          .firstWhere((element) => element.length == widget.word.length);

      lineConnections = generateLinePainter(
        word: widget.word,
        start: startPosition,
        end: endPosition,
      );

      stackLetters = generateLetters(
        word: widget.word,
        positions: positionList,
      );
    }
  }

  // Clear chosen letters
  void clearLetters() {
    setState(() {
      count = 0;
      startPosition = null;
      endPosition = null;
      stackLetters = [];
      lineConnections = [];
      trackTaped = <LetterBoxProxy>{};
      startingPositions = [];
      chosenLetters = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = chosenLetters.split("");

    initializeValues();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WordResult(
                letters: letters,
              ),
              Listener(
                onPointerMove: (event) {
                  tapAndHoverLetter(event);
                },
                onPointerDown: (event) {
                  tapAndHoverLetter(event);
                },
                onPointerUp: (event) {
                  clearLetters();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  width: circleSize,
                  height: circleSize,
                  child: Stack(
                    children: [
                      ...lineConnections,
                      Stack(
                        key: key,
                        children: stackLetters,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
