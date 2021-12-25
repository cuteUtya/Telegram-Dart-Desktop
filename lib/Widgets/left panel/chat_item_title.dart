import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class ChatItemTitle extends StatelessWidget {
  const ChatItemTitle(
      {Key? key,
      required this.isBot,
      required this.isChannel,
      required this.isChat,
      required this.title,
      required this.isScam,
      required this.isVerifed,
      required this.isSupport})
      : super(key: key);
  final bool isChat;
  final bool isBot;
  final bool isChannel;
  final String title;
  final bool isScam;
  final bool isVerifed;
  final bool isSupport;
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> beforeTitle = [const WidgetSpan(child: SizedBox.shrink())];
    if (isBot || isChannel || isChat) {
      beforeTitle.addAll([
        WidgetSpan(
            child: Icon(
          isBot ? Icons.smart_toy : (isChannel ? Icons.campaign : Icons.group),
          size: 22,
          color: ClientTheme.currentTheme.getField("TitleIconColor"),
        )),
        const WidgetSpan(child: SizedBox(width: 4))
      ]);
    }
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        text: TextSpan(
            children: beforeTitle +
                TextDisplay.parseEmojiInString(title, TextDisplay.chatTittle) +
                [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: isSupport
                              ? Icon(Icons.privacy_tip,
                                  color: ClientTheme.currentTheme
                                      .getField("VerifedSupergoupIconColor"))
                              : isScam
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
