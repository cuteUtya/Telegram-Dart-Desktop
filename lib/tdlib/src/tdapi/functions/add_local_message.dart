part of '../tdapi.dart';

class AddLocalMessage extends TdFunction {

  /// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
  AddLocalMessage({this.chatId,
    this.sender,
    this.replyToMessageId,
    this.disableNotification,
    this.inputMessageContent});

  /// [chatId] Target chat
  int? chatId;

  /// [sender] The sender of the message
  MessageSender? sender;

  /// [replyToMessageId] Identifier of the message to reply to or 0
  int? replyToMessageId;

  /// [disableNotification] Pass true to disable notification for the message
  bool? disableNotification;

  /// [inputMessageContent] The content of the message to be added
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddLocalMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "sender": sender == null ? null : sender?.toJson(),
      "reply_to_message_id": replyToMessageId,
      "disable_notification": disableNotification,
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addLocalMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}