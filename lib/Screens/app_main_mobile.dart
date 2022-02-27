import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/tdlib/client.dart';

class AppMainMobile extends StatelessWidget {
  const AppMainMobile({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UIEvents.selectedChat(),
      builder: (_, data) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: data.data != null
            ? ChatDisplay(client: client)
            : LeftPanel(
                client: client,
              ),
      ),
    );
  }
}
