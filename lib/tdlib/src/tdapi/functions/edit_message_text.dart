part of '../tdapi.dart';

class EditMessageText extends TdFunction {

  /// Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
  EditMessageText({this.chatId,
    this.messageId,
    this.replyMarkup,
    this.inputMessageContent});

  /// [chatId] The chat the message belongs to
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [replyMarkup] The new message reply markup; pass null if none; for bots only
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] New text content of the message. Must be of type inputMessageText
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditMessageText.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editMessageText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}