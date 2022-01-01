import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class BackgroundWallpaperDisplay extends StatelessWidget {
  const BackgroundWallpaperDisplay(
      {Key? key,
      required this.wallpaper,
      required this.client,
      required this.document})
      : super(key: key);
  final BackgroundTypeWallpaper wallpaper;
  final Document document;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    //TODO blur if it nesessary
    return FileImageDisplay(id: document.document!.id!, client: client);
  }
}
