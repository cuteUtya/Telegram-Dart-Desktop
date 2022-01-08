import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/Widgets/Chat/message_list.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/background_display.dart';

class ChatDisplay extends StatelessWidget {
  const ChatDisplay({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;

  static const bool tw1nkleeModeEnable = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UIEvents.selectedChat(),
        builder: (_, data) {
          var chat =
              data.data != null ? client.getChat(data.data as int) : null;
          return Stack(children: [
            if (tw1nkleeModeEnable)
              BakgroundDisplay(
                background: Background(
                    type: BackgroundTypeFill(
                        fill: BackgroundFillSolid(color: 0xFFB3C98C))),
                client: client,
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
                        client.send(GetBackgrounds()).then((backs) =>
                            client.send(SetBackground(
                                forDarkTheme: update?.forDarkTheme,
                                background: InputBackgroundRemote(
                                    backgroundId: backs is Backgrounds
                                        ? backs.backgrounds![0].id!
                                        : (backs as Background).id!))));
                        return const SizedBox.shrink();
                      }
                      return BakgroundDisplay(
                          client: client,
                          //TODO correct work with dark and light themes
                          background: (data.data as UpdateSelectedBackground)
                              .background!);
                    }
                    return const SizedBox.shrink();
                  }),
            if (chat != null)
              Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child:
                                MessageList(chatId: chat.id!, client: client))),
                    InputField(client: client)
                  ])),
            if (chat != null)
              Container(
                  alignment: Alignment.topCenter,
                  child: ActionBarDisplay(
                    client: client,
                    chat: chat,
                  )),
          ]);
        });
  }
}
