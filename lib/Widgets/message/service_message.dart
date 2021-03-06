import 'package:flutter/cupertino.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/scale_utils.dart';

class ServiceMessage extends StatelessWidget {
  const ServiceMessage({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return MessageInfoBubbleBase.forBig(
      Text.rich(
        TextDisplay.parseEmojiInString(
          text,
          TextDisplay.create(
            fontFamily: TextDisplay.greaterImportance,
            size: font(13),
            textColor: ClientTheme.currentTheme.getField(
              "ServiceMessageTextColor",
            ),
          ),
        ),
      ),
    );
  }
}
