import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({
    Key? key,
    required this.isReaded,
    this.color,
    this.size,
    this.selected = false,
  }) : super(key: key);

  final bool isReaded;
  final bool selected;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      isReaded ? Icons.done_all : Icons.done,
      color: color ?? ClientTheme.currentTheme.getField(selected ? "CheckMarkChatSelectedListColor" : "CheckMarkChatListColor"),
      size: size,
    );
  }
}
