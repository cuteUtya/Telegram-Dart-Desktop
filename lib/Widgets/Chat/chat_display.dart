import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
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

  static const bool tw1nkleeModeEnable = false;

  ///TODO get value from settings
  static const bool useBlurBar = true;

  @override
  Widget build(BuildContext context) {
    var chat = client.getChat(chatId);
    return Stack(
      children: [
        Stack(
          children: [
            if (tw1nkleeModeEnable)
              BackgroundDisplay(
                client: client,
                background: Background(
                  type: BackgroundTypeFill(
                    fill: BackgroundFillSolid(
                      color: (ClientTheme.currentTheme
                              .getField("tw1nkleeModeBackgroundColor") as Color)
                          .value,
                    ),
                  ),
                ),
              )
            else
              StreamBuilder(
                stream: client.selectedBackground,
                builder: (_, data) {
                  bool useDark = ClientTheme
                          .currentTheme.environmentVariables["theme"]!() ==
                      "dark";
                  var background = client.getCachedBackground(useDark);
                  if (background == null) {
                    client.send(GetBackgrounds()).then(
                          (backs) => client.send(
                            SetBackground(
                              forDarkTheme: useDark,
                              background: InputBackgroundRemote(
                                backgroundId: backs is Backgrounds
                                    ? backs.backgrounds![3].id!
                                    : (backs as Background).id!,
                              ),
                            ),
                          ),
                        );
                    return const SizedBox.shrink();
                  }

                  return BackgroundDisplay(
                    key: Key("background?hashCode=${background.hashCode}"),
                    client: client,
                    //TODO correct work with dark and light themes
                    background: background,
                  );
                },
              ),
            Column(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
            ),
          ],
        ),
      ],
    );
  }
}
