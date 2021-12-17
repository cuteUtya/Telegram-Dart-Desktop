import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class ChatItemTitle extends StatelessWidget {
  const ChatItemTitle(
      {Key? key,
      required this.title,
      required this.isScam,
      required this.isVerifed})
      : super(key: key);
  final String title;
  final bool isScam;
  final bool isVerifed;
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        text: TextSpan(
            children:
                TextDisplay.parseEmojiInString(title, TextDisplay.chatTittle) +
                    [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: isScam
                                  ? Icon(Icons.warning,
                                      color: ClientTheme.currentTheme
                                          .getField("ScamIconColor"))
                                  : (isVerifed
                                      ? Icon(Icons.verified,
                                          color: ClientTheme.currentTheme
                                              .getField(
                                                  "VerifedSupergoupIconColor"))
                                      : const SizedBox.shrink())))
                    ]));
  }
}
