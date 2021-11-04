part of '../tdapi.dart';

class ImportMessages extends TdFunction {

  /// Imports messages exported from another app
  ImportMessages({this.chatId,
    this.messageFile,
    this.attachedFiles});

  /// [chatId] Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
  int? chatId;

  /// [messageFile] File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
  InputFile? messageFile;

  /// [attachedFiles] Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
  List<InputFile>? attachedFiles;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ImportMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_file": messageFile == null ? null : messageFile?.toJson(),
      "attached_files": attachedFiles?.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'importMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}