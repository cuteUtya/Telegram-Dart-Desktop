import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';

class ChatFilterItemHorizontal extends StatelessWidget {
  const ChatFilterItemHorizontal(
      {Key? key,
      required this.id,
      required this.title,
      required this.active,
      required this.onClick,
      required this.unread,
      required this.unreadUnmuted})
      : super(key: key);

  final int id;
  final String title;
  final bool active;
  final int unread;
  final int unreadUnmuted;
  final Function(int id) onClick;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutCirc,
      duration: const Duration(milliseconds: 250),
      height: 2,
      child: GestureDetector(
        onTap: () => onClick(id),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextDisplay.parseEmojiInString(
                          title,
                          TextDisplay.create(
                            fontWeight: FontWeight.w400,
                            fontFamily: TextDisplay.greaterImportance,
                            size: 20,
                            textColor:
                                ClientTheme.currentTheme.getField(active ? "FolderTitleActiveColor" : "FolderTitleInactiveColor"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  UnreadCountBubble(
                    count: unread,
                    important: unreadUnmuted > 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
