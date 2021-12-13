import 'package:flutter/material.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/tdlib/client.dart';

class AppMain extends StatefulWidget {
  const AppMain({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(children: [
      Container(
          alignment: Alignment.topLeft,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: LeftPanel(client: widget.client))),
      const SeparatorLine(isHorizontal: false)
    ]));
  }
}
