part of '../tdapi.dart';

class ReportChatPhoto extends TdFunction {

  /// Reports a chat photo to the Telegram moderators. A chat photo can be reported only if this is a private chat with a bot, a private chat with a user sharing their location, a supergroup, or a channel, since other chats can't be checked by moderators
  ReportChatPhoto({this.chatId,
    this.fileId,
    this.reason,
    this.text});

  /// [chatId] Chat identifier
  int? chatId;

  /// [fileId] Identifier of the photo to report. Only full photos from chatPhoto can be reported 
  int? fileId;

  /// [reason] The reason for reporting the chat photo 
  ChatReportReason? reason;

  /// [text] Additional report details; 0-1024 characters
  String? text;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReportChatPhoto.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "file_id": fileId,
      "reason": reason == null ? null : reason?.toJson(),
      "text": text,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'reportChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}