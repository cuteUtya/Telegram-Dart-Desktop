part of '../tdapi.dart';

class SetChatDraftMessage extends TdFunction {

  /// Changes the draft message in a chat
  SetChatDraftMessage({this.chatId,
    this.messageThreadId,
    this.draftMessage});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the draft was changed 
  int? messageThreadId;

  /// [draftMessage] New draft message; pass null to remove the draft
  DraftMessage? draftMessage;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatDraftMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "draft_message": draftMessage == null ? null : draftMessage?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatDraftMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}