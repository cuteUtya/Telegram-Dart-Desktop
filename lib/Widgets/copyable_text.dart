import 'package:flutter/material.dart';

class CopyableText extends StatelessWidget {
  const CopyableText(this.text, {Key? key}) : super(key: key);
  final TextSpan text;

  @override
  Widget build(BuildContext context) {
    //TODO ability to copy with keep TextStyle (bold, italic, undelines etc)
    //TODO refuse select in text if user start select another text
    return SelectableText.rich(
      text,
    );
  }
}
