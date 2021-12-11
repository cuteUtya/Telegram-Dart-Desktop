import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';

class ChatItemPhotoMinithumbnail extends StatelessWidget {
  const ChatItemPhotoMinithumbnail(
      {Key? key, required this.id, required this.client})
      : super(key: key);
  final int id;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return FileImageDisplay(
        id: id,
        client: client,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        width: 20,
        height: 20);
  }
}
