import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_horizontal.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';

class ChatFilterItemHorizontal extends StatelessWidget {
  const ChatFilterItemHorizontal(
      {Key? key,
      required this.info,
      required this.active,
      required this.onClick})
      : super(key: key);
  final ChatFilterFullInfo info;
  final bool active;
  final Function(int id) onClick;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        curve: Curves.easeInOutCirc,
        duration: const Duration(milliseconds: 250),
        height: 2,
        child: GestureDetector(
            onTap: () => onClick(info.id),
            child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Row(children: [
                    RichText(
                        text: TextSpan(
                            children: TextDisplay.parseEmojiInString(
                                info.title,
                                TextDisplay.create(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: TextDisplay.greaterImportance,
                                    size: 20,
                                    textColor: active
                                        ? TextColor.Accent
                                        : TextColor.RegularText)))),
                    const SizedBox(width: 4),
                    UnreadCountBubble(
                        count: info.unread,
                        color: ClientTheme.currentTheme.getField(
                            info.unreadImportante <= 0
                                ? "UnreadFilterBubbleColor"
                                : "UnreadFilterMentionBubbleColor")),
                  ]),
                ]))),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 3,
                    color: active
                        ? ClientTheme.currentTheme
                            .getField("ChatFilterActiveColor")
                        : Colors.transparent))));
  }
}
