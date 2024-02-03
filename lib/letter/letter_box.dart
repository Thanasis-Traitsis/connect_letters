import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LetterBox extends SingleChildRenderObjectWidget {
  final int index;

  const LetterBox({required Widget child, required this.index, Key? key})
      : super(child: child, key: key);

  @override
  LetterBoxProxy createRenderObject(BuildContext context) {
    return LetterBoxProxy(index);
  }

  @override
  void updateRenderObject(BuildContext context, LetterBoxProxy renderObject) {
    renderObject.index = index;
  }
}

class LetterBoxProxy extends RenderProxyBox {
  int index;
  LetterBoxProxy(this.index);
}
