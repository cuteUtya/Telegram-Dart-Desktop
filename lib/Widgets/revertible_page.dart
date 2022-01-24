import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
                color: ClientTheme.currentTheme.getField("GenericUIIconsColor"),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextDisplay.create(
                  size: 20,
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
