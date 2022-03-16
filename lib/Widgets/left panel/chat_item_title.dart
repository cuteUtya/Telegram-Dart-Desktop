import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class ChatItemTitle extends StatelessWidget {
  const ChatItemTitle(
      {Key? key,
      required this.selected,
      required this.title,
      this.isBot = false,
      this.isChannel = false,
      this.textColor,
      this.isChat = false,
      this.isScam = false,
      this.isVerifed = false,
      this.isSupport = false})
      : super(key: key);
  final Color? textColor;
  final bool selected;
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
      beforeTitle.addAll(
        [
          WidgetSpan(
              child: Icon(
            isBot ? Icons.smart_toy : (isChannel ? Icons.campaign : Icons.group),
            size: 22,
            color: ClientTheme.currentTheme.getField(selected ? "SelectedTitleIconColor" : "TitleIconColor"),
          )),
          const WidgetSpan(
            child: SizedBox(
              width: 4,
            ),
          ),
        ],
      );
    }
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      text: TextSpan(
        children: beforeTitle +
            [
              TextDisplay.parseEmojiInString(
                title,
                (selected ? TextDisplay.chatTittleSelected : TextDisplay.chatTittle).copyWith(color: textColor),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: isSupport
                      ? Icon(
                          Icons.privacy_tip,
                          color: ClientTheme.currentTheme.getField("VerifedSupergoupIconColor"),
                        )
                      : isScam
                          ? Icon(
                              Icons.warning,
                              color: ClientTheme.currentTheme.getField("ScamIconColor"),
                            )
                          : isVerifed
                              ? Icon(
                                  Icons.verified,
                                  color: ClientTheme.currentTheme.getField("VerifedSupergoupIconColor"),
                                )
                              : const SizedBox.shrink(),
                ),
              ),
            ],
      ),
    );
  }
}
