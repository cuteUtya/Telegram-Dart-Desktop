import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

RenderParagraph calcLines(
    BuildContext context, BoxConstraints constraints, TextSpan text) {
  final richTextWidget = Text.rich(text).build(context) as RichText;
  final renderObject = richTextWidget.createRenderObject(context);
  renderObject.layout(constraints);
  return renderObject;
}

enum Side { right, left }
