part of '../tdapi.dart';

class SendInlineQueryResultMessage extends TdFunction {

  /// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
  SendInlineQueryResultMessage({this.chatId,
    this.messageThreadId,
    this.replyToMessageId,
    this.options,
    this.queryId,
    this.resultId,
    this.hideViaBot});

  /// [chatId] Target chat
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the message will be sent
  int? messageThreadId;

  /// [replyToMessageId] Identifier of a message to reply to or 0
  int? replyToMessageId;

  /// [options] Options to be used to send the message; pass null to use default options
  MessageSendOptions? options;

  /// [queryId] Identifier of the inline query
  int? queryId;

  /// [resultId] Identifier of the inline result
  String? resultId;

  /// [hideViaBot] If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
  bool? hideViaBot;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendInlineQueryResultMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "reply_to_message_id": replyToMessageId,
      "options": options == null ? null : options?.toJson(),
      "query_id": queryId,
      "result_id": resultId,
      "hide_via_bot": hideViaBot,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendInlineQueryResultMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}