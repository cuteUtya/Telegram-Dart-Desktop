part of '../tdapi.dart';

class ReportChat extends TdFunction {

  /// Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if this is a private chat with a bot, a private chat with a user sharing their location, a supergroup, or a channel, since other chats can't be checked by moderators
  ReportChat({this.chatId,
    this.messageIds,
    this.reason,
    this.text});

  /// [chatId] Chat identifier
  int? chatId;

  /// [messageIds] Identifiers of reported messages, if any 
  List<int>? messageIds;

  /// [reason] The reason for reporting the chat 
  ChatReportReason? reason;

  /// [text] Additional report details; 0-1024 characters
  String? text;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReportChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_ids": messageIds?.map((i) => i).toList(),
      "reason": reason == null ? null : reason?.toJson(),
      "text": text,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'reportChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}