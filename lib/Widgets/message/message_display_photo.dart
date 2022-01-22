import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';
import 'dart:io' as io;
import 'dart:math';

class MessageDisplayPhoto extends StatelessWidget {
  const MessageDisplayPhoto(
      {Key? key,
      required this.client,
      required this.message,
      this.infoWidget,
      this.replieWidget})
      : super(key: key);
  final TelegramClient client;
  final Message message;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessagePhoto);
    var photo = message.content as MessagePhoto;
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];
    bool haveText = (photo.caption?.text ?? "").isNotEmpty;
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    BorderRadius border = BorderRadius.vertical(
        top: replieWidget == null || !haveText
            ? const Radius.circular(12)
            : Radius.zero,
        bottom: haveText ? Radius.zero : const Radius.circular(12));

    return LayoutBuilder(
        builder: (_, constraints) => SizedBox(
            width: max(
                200, min(constraints.maxWidth, photoSize.width!.toDouble())),
            child: haveText
                ? MessageDisplayText(
                    client: client,
                    message: message,
                    additionalContent:
                        _buildImage(photoSize.photo!.id!, border),
                    infoWidget: infoWidget,
                    replieWidget: replieWidget,
                    text: photo.caption)
                : Expanded(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        if (message.isOutgoing! && replieWidget != null)
                          Container(
                            child: replieWidget!,
                            margin: const EdgeInsets.only(right: 8),
                          ),
                        Expanded(
                            child: Align(
                          alignment: message.isOutgoing!
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                MouseRegion(
                                    onEnter: (_) =>
                                        hiderKey.currentState?.show(),
                                    onExit: (_) =>
                                        hiderKey.currentState?.hide(),
                                    child: _buildImage(
                                        photoSize.photo!.id!, border)),
                                if (infoWidget != null)
                                  WidgetHider(
                                      key: hiderKey,
                                      hiddenOnInit: true,
                                      child: Container(
                                        child: infoWidget!,
                                        margin: const EdgeInsets.all(8),
                                      ))
                              ]),
                        )),
                        if (!message.isOutgoing! && replieWidget != null)
                          Container(
                            child: replieWidget!,
                            margin: const EdgeInsets.only(left: 8),
                          ),
                      ]))));
  }

  Widget _buildImage(int fileId, BorderRadius border) =>
      RemoteFileBuilderProgress(
          client: client,
          fileId: fileId,
          builder: (_, progress, path) {
            if (path == null) {
              ///TODO implement better loading animation
              return Text(progress.toString());
            }
            return ClipRRect(
                borderRadius: border,
                child: Image.file(
                  io.File(path),
                  alignment: message.isOutgoing!
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  //height: clamp(
                  //    (photoSize.height ?? 400).toDouble(), 40, 400),
                ));
          });
}
