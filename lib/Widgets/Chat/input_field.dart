import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    var iconColor = ClientTheme.currentTheme.getField("GenericUIIconsColor");
    return Container(
      decoration: BoxDecoration(
        color:
            ClientTheme.currentTheme.getField("ChatInputFieldBackgroundColor"),
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
            Icon(Icons.attach_file, color: iconColor, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: widget.client.getTranslation("lng_message_ph"),
                      hintStyle: TextDisplay.create(
                          textColor: ClientTheme.currentTheme
                              .getField("InputFieldTextColor"))),
                  style: TextDisplay.create(
                      size: 20,
                      textColor: ClientTheme.currentTheme
                          .getField("InputFieldTextColor")),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) => print("changed input value : $value"),
                ),
              ),
            ),
            Container(
              height: 36,
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.emoji_emotions_outlined,
                color: iconColor,
                size: 36,
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.send,
              color: iconColor,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}
