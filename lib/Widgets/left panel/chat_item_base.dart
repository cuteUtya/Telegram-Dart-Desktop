import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';

class ChatItemBase extends StatelessWidget {
  const ChatItemBase(
      {Key? key,
      this.icon,
      this.content,
      this.title,
      this.unread = 0,
      this.unreadMention = 0,
      this.chatPic})
      : super(key: key);
  final Icon? icon;
  final int unread;
  final int unreadMention;
  final Widget? content;
  final Widget? title;
  final Widget? chatPic;

  static const bool USE_HORIZONTAL_SEPARATOR = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
          padding: EdgeInsets.only(left: 88, right: 16),
          child:
              USE_HORIZONTAL_SEPARATOR ? SeparatorLine() : SizedBox.shrink()),
      TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              animationDuration: const Duration(milliseconds: 200),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                String themeStr = "ChatUnselectedColor";
                if (states.contains(MaterialState.pressed)) {
                  themeStr = "ChatClickAnimationEffectColor";
                } else if (states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.focused)) {
                  themeStr = "ChatSelectedColor";
                }
                return ClientTheme.currentTheme.getField(themeStr);
              })),
          onPressed: () {},
          child: Column(children: [
            SizedBox(
                height: 88,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(children: [
                      SizedBox(width: 64, height: 64, child: chatPic),
                      const SizedBox(width: 16),
                      Flexible(
                          child: Column(children: [
                        title ?? const SizedBox(height: 16),
                        const SizedBox(height: 2),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              content ?? const SizedBox.shrink(),
                              Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Row(children: [
                                    UnreadCountBubble(
                                        count: unread,
                                        important: unreadMention > 0),
                                    icon ?? const SizedBox.shrink()
                                  ]))
                            ])
                      ]))
                    ])))
          ]))
    ]);
  }
}
