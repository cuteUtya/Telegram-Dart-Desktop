import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
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
  }) : super(key: key);

  final TelegramClient client;
  final List<Message> messages;
  final BorderRadius bubbleBorderRadius;

  @override
  Widget build(BuildContext context) {
    /// if havent any text
    return LayoutBuilder(
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
                padding: const EdgeInsets.all(1),
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

        switch (messages.length) {
          case 2:
            content = imagesLine(
              messages,
              axis: isLandscape(messages[0]) ? Axis.vertical : Axis.horizontal,
              topLeft: bubbleBorderRadius.topLeft,
              topRight: bubbleBorderRadius.topRight,
              bottomLeft: bubbleBorderRadius.bottomLeft,
              bottomRight: bubbleBorderRadius.bottomRight,
            );
            break;
          three:
          case 3:
            var ch = [
              wrap(
                photo(messages[0]),
                landscape
                    ? bubbleBorderRadius.copyWith(
                        bottomLeft: r,
                        bottomRight: r,
                      )
                    : bubbleBorderRadius.copyWith(
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
                        bottomLeft: bubbleBorderRadius.bottomLeft,
                        bottomRight: bubbleBorderRadius.bottomRight,
                      )
                    : imagesLine(
                        messages.sublist(1),
                        axis: Axis.vertical,
                        topRight: bubbleBorderRadius.topRight,
                        bottomRight: bubbleBorderRadius.topLeft,
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
                      topLeft: bubbleBorderRadius.topLeft,
                      bottomLeft: bubbleBorderRadius.bottomLeft,
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
                      bottomRight: bubbleBorderRadius.bottomRight,
                      topRight: bubbleBorderRadius.topRight,
                    ),
                  ),
                ],
              );
            }
            /*
            content = Column(
              children: [
                wrap(
                  photo(messages[0]),
                  bubbleBorderRadius.copyWith(
                    bottomLeft: r,
                    bottomRight: r,
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(1, 3),
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(
                      3,
                      messages.length,
                    ),
                    bottomLeft: bubbleBorderRadius.bottomLeft,
                    bottomRight: bubbleBorderRadius.bottomRight,
                  ),
                )
              ],
            );*/
            break;
        }

        return SizedBox(
          width: box.maxWidth,
          height: box.maxWidth / heightDivider,
          child: content,
        );
      },
    );

    /// -------------------
    return SizedBox();
  }
}
