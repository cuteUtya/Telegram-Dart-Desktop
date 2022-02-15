import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_region.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/emoji_input_panel.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.client,
    required this.chatId,
  }) : super(key: key);
  final int chatId;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  String inputValue = "";
  TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (inputValue.isNotEmpty) {
      textController.clear();
      widget.client.send(
        SendMessage(
          chatId: widget.chatId,
          inputMessageContent: InputMessageText(
            text: widget.client.execute(ParseMarkdown(
              text: FormattedText(text: inputValue),
            )) as FormattedText,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var iconColor = ClientTheme.currentTheme.getField("GenericUIIconsColor");
    var emojiPanelPlaceholderKey = GlobalKey();
    return Container(
      decoration: BoxDecoration(
        color: ClientTheme.currentTheme.getField("ChatInputFieldBackgroundColor"),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.attach_file,
              color: iconColor,
              size: 36,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration.collapsed(
                      hintText: widget.client.getTranslation("lng_message_ph"),
                      hintStyle: TextDisplay.create(textColor: ClientTheme.currentTheme.getField("InputFieldTextColor"))),
                  style: TextDisplay.create(size: 20, textColor: ClientTheme.currentTheme.getField("InputFieldTextColor")),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) => inputValue = value,
                ),
              ),
            ),
            Container(
              height: 36,
              alignment: Alignment.bottomCenter,
              child: ContextMenuRegion(
                placeHolderKey: emojiPanelPlaceholderKey,
                workOnMainTap: true,
                workOnSecondaryTap: false,
                contextMenu: EmojiInputPanel(
                  client: widget.client,
                ),
                child: Column(children: [
                  Container(
                    key: emojiPanelPlaceholderKey,
                  ),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: iconColor,
                    size: 36,
                  )
                ]),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => sendMessage(),
              child: Icon(
                Icons.send,
                color: iconColor,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
