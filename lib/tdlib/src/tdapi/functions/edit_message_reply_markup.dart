part of '../tdapi.dart';

class EditMessageReplyMarkup extends TdFunction {

  /// Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
  EditMessageReplyMarkup({this.chatId,
    this.messageId,
    this.replyMarkup});

  /// [chatId] The chat the message belongs to
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [replyMarkup] The new message reply markup; pass null if none
  ReplyMarkup? replyMarkup;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditMessageReplyMarkup.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editMessageReplyMarkup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}