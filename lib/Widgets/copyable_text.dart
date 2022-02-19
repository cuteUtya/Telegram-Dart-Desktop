import 'package:flutter/material.dart';

class CopyableText extends StatelessWidget {
  const CopyableText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  final TextSpan text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    //TODO ability to copy with keep TextStyle (bold, italic, undelines etc)
    //TODO refuse select in text if user start select another text
    return SelectableText.rich(
      text,
      style: style,
    );
  }
}
