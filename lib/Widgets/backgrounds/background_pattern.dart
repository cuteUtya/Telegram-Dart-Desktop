import 'package:flutter/cupertino.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
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
      //i have some memory probles because of this
      //and currently flutter_svg don't support <style>
      //i don't know what i will do with patterns

      /*FileImageDisplay(
          tgvColor: Color.fromARGB(
              ((pattern.intensity ?? 50) * 2.55).toInt(), 0, 0, 0),
          isTGV: file.mimeType == "application/x-tgwallpattern",
          id: file.document!.id!,
          client: client)*/
    ]);
  }
}
