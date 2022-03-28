import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/scale_utils.dart';

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

  /// TODO get value from settings
  static int contentLines = 2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
          animationDuration: const Duration(milliseconds: 200),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(
            ClientTheme.currentTheme.getField(
              selected
                  ? "ChatCurrentlySelectedColor"
                  : "ChatCurrentlyUnselectedColor",
            ),
          ),
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
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.1);
              }
              themeStr = "ChatCurrentlySelectedColor";
            }
            return ClientTheme.currentTheme.getField(themeStr);
          })),
      onPressed: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: p(6), horizontal: p(8)),
        child: Row(
          children: [
            SizedBox(
              child: chatPic,
              width: p(42),
              height: p(42),
            ),
            SizedBox(width: p(12)),
            Flexible(
              child: Column(
                children: [
                  title ?? SizedBox(height: p(12)),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      content ?? const SizedBox.shrink(),
                      Container(
                        margin: EdgeInsets.only(top: p(4)),
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
