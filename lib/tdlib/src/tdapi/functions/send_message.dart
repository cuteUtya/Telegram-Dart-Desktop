part of '../tdapi.dart';

class SendMessage extends TdFunction {

  /// Sends a message. Returns the sent message
  SendMessage({this.chatId,
    this.messageThreadId,
    this.replyToMessageId,
    this.options,
    this.replyMarkup,
    this.inputMessageContent});

  /// [chatId] Target chat
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the message will be sent
  int? messageThreadId;

  /// [replyToMessageId] Identifier of the message to reply to or 0
  int? replyToMessageId;

  /// [options] Options to be used to send the message; pass null to use default options
  MessageSendOptions? options;

  /// [replyMarkup] Markup for replying to the message; pass null if none; for bots only
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "reply_to_message_id": replyToMessageId,
      "options": options == null ? null : options?.toJson(),
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}