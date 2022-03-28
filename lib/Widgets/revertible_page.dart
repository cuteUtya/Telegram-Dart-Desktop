import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';

class RevertiblePage extends StatelessWidget {
  const RevertiblePage({
    Key? key,
    required this.onRevert,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final Function() onRevert;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ClientTheme.currentTheme.getField("PageHeaderBackgroundColor"),
          ),
          overlayColor: MaterialStateProperty.resolveWith(((states) {
            return ClientTheme.currentTheme
                .getField("PageHeaderBackgroundColorHovered");
          })),
        ),
        onPressed: onRevert,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: p(8), horizontal: p(6)),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: p(16),
                color: ClientTheme.currentTheme.getField("GenericUIIconsColor"),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextDisplay.create(
                  size: font(14),
                  fontWeight: FontWeight.bold,
                  textColor: ClientTheme.currentTheme.getField("HeaderMain"),
                ),
              ),
            ],
          ),
        ),
      ),
      content
    ]);
  }
}
