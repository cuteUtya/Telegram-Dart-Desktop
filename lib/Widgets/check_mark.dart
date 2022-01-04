import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({Key? key, required this.isReaded, this.color, this.size})
      : super(key: key);
  final bool isReaded;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      isReaded ? Icons.done_all : Icons.done,
      color:
          color ?? ClientTheme.currentTheme.getField("CheckMarkChatListColor"),
      size: size,
    );
  }
}
