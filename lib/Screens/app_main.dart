import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
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
    var chatKey = GlobalKey<ChatDisplayState>();
    return Row(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: LeftPanel(client: widget.client, chatDisplayPointer: chatKey)),
      Expanded(child: ChatDisplay(client: widget.client, key: chatKey))
    ]);
  }
}
