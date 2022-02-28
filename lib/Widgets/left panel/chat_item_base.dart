import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';

class ChatItemBase extends StatelessWidget {
  const ChatItemBase({
    Key? key,
    required this.selected,
    this.icon,
    this.content,
    this.title,
    this.unreadPlaceHolder,
    this.chatPic,
    this.onClick,
  }) : super(key: key);

  final bool selected;
  final Icon? icon;
  final Widget? unreadPlaceHolder;
  final Widget? content;
  final Widget? title;
  final Widget? chatPic;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 200),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(ClientTheme.currentTheme
              .getField(selected
                  ? "ChatCurrentlySelectedColor"
                  : "ChatCurrentlyUnselectedColor")),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            String themeStr = "ChatUnselectedColor";
            if (!selected) {
              if (states.contains(MaterialState.pressed)) {
                themeStr = "ChatClickAnimationEffectColor";
              } else if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused)) {
                themeStr = "ChatSelectedColor";
              }
            } else {
              themeStr = "ChatCurrentlySelectedColor";
            }
            return ClientTheme.currentTheme.getField(themeStr);
          })),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            SizedBox(
                  child: chatPic,
                  width: 56,
                  height: 56,
                ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                children: [
                  title ?? const SizedBox(height: 16),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      content ?? const SizedBox.shrink(),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            if (unreadPlaceHolder != null) unreadPlaceHolder!,
                            icon ?? const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
