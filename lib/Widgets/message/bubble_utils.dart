import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// build [text] in [context] using [constraints]
/// Result can be used for some calculation
RenderParagraph calcLines(
    BuildContext context, BoxConstraints constraints, TextSpan text) {
  final richTextWidget = Text.rich(text).build(context) as RichText;
  final renderObject = richTextWidget.createRenderObject(context);
  renderObject.layout(constraints);
  return renderObject;
}

/// describes side 🗿
enum Side { right, left }

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/BubbleRelativePosition_example.jpg).
/// Few messages in row from single user have different shape.
/// This enum describe relative position of bubble in row
enum BubbleRelativePosition { top, middle, bottom, single }
