import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/background_display.dart';

class ChatDisplay extends StatefulWidget {
  const ChatDisplay({Key? key, required this.client, this.chat})
      : super(key: key);
  final TelegramClient client;
  final Chat? chat;
  @override
  State<StatefulWidget> createState() => ChatDisplayState();
}

class ChatDisplayState extends State<ChatDisplay> {
  late Chat? chat = widget.chat;

  void changeChat(Chat newchat) => setState(() => chat = newchat);

  @override
  Widget build(BuildContext context) {
    if (chat == null) return const SizedBox.shrink();
    return Column(
      children: [
        ActionBarDisplay(
          client: widget.client,
          chat: chat!,
        ),
        Expanded(
            child: Stack(children: [
          BakgroundDisplay(
              client: widget.client,
              background: Background(
                  type: BackgroundTypeFill(
                      fill: BackgroundFillFreeformGradient(
                          colors: [0xFF8CB58C, 0xFFC9D38B, 0xFF8CB58C])))),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.all(24),
                  alignment: Alignment.bottomCenter,
                  child: InputField(client: widget.client)))
        ]))
      ],
    );
  }
}
