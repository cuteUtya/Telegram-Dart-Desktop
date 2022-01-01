import 'package:flutter/cupertino.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/Widgets/backgrounds/background_fill.dart';

class BackgroundPatternDisplay extends StatelessWidget {
  const BackgroundPatternDisplay(
      {Key? key,
      required this.pattern,
      required this.client,
      required this.file})
      : super(key: key);
  final BackgroundTypePattern pattern;
  final TelegramClient client;
  final Document file;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundFillDisplay(fill: pattern.fill!),
      FileImageDisplay(
          tgvColor: Color.fromARGB(
              ((pattern.intensity ?? 50) * 2.55).toInt(), 0, 0, 0),
          isTGV: file.mimeType == "application/x-tgwallpattern",
          id: file.document!.id!,
          client: client)
    ]);
  }
}
