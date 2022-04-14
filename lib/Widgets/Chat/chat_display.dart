import 'package:flutter/material.dart';
import 'package:myapp/Screens/app_main.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/Widgets/Chat/message_list.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/background_display.dart';

class ChatDisplay extends StatelessWidget {
  const ChatDisplay({
    Key? key,
    required this.client,
    required this.chatId,
    this.onChatRevert,
  }) : super(key: key);
  final TelegramClient client;
  final int chatId;
  final VoidCallback? onChatRevert;

  ///TODO get value from settings
  static const bool useBlurBar = false;

  @override
  Widget build(BuildContext context) {
    var chat = client.getChat(chatId);
    return Column(
      children: [
        Flexible(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: p(8)),
                child: MessageList(
                  key: Key("chat?chatId=$chatId"),
                  chatId: chat.id!,
                  client: client,
                ),
              ),
              ActionBarDisplay(
                key: Key("actionBarDisplay?chatId=$chatId"),
                client: client,
                chat: chat,
                onChatRevert: onChatRevert,
                useBlurStyle: useBlurBar,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(p(6)).copyWith(top: 0),
          child: InputField(
            key: Key("inputField?chatId=$chatId"),
            client: client,
            chatId: chat.id!,
          ),
        )
      ],
    );
  }
}
