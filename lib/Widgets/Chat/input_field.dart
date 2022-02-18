import 'package:desktop_drop/desktop_drop.dart' as dropUtil;
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_region.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/emoji_input_panel.dart';
import 'package:myapp/file_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:cross_file/cross_file.dart';
import 'dart:io' as io;

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
  String inputValue = "";
  TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (inputValue.isNotEmpty) {
      textController.clear();
      widget.client.send(
        SendMessage(
          chatId: widget.chatId,
          inputMessageContent: InputMessageText(
            text: widget.client.execute(ParseMarkdown(
              text: FormattedText(text: inputValue),
            )) as FormattedText,
          ),
        ),
      );
    }
  }

  final List<XFile> uploadedFiles = [];

  bool fileDragging = false;
  bool dropZoneClosedInUI = true;

  void onFileDragEnd() => setState(
        () {
          fileDragging = false;
        },
      );

  var animDuration = const Duration(milliseconds: 240);

  @override
  Widget build(BuildContext context) {
    var iconColor = ClientTheme.currentTheme.getField("GenericUIIconsColor");
    var emojiPanelPlaceholderKey = GlobalKey();
    var borderRadius = const Radius.circular(16);
    var dropZoneHeight = 156.0;
    var genericFilesWidth = 196.0;

    return dropUtil.DropTarget(
      onDragEntered: (_) => setState(() {
        fileDragging = true;
        dropZoneClosedInUI = false;
      }),
      onDragDone: (info) {
        onFileDragEnd();
        uploadedFiles.addAll(info.files);
      },
      onDragExited: (_) => onFileDragEnd(),
      child: Column(
        children: [
          AnimatedContainer(
            duration: animDuration,
            curve: Curves.decelerate,
            onEnd: () {
              if (!fileDragging) {
                setState(() => dropZoneClosedInUI = true);
              }
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
              child: uploadedFiles.isEmpty
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
                      padding: EdgeInsets.all(8),
                      child: LayoutBuilder(
                        builder: (_, box) => Row(
                          children: uploadedFiles.map((file) {
                            var fileType = getFileGroup(file.name);
                            return Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: uploadedFiles.indexOf(file) == uploadedFiles.length ? 0 : 8),
                                      child: fileType == FileGroup.imageRaster
                                          ? Image(
                                              image: FileImage(
                                                io.File(file.path),
                                              ),
                                              fit: BoxFit.fitHeight,
                                            )
                                          : Container(
                                              height: box.maxHeight,
                                              width: genericFilesWidth,
                                              decoration: BoxDecoration(
                                                color: ClientTheme.currentTheme
                                                    .getField("file${fileType.toString().split(".")[1]}Color"),
                                                borderRadius: BorderRadius.all(borderRadius),
                                              ),
                                            ),
                                    ),
                                    if (fileType != FileGroup.imageRaster)
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(48),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.file_copy,
                                          color: Colors.white,
                                        ),
                                      ),
                                  ],
                                ),
                                if (fileType != FileGroup.imageRaster)
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Text(
                                      file.name,
                                      style: TextDisplay.create(
                                        size: 18,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ),
          ),
          if (!dropZoneClosedInUI) SeparatorLine(),
          Container(
            decoration: BoxDecoration(
              color: ClientTheme.currentTheme.getField("ChatInputFieldBackgroundColor"),
              borderRadius: BorderRadius.vertical(
                bottom: borderRadius,
                top: dropZoneClosedInUI && uploadedFiles.isEmpty ? borderRadius : Radius.zero,
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
                  Icon(
                    Icons.attach_file,
                    color: iconColor,
                    size: 36,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration.collapsed(
                            hintText: widget.client.getTranslation("lng_message_ph"),
                            hintStyle: TextDisplay.create(textColor: ClientTheme.currentTheme.getField("InputFieldTextColor"))),
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
                          inputValue = value;
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
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: iconColor,
                          size: 36,
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => sendMessage(),
                    child: Icon(
                      Icons.send,
                      color: iconColor,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
