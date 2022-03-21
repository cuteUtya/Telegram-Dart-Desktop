import 'dart:convert';

//import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_region.dart';
import 'package:myapp/Widgets/button_icon.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/emoji_input_panel.dart';
import 'package:myapp/Widgets/widget_opacity_contoller.dart';
import 'package:myapp/Widgets/widget_sizer.dart';
import 'package:myapp/file_utils.dart';
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

  void sendMessage() {
    if (textController.text.isNotEmpty) {
      widget.client.send(
        SendMessage(
          chatId: widget.chatId,
          inputMessageContent: InputMessageText(
            text: widget.client.execute(ParseMarkdown(
              text: FormattedText(text: textController.text),
            )) as FormattedText,
          ),
        ),
      );
      textController.clear();
      textController.text = "";
    }
  }

  List<_AttachedFileInfo> uploadedFiles = [];

  bool fileDragging = false;
  bool dropZoneClosedInUI = true;

  void onFileDragEnd() => setState(
        () {
          fileDragging = false;
        },
      );

  var animDuration = const Duration(milliseconds: 240);

  void saveAttachments() {
    var oldData = widget.client.getClientData(widget.chatId);
    oldData.unsentAttachments = uploadedFiles.map((e) => e.filePath).toList();
    widget.client.send(SetChatClientData(chatId: widget.chatId, clientData: json.encode(oldData)));
  }

  GlobalKey<WidgetSizerState> deleteButtonSizerKey = GlobalKey<WidgetSizerState>();
  GlobalKey<WidgetOpacityContollerState> deleteButtonOpacityKey = GlobalKey<WidgetOpacityContollerState>();

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
    deleteButtonSizerKey.currentState?.resize(const Size(36, 36));
  }

  void hideDeleteButton() {
    deleteButtonOpacityKey.currentState?.animateOpacity(0);
    deleteButtonSizerKey.currentState?.resize(Size.zero);
  }

  @override
  void dispose() {
    widget.client.send(
      SetChatDraftMessage(
        chatId: widget.chatId,
        draftMessage: DraftMessage(
          date: DateTime.now().millisecondsSinceEpoch ~/ 1000,
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var iconColor = ClientTheme.currentTheme.getField("GenericUIIconsColor");
    var emojiPanelPlaceholderKey = GlobalKey();
    var borderRadius = const Radius.circular(16);
    var dropZoneHeight = 180.0;
    var genericFilesWidth = 240.0;

    var chat = widget.client.getChat(widget.chatId);
    String draftText = "";
    if (chat.draftMessage?.inputMessageText is InputMessageText) {
      draftText = (chat.draftMessage?.inputMessageText as InputMessageText).text!.text!;
    }
    textController = TextEditingController(text: draftText);

    if (uploadedFiles.isEmpty) {
      hideDeleteButton();
    }

    return Column(
      children: [
        AnimatedContainer(
          duration: animDuration,
          curve: Curves.decelerate,
          onEnd: () {
            setState(() => dropZoneClosedInUI = !fileDragging && uploadedFiles.isEmpty);
          },
          height: fileDragging || uploadedFiles.isNotEmpty ? dropZoneHeight : 0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ClientTheme.currentTheme.getField("InputFileDropZoneBackgroundColor"),
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
                      size: 42,
                      textColor: ClientTheme.currentTheme.getField("DropHereDropZoneTextColor"),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8),
                    child: LayoutBuilder(
                      builder: (_, box) => ReorderableListView(
                          buildDefaultDragHandles: false,
                          proxyDecorator: ((child, index, animation) {
                            return Container(
                              child: child,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB((animation.value * 128).toInt(), 0, 0, 0),
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
                                key: Key("attachedObject?id=${uploadedFiles.indexOf(file)}"),
                                index: uploadedFiles.indexOf(file),
                                child: Container(
                                  margin: EdgeInsets.only(right: uploadedFiles.indexOf(file) == uploadedFiles.length ? 0 : 8),
                                  child: WidgetOpacityContoller(
                                    key: file.opacityKey,
                                    onEnd: () => setState(() {
                                      deleteFile(file);
                                      saveAttachments();
                                    }),
                                    duration: const Duration(milliseconds: 100),
                                    child: _FileDisplay(
                                      file: file.filePath,
                                      borderRadius: BorderRadius.all(borderRadius),
                                      width: genericFilesWidth,
                                      height: box.maxHeight,
                                      onDelete: () => setState(() => deleteFile(file)),
                                    ),
                                  ),
                                ),
                              )
                          ]),
                    ),
                  ),
          ),
        ),
        if (!dropZoneClosedInUI || fileDragging) SeparatorLine(),
        Container(
          decoration: BoxDecoration(
            color: ClientTheme.currentTheme.getField("ChatInputFieldBackgroundColor"),
            borderRadius: BorderRadius.vertical(
              bottom: borderRadius,
              top: dropZoneClosedInUI && uploadedFiles.isEmpty && !fileDragging ? borderRadius : Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
            child: Row(
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
                      size: 36,
                      color: ClientTheme.currentTheme.getField("DropZoneClearAllButtonColor"),
                      onClick: () => clearFiles(),
                    ),
                  ),
                ),
                ButtonIcon(
                  Icons.attach_file,
                  color: iconColor,
                  size: 36,
                  onClick: () {
                    FilePicker.platform
                        .pickFiles(
                      dialogTitle: widget.client.getTranslation("lng_choose_file"),
                      allowMultiple: true,
                    )
                        .then(
                      (pick) {
                        pick?.files.forEach((file) => attachFile(file.path!));
                      },
                    );
                  },
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration.collapsed(
                        hintText: widget.client.getTranslation("lng_message_ph"),
                        hintStyle: TextDisplay.create(
                          textColor: ClientTheme.currentTheme.getField("InputFieldTextColor"),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: ClientTheme.currentTheme.getField("InputFieldTextColor"),
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
                Container(
                  height: 36,
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
                        size: 36,
                      )
                    ]),
                  ),
                ),
                const SizedBox(width: 16),
                ButtonIcon(
                  Icons.send,
                  color: iconColor,
                  size: 36,
                  onClick: () => sendMessage(),
                ),
              ],
            ),
          ),
        ),
      ],
    ); //),
    // );
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
      size: 18,
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: controllsBackColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(48),
              ),
            ),
            child: Icon(
              getFileIcon(fileExtension, group: fileType) ?? Icons.file_copy,
              color: Colors.white,
            ),
          ),
        Positioned(
          right: 10,
          top: 10,
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
                  size: 18,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        Positioned(
          left: 10,
          top: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                    color: controllsBackColor,
                  ),
                  child: Text(
                    ".$fileExtension",
                    style: textStyle,
                  )),
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)),
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
