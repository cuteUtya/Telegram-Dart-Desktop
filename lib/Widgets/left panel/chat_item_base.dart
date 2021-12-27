import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class ChatItemBase extends StatelessWidget {
  const ChatItemBase(
      {Key? key,
      required this.selected,
      this.icon,
      this.content,
      this.title,
      this.unreadPlaceHolder,
      this.chatPic,
      this.onClick})
      : super(key: key);
  final bool selected;
  final Icon? icon;
  final Widget? unreadPlaceHolder;
  final Widget? content;
  final Widget? title;
  final Widget? chatPic;
  final Function()? onClick;

  static const double height = 90;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
            animationDuration: const Duration(milliseconds: 200),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            backgroundColor: selected
                ? MaterialStateProperty.all(ClientTheme.currentTheme
                    .getField("ChatCurrentlySelectedColor"))
                : null,
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
        child: SizedBox(
            height: height,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(children: [
                  SizedBox(
                      height: height - 24,
                      width: height - 24,
                      child: chatPic ?? const SizedBox(height: 16)),
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
                                if (unreadPlaceHolder != null)
                                  unreadPlaceHolder!,
                                icon ?? const SizedBox.shrink()
                              ]))
                        ])
                  ]))
                ]))));
  }
}
