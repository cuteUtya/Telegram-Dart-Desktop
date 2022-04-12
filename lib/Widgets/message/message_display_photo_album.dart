import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/message/message_info_overlay_display.dart';
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
    var child = LayoutBuilder(
      builder: (_, box) {
        Widget content = SizedBox();

        Radius r = const Radius.circular(4);
        double margin = caption == null ? 3 : 1.5;
        Widget vMargin = SizedBox(height: margin);
        Widget lMargin = SizedBox(width: margin);

        Widget photo(Message p) {
          if (p.content is MessagePhoto) {
            return SizedBox.expand(
              child: RemoteImageDisplay(
                client: client,
                photo: p.content as MessagePhoto,
                fit: BoxFit.cover,
              ),
            );
          }
          //TODO support video displayng
          return const SizedBox();
        }

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
          Map<int, int>? messagesFlex,
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
                messagesFlex?[i] ?? 1,
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
            if (sort[1].length == 5) {
              content = Column(
                children: [
                  Flexible(
                    child: imagesLine(
                      messages.sublist(0, 2),
                      topLeft: externalBorders.topLeft,
                      topRight: externalBorders.topRight,
                    ),
                  ),
                  vMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(2, 5),
                      bottomLeft: externalBorders.bottomLeft,
                      bottomRight: externalBorders.bottomRight,
                    ),
                  ),
                ],
              );
            } else if (sort[1].length == 1) {
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
            } else {
              content = Column(
                children: [
                  Flexible(
                    child: imagesLine(
                      messages.sublist(1, 3),
                      bottomLeft: r,
                      bottomRight: r,
                    ),
                  ),
                  vMargin,
                  wrap(
                    photo(messages[0]),
                    BorderRadius.all(r),
                    2,
                  ),
                  vMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(
                        3,
                        messages.length,
                      ),
                      bottomLeft: externalBorders.bottomLeft,
                      bottomRight: externalBorders.bottomRight,
                    ),
                  )
                ],
              );
            }
            break;

          case 6:
            content = Column(
              children: [
                wrap(
                  photo(messages[0]),
                  externalBorders.copyWith(
                    bottomRight: r,
                    bottomLeft: r,
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
                    bottomLeft: externalBorders.bottomLeft,
                    bottomRight: externalBorders.bottomRight,
                  ),
                ),
              ],
            );
            break;

          case 7:
            content = Column(
              children: [
                Flexible(
                  child: imagesLine(
                    messages.sublist(0, 2),
                    topLeft: externalBorders.topLeft,
                    topRight: externalBorders.topRight,
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(2, 5),
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(5, messages.length),
                    bottomLeft: externalBorders.bottomLeft,
                    bottomRight: externalBorders.bottomRight,
                  ),
                ),
              ],
            );
            break;

          case 8:
            if (sort[1].length == 1) {
              heightDivider = 1.2;
              messages.remove(sort[1][0]);
              content = Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        wrap(
                          photo(sort[1][0]),
                          externalBorders.copyWith(
                            bottomLeft: r,
                            bottomRight: r,
                            topRight: r,
                          ),
                        ),
                        lMargin,
                        Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: imagesLine(
                                  messages.sublist(0, 2),
                                  topRight: externalBorders.topRight,
                                  messagesFlex: {1: 2},
                                ),
                              ),
                              vMargin,
                              Flexible(
                                child: imagesLine(
                                  messages.sublist(2, 4),
                                  topRight: externalBorders.topRight,
                                  messagesFlex: {2: 2},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  vMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(4, messages.length),
                      bottomLeft: externalBorders.bottomLeft,
                      bottomRight: externalBorders.bottomRight,
                      messagesFlex: {2: 2, 3: 2},
                    ),
                  )
                ],
              );
            } else if (sort[1].length == 2) {
              messages.remove(sort[1][0]);
              messages.remove(sort[1][1]);
              content = Column(
                children: [
                  Flexible(
                    child: imagesLine(
                      messages.sublist(0, 2),
                      topLeft: externalBorders.topLeft,
                      topRight: externalBorders.topRight,
                    ),
                  ),
                  vMargin,
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          child: imagesLine(
                            [messages[2], sort[1][0]],
                            axis: Axis.vertical,
                            bottomLeft: externalBorders.bottomLeft,
                            messagesFlex: {1: 2},
                          ),
                        ),
                        lMargin,
                        Flexible(
                          child: imagesLine(
                            messages.sublist(3, 5),
                            axis: Axis.vertical,
                            messagesFlex: {0: 3, 1: 2},
                          ),
                        ),
                        lMargin,
                        Flexible(
                          child: imagesLine(
                            [messages[5], sort[1][1]],
                            axis: Axis.vertical,
                            bottomRight: externalBorders.bottomRight,
                            messagesFlex: {1: 2},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              heightDivider = 1.5;
              content = Row(
                children: [
                  Flexible(
                    child: imagesLine(
                      messages.sublist(0, 3),
                      axis: Axis.vertical,
                      topLeft: externalBorders.topLeft,
                      bottomLeft: externalBorders.topLeft,
                    ),
                  ),
                  lMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(3, 5),
                      axis: Axis.vertical,
                    ),
                  ),
                  lMargin,
                  Flexible(
                    child: imagesLine(
                      messages.sublist(5, messages.length),
                      axis: Axis.vertical,
                      topRight: externalBorders.topRight,
                      bottomRight: externalBorders.bottomRight,
                    ),
                  ),
                ],
              );
            }
            break;

          case 9:
            content = Column(
              children: [
                Flexible(
                  child: imagesLine(
                    messages.sublist(0, 3),
                    topLeft: externalBorders.topLeft,
                    topRight: externalBorders.topRight,
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(3, 6),
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(6, messages.length),
                    bottomRight: externalBorders.bottomRight,
                    bottomLeft: externalBorders.bottomLeft,
                  ),
                ),
              ],
            );
            break;

          case 10:
            content = Column(
              children: [
                Flexible(
                  child: imagesLine(
                    messages.sublist(0, 3),
                    topLeft: externalBorders.topLeft,
                    topRight: externalBorders.bottomRight,
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(3, 7),
                  ),
                ),
                vMargin,
                Flexible(
                  child: imagesLine(
                    messages.sublist(7, messages.length),
                    bottomRight: externalBorders.bottomRight,
                    bottomLeft: externalBorders.bottomLeft,
                  ),
                ),
              ],
            );
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

    return MessageInfoOverlayDisplay(
      content: child,
      info: infoWidget ?? const SizedBox(),
    );
  }
}
