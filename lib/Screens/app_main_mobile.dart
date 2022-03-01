import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class AppMainMobile extends StatefulWidget {
  const AppMainMobile({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _AppMainMobileState();
}

class _AppMainMobileState extends State<AppMainMobile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: const <int>[],
      stream: UIEvents.selectedChat(),
      builder: (_, data) => PageView(
        children: [
          LeftPanel(
            client: widget.client,
          ),
          for (final e in data.data as List<int>)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ChatDisplay(
                client: widget.client,
                chatId: e,
              ),
            ),
        ].reversed.toList(),
      ),
    );
  }
}
