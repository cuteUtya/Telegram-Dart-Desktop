import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/background_display.dart';
import 'package:flutter/painting.dart' as ui;

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
          return Stack(children: [
            StreamBuilder(
                //TODO correct work with dark and light themes
                initialData: client.getCachedBackground(false),
                stream: client.selectedBackground,
                builder: (_, data) {
                  if (data.hasData) {
                    var update = data.data == null
                        ? null
                        : data.data as UpdateSelectedBackground;
                    if (update?.background == null) {
                      client.send(GetBackgrounds()).then((backs) => client.send(
                          SetBackground(
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
            Container(
                margin: const EdgeInsets.only(bottom: 96, left: 24),
                alignment: Alignment.bottomLeft,
                child: MacMessageBubble(
                  left: false,
                  content: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          children: TextDisplay.parseEmojiInString(
                              "You should see my 'Unsorted' folder 📸",
                              TextDisplay.create(size: 18)))),
                  infoWidget: const MessageInfoBubbleCheckMarkTime(
                      checkMarkValue: false, time: "18:12"),
                )),
            if (chat != null)
              Container(
                  alignment: Alignment.topCenter,
                  child: ActionBarDisplay(
                    client: client,
                    chat: chat,
                  )),
            if (chat != null)
              Container(
                  margin: const EdgeInsets.all(24),
                  alignment: Alignment.bottomCenter,
                  child: InputField(client: client)),
          ]);
        });
  }
}
