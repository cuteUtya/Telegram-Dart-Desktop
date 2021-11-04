part of '../tdapi.dart';

class SendMessageAlbum extends TdFunction {

  /// Sends 2-10 messages grouped together into an album. Currently only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
  SendMessageAlbum({this.chatId,
    this.messageThreadId,
    this.replyToMessageId,
    this.options,
    this.inputMessageContents});

  /// [chatId] Target chat
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the messages will be sent
  int? messageThreadId;

  /// [replyToMessageId] Identifier of a message to reply to or 0
  int? replyToMessageId;

  /// [options] Options to be used to send the messages; pass null to use default options
  MessageSendOptions? options;

  /// [inputMessageContents] Contents of messages to be sent. At most 10 messages can be added to an album
  List<InputMessageContent>? inputMessageContents;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendMessageAlbum.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "reply_to_message_id": replyToMessageId,
      "options": options == null ? null : options?.toJson(),
      "input_message_contents": inputMessageContents?.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendMessageAlbum';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}