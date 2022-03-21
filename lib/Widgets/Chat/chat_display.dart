import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/Widgets/Chat/message_list.dart';
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

  static const bool tw1nkleeModeEnable = true;

  @override
  Widget build(BuildContext context) {
    var chat = client.getChat(chatId);
    return Stack(
        children: [
          if (tw1nkleeModeEnable)
            BackgroundDisplay(
              client: client,
              background: Background(
                type: BackgroundTypeFill(
                  fill: BackgroundFillSolid(
                    color: (ClientTheme.currentTheme.getField("tw1nkleeModeBackgroundColor") as Color).value,
                  ),
                ),
              ),
            )
          else
            StreamBuilder(
              stream: client.selectedBackground,
              builder: (_, data) {
                if (data.hasData) {
                  var update = data.data == null ? null : data.data as UpdateSelectedBackground;
                  if (update?.background == null) {
                    client.send(GetBackgrounds()).then(
                          (backs) => client.send(
                            SetBackground(
                              forDarkTheme: update?.forDarkTheme,
                              background: InputBackgroundRemote(
                                backgroundId: backs is Backgrounds ? backs.backgrounds![0].id! : (backs as Background).id!,
                              ),
                            ),
                          ),
                        );
                    return const SizedBox.shrink();
                  }
                  return BackgroundDisplay(
                    client: client,
                    //TODO correct work with dark and light themes
                    background: (data.data as UpdateSelectedBackground).background!,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          Column(
            children: [
              ActionBarDisplay(
                key: Key("actionBarDisplay?chatId=$chatId"),
                client: client,
                chat: chat,
                onChatRevert: onChatRevert,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: MessageList(
                    key: Key("chat?chatId=$chatId"),
                    chatId: chat.id!,
                    client: client,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8,
                  right: 8,
                  left: 8,
                ),
                child: InputField(
                  key: Key("inputField?chatId=$chatId"),
                  client: client,
                  chatId: chat.id!,
                ),
              )
            ],
          )
        ],
    );
  }
}
