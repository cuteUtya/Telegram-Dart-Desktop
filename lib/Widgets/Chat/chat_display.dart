import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/background_display.dart';

class ChatDisplay extends StatelessWidget {
  const ChatDisplay({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UIEvents.selectedChat(),
        builder: (_, data) {
          var chat =
              data.data != null ? client.getChat(data.data as int) : null;
          return Column(
            children: [
              if (chat != null)
                ActionBarDisplay(
                  client: client,
                  chat: chat,
                ),
              Expanded(
                  child: Stack(children: [
                StreamBuilder(
                    stream: client.selectedBackground,
                    builder: (_, data) => BakgroundDisplay(
                        client: client,
                        background:
                            //TODO correct work with dark and light themes
                            data.data == null
                                ? null
                                : (data.data as UpdateSelectedBackground)
                                    .background)),
                if (chat != null)
                  Container(
                      margin: const EdgeInsets.all(24),
                      alignment: Alignment.bottomCenter,
                      child: InputField(client: client))
              ]))
            ],
          );
        });
  }
}
