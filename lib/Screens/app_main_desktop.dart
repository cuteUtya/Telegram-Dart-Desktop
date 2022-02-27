import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/tdlib/client.dart';

class AppMainDesktop extends StatelessWidget {
  const AppMainDesktop({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * (UIManager.isMobile ? 0.4 : 0.25),
        child: LeftPanel(
          client: client,
        ),
      ),
      Expanded(
        child: ChatDisplay(
          client: client,
        ),
      ),
    ]);
  }
}