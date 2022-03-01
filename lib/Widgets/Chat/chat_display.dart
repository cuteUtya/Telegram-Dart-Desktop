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
  }) : super(key: key);
  final TelegramClient client;
  final int chatId;

  static const bool tw1nkleeModeEnable = true;

  @override
  Widget build(BuildContext context) {
    var chat = client.getChat(chatId);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Stack(
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
                if (data.hasData) {
                  var update = data.data == null
                      ? null
                      : data.data as UpdateSelectedBackground;
                  if (update?.background == null) {
                    client.send(GetBackgrounds()).then(
                          (backs) => client.send(
                            SetBackground(
                              forDarkTheme: update?.forDarkTheme,
                              background: InputBackgroundRemote(
                                backgroundId: backs is Backgrounds
                                    ? backs.backgrounds![0].id!
                                    : (backs as Background).id!,
                              ),
                            ),
                          ),
                        );
                    return const SizedBox.shrink();
                  }
                  return BackgroundDisplay(
                    client: client,
                    //TODO correct work with dark and light themes
                    background:
                        (data.data as UpdateSelectedBackground).background!,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          Container(
            margin: UIManager.useDesktopLayout
                ? const EdgeInsets.fromLTRB(108, 0, 108, 24)
                : const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: MessageList(
                      chatId: chat.id!,
                      client: client,
                    ),
                  ),
                ),
                InputField(
                  client: client,
                  chatId: chat.id ?? 0,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ActionBarDisplay(
              client: client,
              chat: chat,
            ),
          ),
        ],
      ),
    );
  }
}
