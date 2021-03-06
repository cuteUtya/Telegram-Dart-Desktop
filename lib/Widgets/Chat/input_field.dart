import 'dart:convert';

//import 'package:desktop_drop/desktop_drop.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/button_icon.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/emoji_input_panel.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/message_content_preview.dart';
import 'package:myapp/Widgets/stream_builder_wrapper.dart';
import 'package:myapp/Widgets/widget_opacity_contoller.dart';
import 'package:myapp/Widgets/widget_sizer.dart';
import 'package:myapp/file_utils.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'dart:io' as io;

import 'package:myapp/utils.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.client,
    required this.chatId,
  }) : super(key: key);
  final int chatId;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late TextEditingController textController;
  int? replyToMessageId;

  void sendMessage() async {
    //TODO also validate images before send it as image

    InputMessageContent createFile(String path, FormattedText? caption) {
      return InputMessageDocument(
        document: InputFileLocal(path: path),
        caption: caption,
      );
    }

    Future<InputMessageContent> createPhotoToUpload(
        String path, FormattedText? caption) async {
      try {
        var image = io.File(path);
        var decodedImage = await decodeImageFromList(image.readAsBytesSync());

        return InputMessagePhoto(
          photo: InputFileLocal(path: path),
          width: decodedImage.width,
          height: decodedImage.height,
          caption: caption,
        );
      } catch (_) {
        return createFile(path, caption);
      }
    }

    void send(InputMessageContent content) => widget.client.send(
          SendMessage(
            chatId: widget.chatId,
            inputMessageContent: content,
            replyToMessageId: replyToMessageId,
          ),
        );

    /// will autodetect type of file
    /// considering send settings
    Future<InputMessageContent> createObject(
        String path, FormattedText? caption) async {
      if (sendAsFiles) {
        return createFile(path, caption);
      } else {
        return await createPhotoToUpload(path, caption);
      }
    }

    void sendText(FormattedText text) => send(
          InputMessageText(
            text: text,
          ),
        );

    void sendAlbum(List<InputMessageContent> items) {
      widget.client.send(
          SendMessageAlbum(chatId: widget.chatId, inputMessageContents: items));
    }

    if (textController.text.isNotEmpty || uploadedFiles.isNotEmpty) {
      var text = widget.client.execute(
        ParseMarkdown(
          text: FormattedText(text: textController.text),
        ),
      ) as FormattedText;

      if (uploadedFiles.isEmpty) {
        sendText(text);
      } else if (uploadedFiles.length <= 1) {
        send(await createObject(uploadedFiles[0].filePath, text));
      } else {
        if (groupItems) {
          List<InputMessageContent> items = [];
          for (int i = 0; i < uploadedFiles.length; i++) {
            items.add(
              await createObject(
                uploadedFiles[0].filePath,
                i == uploadedFiles.length - 1 ? text : null,
              ),
            );
          }
          sendAlbum(items);
        } else {
          sendText(text);
          for (var file in uploadedFiles) {
            send(await createObject(file.filePath, null));
          }
        }
      }

      setState(
        () {
          uploadedFiles.clear();
          textController.clear();
          UIEvents.removeReplie();
        },
      );
    }
  }

  List<_AttachedFileInfo> uploadedFiles = [];

  bool fileDragging = false;
  bool dropZoneClosedInUI = true;
  bool sendAsFiles = false;
  bool groupItems = true;

  void onFileDragEnd() => setState(
        () {
          fileDragging = false;
        },
      );

  var animDuration = const Duration(milliseconds: 240);

  void saveAttachments() {
    var oldData = widget.client.getClientData(widget.chatId);
    oldData.unsentAttachments = uploadedFiles.map((e) => e.filePath).toList();
    widget.client.send(SetChatClientData(
        chatId: widget.chatId, clientData: json.encode(oldData)));
  }

  GlobalKey<WidgetSizerState> deleteButtonSizerKey =
      GlobalKey<WidgetSizerState>();
  GlobalKey<WidgetOpacityContollerState> deleteButtonOpacityKey =
      GlobalKey<WidgetOpacityContollerState>();

  void clearFiles() {
    setState(() => uploadedFiles.clear());
    saveAttachments();
  }

  void attachFile(String path) {
    setState(() {
      uploadedFiles.add(_AttachedFileInfo(path));
      showDeletebutton();
      saveAttachments();
    });
  }

  void deleteFile(_AttachedFileInfo file) {
    file.opacityKey.currentState?.animateOpacity(0);
    uploadedFiles.remove(file);
  }

  void showDeletebutton() {
    deleteButtonOpacityKey.currentState?.animateOpacity(1);
    deleteButtonSizerKey.currentState?.resize(Size(iconsSize, iconsSize));
  }

  void hideDeleteButton() {
    deleteButtonOpacityKey.currentState?.animateOpacity(0);
    deleteButtonSizerKey.currentState?.resize(Size.zero);
  }

  @override
  void dispose() {
    print(replyToMessageId);
    widget.client.send(
      SetChatDraftMessage(
        chatId: widget.chatId,
        draftMessage: DraftMessage(
          date: DateTime.now().millisecondsSinceEpoch ~/ 1000,
          replyToMessageId: replyToMessageId,
          inputMessageText: InputMessageText(
            text: FormattedText(
              text: textController.text,
            ),
          ),
        ),
      ),
    );
    super.dispose();
  }

  @override
  void initState() {
    var clientData = widget.client.getClientData(widget.chatId);
    List<_AttachedFileInfo> validatedFiles = [];
    clientData.unsentAttachments.forEach((element) {
      if (io.File(element).existsSync()) {
        validatedFiles.add(_AttachedFileInfo(element));
      }
    });
    setState(() => uploadedFiles = validatedFiles);
    if (validatedFiles.isNotEmpty) {
      /// on first open [deleteButtonSizerKey] was not be attached to any widget
      Future.delayed(Duration.zero, () => showDeletebutton());
    }
    initTextField();

    super.initState();
  }

  void initTextField() {
    var chat = widget.client.getChat(widget.chatId);
    String draftText = "";
    if (chat.draftMessage?.inputMessageText is InputMessageText) {
      draftText =
          (chat.draftMessage?.inputMessageText as InputMessageText).text!.text!;
    }
    textController = TextEditingController(text: draftText);
    if ((chat.draftMessage?.replyToMessageId ?? 0) != 0) {
      Future.delayed(
        Duration.zero,
        () => UIEvents.replieTo(
          chat.draftMessage?.replyToMessageId,
        ),
      );
    }
  }

  static double iconsSize = p(20);

  @override
  Widget build(BuildContext context) {
    var iconColor = ClientTheme.currentTheme.getField("GenericUIIconsColor");
    var emojiPanelPlaceholderKey = GlobalKey();
    var borderRadius = Radius.circular(p(10));
    var dropZoneHeight = 120.0;
    var genericFilesWidth = 160.0;

    if (uploadedFiles.isEmpty) {
      hideDeleteButton();
    }

    Widget child = Column(
      children: [
        AnimatedContainer(
          duration: animDuration,
          curve: Curves.decelerate,
          onEnd: () {
            setState(() =>
                dropZoneClosedInUI = !fileDragging && uploadedFiles.isEmpty);
          },
          height: fileDragging || uploadedFiles.isNotEmpty ? dropZoneHeight : 0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ClientTheme.currentTheme
                .getField("InputFileDropZoneBackgroundColor"),
            borderRadius: BorderRadius.vertical(
              top: borderRadius,
              bottom: Radius.zero,
            ),
          ),
          child: Center(
            child: uploadedFiles.isEmpty && fileDragging
                ? Text(
                    widget.client.getTranslation(
                      "lng_drag_files_here",
                    ),
                    style: TextDisplay.create(
                      size: font(28),
                      textColor: ClientTheme.currentTheme
                          .getField("DropHereDropZoneTextColor"),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(p(4)),
                    child: LayoutBuilder(
                      builder: (_, box) => ReorderableListView(
                          buildDefaultDragHandles: false,
                          proxyDecorator: ((child, index, animation) {
                            return Container(
                              child: child,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(
                                        (animation.value * 128).toInt(),
                                        0,
                                        0,
                                        0),
                                    blurRadius: 6,
                                    offset: const Offset(1, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.all(borderRadius),
                              ),
                            );
                          }),
                          scrollDirection: Axis.horizontal,
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (oldIndex < newIndex) {
                                newIndex -= 1;
                              }
                              var item = uploadedFiles.removeAt(oldIndex);
                              uploadedFiles.insert(newIndex, item);
                              saveAttachments();
                            });
                          },
                          children: [
                            for (final file in uploadedFiles)
                              ReorderableDragStartListener(
                                key: Key(
                                    "attachedObject?id=${uploadedFiles.indexOf(file)}"),
                                index: uploadedFiles.indexOf(file),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: uploadedFiles.indexOf(file) ==
                                              uploadedFiles.length
                                          ? 0
                                          : p(4)),
                                  child: WidgetOpacityContoller(
                                    key: file.opacityKey,
                                    onEnd: () => setState(() {
                                      deleteFile(file);
                                      saveAttachments();
                                    }),
                                    duration: const Duration(milliseconds: 100),
                                    child: _FileDisplay(
                                      file: file.filePath,
                                      borderRadius:
                                          BorderRadius.all(borderRadius),
                                      width: genericFilesWidth,
                                      height: box.maxHeight,
                                      onDelete: () =>
                                          setState(() => deleteFile(file)),
                                    ),
                                  ),
                                ),
                              )
                          ]),
                    ),
                  ),
          ),
        ),
        if (!dropZoneClosedInUI || fileDragging) const SeparatorLine(),
        Container(
          decoration: BoxDecoration(
            color: ClientTheme.currentTheme
                .getField("ChatInputFieldBackgroundColor"),
            borderRadius: BorderRadius.vertical(
              bottom: borderRadius,
              top: dropZoneClosedInUI && uploadedFiles.isEmpty && !fileDragging
                  ? borderRadius
                  : Radius.zero,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: p(6),
                horizontal: p(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilderWrapper(
                      stream: () => UIEvents.replieOnStream(),
                      builder: (_, data) {
                        if (data.data == null) {
                          replyToMessageId = null;
                          return const SizedBox();
                        }
                        replyToMessageId = data.data as int;
                        return FutureBuilder(
                            future: widget.client.send(
                              GetMessage(
                                chatId: widget.chatId,
                                messageId: data.data as int,
                              ),
                            ),
                            builder: (__, msg) {
                              print("$replyToMessageId % ${widget.chatId}");
                              print((msg.data as TdObject?)?.toJson());
                              return msg.data == null || msg.data is! Message
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.reply_rounded,
                                              size: 24,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: MessageContentPreview(
                                                client: widget.client,
                                                message: msg.data as Message,
                                                style: MessageContentPreviewStyle
                                                    .lineBreakeAfterAuthorName,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            ButtonIcon(
                                              Icons.close,
                                              size: 24,
                                              onClick: () =>
                                                  UIEvents.removeReplie(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        const SeparatorLine(),
                                        const SizedBox(height: 8),
                                      ],
                                    );
                            });
                      }),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      WidgetOpacityContoller(
                        key: deleteButtonOpacityKey,
                        opacity: 0,
                        duration: const Duration(milliseconds: 200),
                        child: WidgetSizer(
                          key: deleteButtonSizerKey,
                          duration: const Duration(milliseconds: 200),
                          sizeOnInit: Size.zero,
                          child: ButtonIcon(
                            Icons.delete,
                            size: iconsSize,
                            color: ClientTheme.currentTheme
                                .getField("DropZoneClearAllButtonColor"),
                            onClick: () => clearFiles(),
                          ),
                        ),
                      ),
                      ButtonIcon(
                        Icons.attach_file,
                        color: iconColor,
                        size: iconsSize,
                        onClick: () {
                          FilePicker.platform
                              .pickFiles(
                            dialogTitle:
                                widget.client.getTranslation("lng_choose_file"),
                            allowMultiple: true,
                          )
                              .then(
                            (pick) {
                              pick?.files
                                  .forEach((file) => attachFile(file.path!));
                            },
                          );
                        },
                      ),
                      SizedBox(width: p(8)),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: p(4)),
                          child: TextField(
                            controller: textController,
                            decoration: InputDecoration.collapsed(
                              hintText: widget.client
                                  .getTranslation("lng_message_ph"),
                              hintStyle: TextDisplay.create(
                                size: font(14),
                                textColor: ClientTheme.currentTheme
                                    .getField("InputFieldTextColor"),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: font(13),
                              color: ClientTheme.currentTheme
                                  .getField("InputFieldTextColor"),
                              fontFamily: TextDisplay.regular,
                              fontFamilyFallback: [
                                TextDisplay.getEmojiFont(),
                              ],
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {
                              widget.client.send(
                                SendChatAction(
                                  chatId: widget.chatId,
                                  action: ChatActionTyping(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (uploadedFiles.length >= 2)
                        Tooltip(
                          message:
                              widget.client.getTranslation("lng_send_album"),
                          textStyle: TextDisplay.create(size: font(13)),
                          child: ButtonIcon(
                            Icons.collections,
                            size: iconsSize,
                            color: groupItems
                                ? ClientTheme.currentTheme.getField("Accent")
                                : iconColor,
                            onClick: () => setState(
                              () => groupItems = !groupItems,
                            ),
                          ),
                        ),
                      if (uploadedFiles.length >= 2) SizedBox(width: p(10)),
                      if (uploadedFiles.isNotEmpty)
                        Tooltip(
                          message: widget.client.getTranslation(
                            sendAsFiles ? "lng_send_file" : "lng_send_photo",
                          ),
                          //TODO use separate color from theme
                          textStyle: TextDisplay.create(size: 14),
                          child: ButtonIcon(
                            sendAsFiles ? Icons.description : Icons.image,
                            onClick: () => setState(
                              () => sendAsFiles = !sendAsFiles,
                            ),
                            size: iconsSize,
                            color: iconColor,
                          ),
                        ),
                      if (uploadedFiles.isNotEmpty) SizedBox(width: p(10)),

                      ///TODO
                      /*Container(
                  height: iconsSize,
                  alignment: Alignment.bottomCenter,
                  child: ContextMenuRegion(
                    placeHolderKey: emojiPanelPlaceholderKey,
                    workOnMainTap: true,
                    workOnSecondaryTap: false,
                    contextMenu: EmojiInputPanel(
                      client: widget.client,
                    ),
                    child: Column(children: [
                      Container(
                        key: emojiPanelPlaceholderKey,
                      ),
                      ButtonIcon(
                        Icons.emoji_emotions_outlined,
                        color: iconColor,
                        size: iconsSize,
                      )
                    ]),
                  ),
                ),*/
                      SizedBox(width: p(10)),
                      ButtonIcon(
                        Icons.send,
                        color: iconColor,
                        size: iconsSize,
                        onClick: () => sendMessage(),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );

    if (!UIManager.isMobile) {
      child = DropTarget(
        child: child,
        onDragEntered: (_) => setState(() {
          fileDragging = true;
          dropZoneClosedInUI = false;
        }),
        onDragDone: (info) {
          showDeletebutton();
          onFileDragEnd();
          uploadedFiles.addAll(
            info.files.map(
              (e) => _AttachedFileInfo(e.path),
            ),
          );
        },
        onDragExited: (_) => onFileDragEnd(),
      );
    }

    return child;
  }
}

class _FileDisplay extends StatelessWidget {
  const _FileDisplay({
    Key? key,
    required this.file,
    this.onDelete,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  final String file;
  final double? height, width;
  final BorderRadius borderRadius;
  final Function? onDelete;

  Color get controllsBackColor => Colors.black.withOpacity(0.33);

  @override
  Widget build(BuildContext context) {
    var fileType = getFileGroup(file);
    var fileName = file.split(io.Platform.pathSeparator).last;
    var fileExtension = fileName.split(".").last;
    var textStyle = TextDisplay.create(
      textColor: Colors.white,
      size: font(13),
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        if (fileType == FileGroup.imageRaster)
          ClipRRect(
            borderRadius: borderRadius,
            child: Image(
              image: FileImage(
                io.File(file),
              ),
              height: height,
            ),
          )
        else
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: getFileColor(fileName),
              borderRadius: borderRadius,
            ),
          ),
        if (fileType != FileGroup.imageRaster)
          Container(
            width: p(32),
            height: p(32),
            decoration: BoxDecoration(
              color: controllsBackColor,
              borderRadius: BorderRadius.all(
                Radius.circular(p(32)),
              ),
            ),
            child: Icon(
              getFileIcon(fileExtension, group: fileType) ?? Icons.file_copy,
              color: Colors.white,
            ),
          ),
        Positioned(
          right: p(6),
          top: p(6),
          child: GestureDetector(
            onTap: () => onDelete?.call(),
            child: Container(
              padding: const EdgeInsets.all(2),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: controllsBackColor,
              ),
            ),
          ),
        ),
        if (fileType != FileGroup.imageRaster)
          Positioned(
            bottom: 2,
            left: 2,
            child: Container(
              width: width,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                fileName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextDisplay.create(
                  size: font(13),
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        Positioned(
          left: p(6),
          top: p(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(3),
                    ),
                    color: controllsBackColor,
                  ),
                  child: Text(
                    ".$fileExtension",
                    style: textStyle,
                  )),
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                      topRight: Radius.circular(3),
                    ),
                    color: controllsBackColor,
                  ),
                  child: FutureBuilder(
                    future: io.File(file).length(),
                    builder: (_, data) => Text(
                      data.hasData ? bytesToSize(data.data as int) : "? KB",
                      style: textStyle,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class _AttachedFileInfo {
  _AttachedFileInfo(this.filePath) {
    opacityKey = GlobalKey<WidgetOpacityContollerState>();
  }
  String filePath;
  late GlobalKey<WidgetOpacityContollerState> opacityKey;
}
