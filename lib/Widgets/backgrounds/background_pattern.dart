import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/backgrounds/background_fill.dart';

class BackgroundPatternDisplay extends StatelessWidget {
  const BackgroundPatternDisplay({
    Key? key,
    required this.pattern,
    required this.client,
    required this.file,
  }) : super(key: key);

  final BackgroundTypePattern pattern;
  final TelegramClient client;
  final Document file;

  static const double patternWidth = 600;

  @override
  Widget build(BuildContext context) {
    //TODO support background.type.isInterted

    ///its 1440 2960 always, yep 😅?
    var height = 2960 / (1440 / patternWidth);
    Widget svg = FileImageDisplay(
      width: patternWidth,
      height: height,
      tgvColor:
          Color.fromARGB(((pattern.intensity ?? 50) * 2.55).toInt(), 0, 0, 0),
      isTGV: file.mimeType == "application/x-tgwallpattern",
      id: file.document!.id!,
      client: client,
    );

    return LayoutBuilder(
      builder: (_, box) {
        int rows = ((box.maxWidth / patternWidth) + 1).toInt();
        int columns = ((box.maxHeight / height) + 1).toInt();
        var row = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < rows; i++) svg,
            ],
          ),
        );

        Widget child;
        if (height < box.maxHeight) {
          child = ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (int i = 0; i < columns; i++) row,
            ],
          );
        } else {
          child = row;
        }
        return Stack(
          children: [
            BackgroundFillDisplay(
              fill: pattern.fill!,
            ),
            child,
          ],
        );
      },
    );
  }
}
