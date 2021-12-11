import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({Key? key, required this.isReaded}) : super(key: key);
  final bool isReaded;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(isReaded ? Icons.done_all : Icons.done,
          color: ClientTheme.currentTheme.getField("CheckMarkChatListColor")),
      const SizedBox(width: 2)
    ]);
  }
}
