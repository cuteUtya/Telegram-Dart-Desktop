import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/remote_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/utils.dart';

class MessageDisplayPhotoAlbum extends StatelessWidget {
  const MessageDisplayPhotoAlbum({
    Key? key,
    required this.client,
    required this.messages,
    required this.bubbleBorderRadius,
    this.infoWidget,
    this.replieWidget,
    this.caption,
    this.contentPadding,
  }) : super(key: key);

  final TelegramClient client;
  final List<Message> messages;
  final BorderRadius bubbleBorderRadius;
  final Widget? infoWidget, replieWidget;
  final FormattedText? caption;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    /// if havent any text
    var child = LayoutBuilder(
      builder: (_, box) {
        Widget content = SizedBox();

        Radius r = const Radius.circular(4);
        Widget vMargin = const SizedBox(height: 3);
        Widget lMargin = const SizedBox(width: 3);

        Widget photo(Message p) => SizedBox.expand(
              child: RemoteImageDisplay(
                client: client,
                photo: p.content as MessagePhoto,
                fit: BoxFit.cover,
              ),
            );

        Widget wrap(Widget w, BorderRadius r, [int flex = 1]) => Flexible(
              flex: flex,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: r,
                  color: ClientTheme.currentTheme.getField(
                    messages[0].isOutgoing!
                        ? "MessageBubbleMineColor"
                        : "MessageBubbleOtherColor",
                  ),
                ),
                padding:
                    caption == null ? const EdgeInsets.all(1) : EdgeInsets.zero,
                child: ClipRRect(
                  child: w,
                  borderRadius: r,
                ),
              ),
            );

        Widget imagesLine(
          List<Message> messages, {
          Axis axis = Axis.horizontal,
          Radius? topRight,
          Radius? topLeft,
          Radius? bottomRight,
          Radius? bottomLeft,
        }) {
          List<Widget> ch = [];
          for (int i = 0; i < messages.length; i++) {
            BorderRadius rad = BorderRadius.all(r);
            if (i == 0) {
              if (axis == Axis.horizontal) {
                rad = rad.copyWith(
                  topLeft: topLeft,
                  bottomLeft: bottomLeft,
                );
              } else {
                rad = rad.copyWith(
                  topLeft: topLeft,
                  topRight: topRight,
                );
              }
            } else if (i == messages.length - 1) {
              if (axis == Axis.horizontal) {
                rad = rad.copyWith(
                  topRight: topRight,
                  bottomRight: bottomRight,
                );
              } else {
                rad = rad.copyWith(
                  bottomLeft: bottomLeft,
                  bottomRight: bottomRight,
                );
              }
            }
            ch.add(
              wrap(
                photo(messages[i]),
                rad,
              ),
            );
            if (i != messages.length - 1) {
              ch.add(
                axis == Axis.horizontal ? lMargin : vMargin,
              );
            }
          }

          return axis == Axis.horizontal
              ? Row(
                  children: ch,
                )
              : Column(
                  children: ch,
                );
        }

        bool isLandscape(Message m) {
          var photo = m.content as MessagePhoto;
          var s = sortPhotoSizes(photo.photo!.sizes!)[0];
          return (s.width! / s.height!) > 1;
        }

        /// sorts images, first array contains all landscape images,
        /// second - only portraits
        List<List<Message>> sortImages(List<Message> messages) {
          List<List<Message>> result = [[], []];
          for (final m in messages) {
            result[isLandscape(m) ? 0 : 1].add(m);
          }
          return result;
        }

        var sort = sortImages(messages);
        bool landscape = sort[0].length > sort[1].length;
        double heightDivider = 1;
        BorderRadius externalBorders = bubbleBorderRadius;
        if (caption != null) {
          externalBorders = externalBorders.copyWith(
            bottomLeft: r,
            bottomRight: r,
          );
        }

        switch (messages.length) {
          case 2:
            content = imagesLine(
              messages,
              axis: isLandscape(messages[0]) ? Axis.vertical : Axis.horizontal,
              topLeft: externalBorders.topLeft,
              topRight: externalBorders.topRight,
              bottomLeft: externalBorders.bottomLeft,
              bottomRight: externalBorders.bottomRight,
            );
            break;
          three:
          case 3:
            var ch = [
              wrap(
                photo(messages[0]),
                landscape
                    ? externalBorders.copyWith(
                        bottomLeft: r,
                        bottomRight: r,
                      )
                    : externalBorders.copyWith(
                        bottomRight: r,
                        topRight: r,
                      ),
                messages.length - 1,
              ),
              !landscape ? lMargin : vMargin,
              Flexible(
                child: landscape
                    ? imagesLine(
                        messages.sublist(1),
                        axis: Axis.horizontal,
                        bottomLeft: externalBorders.bottomLeft,
                        bottomRight: externalBorders.bottomRight,
                      )
                    : imagesLine(
                        messages.sublist(1),
                        axis: Axis.vertical,
                        topRight: externalBorders.topRight,
                        bottomRight: externalBorders.topLeft,
                      ),
              )
            ];
            content = landscape
                ? Column(
                    children: ch,
                  )
                : Row(
                    children: ch,
                  );
            break;
          case 4:
            continue three;

          case 5:
            if (sort[1].isNotEmpty) {
              heightDivider = 2;
              messages.remove(sort[1][0]);
              content = Row(
                children: [
                  Flexible(
                    child: imagesLine(
                      messages.sublist(0, 2),
                      axis: Axis.vertical,
                      topLeft: externalBorders.topLeft,
                      bottomLeft: externalBorders.bottomLeft,
                      topRight: r,
                    ),
                  ),
                  lMargin,
                  wrap(
                    photo(sort[1][0]),
                    BorderRadius.all(r),
                  ),
                  lMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(2, messages.length),
                      axis: Axis.vertical,
                      bottomRight: externalBorders.bottomRight,
                      topRight: externalBorders.topRight,
                    ),
                  ),
                ],
              );
            }
            break;
        }

        return SizedBox(
          width: box.maxWidth,
          height: box.maxWidth / heightDivider,
          child: content,
        );
      },
    );
    if (caption != null || replieWidget != null) {
      return MessageDisplayText(
        client: client,
        message: messages.first,
        text: caption,
        infoWidget: caption != null ? infoWidget : null,
        replieWidget: replieWidget,
        additionalContent: Padding(
          padding: const EdgeInsets.fromLTRB(1, 1, 1, 0),
          child: child,
        ),
        captionMargin: contentPadding,
        showText: caption != null,
      );
    }

    return child;
  }
}
