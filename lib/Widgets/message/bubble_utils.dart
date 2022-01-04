import 'package:flutter/material.dart';

List<TextBox> calcLines(
    BuildContext context, BoxConstraints constraints, TextSpan text) {
  final richTextWidget = Text.rich(text).build(context) as RichText;
  final renderObject = richTextWidget.createRenderObject(context);
  renderObject.layout(constraints);
  return renderObject.getBoxesForSelection(
      TextSelection(baseOffset: 0, extentOffset: text.toPlainText().length));
}
