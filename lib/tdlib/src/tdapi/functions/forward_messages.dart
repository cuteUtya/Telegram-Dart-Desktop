part of '../tdapi.dart';

class ForwardMessages extends TdFunction {

  /// Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
  ForwardMessages({this.chatId,
    this.fromChatId,
    this.messageIds,
    this.options,
    this.sendCopy,
    this.removeCaption,
    this.onlyPreview});

  /// [chatId] Identifier of the chat to which to forward messages
  int? chatId;

  /// [fromChatId] Identifier of the chat from which to forward messages
  int? fromChatId;

  /// [messageIds] Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously
  List<int>? messageIds;

  /// [options] Options to be used to send the messages; pass null to use default options
  MessageSendOptions? options;

  /// [sendCopy] If true, content of the messages will be copied without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local
  bool? sendCopy;

  /// [removeCaption] If true, media caption of message copies will be removed. Ignored if send_copy is false
  bool? removeCaption;

  /// [onlyPreview] If true, messages will not be forwarded and instead fake messages will be returned
  bool? onlyPreview;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ForwardMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "from_chat_id": fromChatId,
      "message_ids": messageIds?.map((i) => i).toList(),
      "options": options == null ? null : options?.toJson(),
      "send_copy": sendCopy,
      "remove_caption": removeCaption,
      "only_preview": onlyPreview,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'forwardMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}