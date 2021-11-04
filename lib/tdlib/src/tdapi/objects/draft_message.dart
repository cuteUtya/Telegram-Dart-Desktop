part of '../tdapi.dart';

class DraftMessage extends TdObject {

  /// Contains information about a message draft
  DraftMessage({this.replyToMessageId,
    this.date,
    this.inputMessageText});

  /// [replyToMessageId] Identifier of the message to reply to; 0 if none
  int? replyToMessageId;

  /// [date] Point in time (Unix timestamp) when the draft was created
  int? date;

  /// [inputMessageText] Content of the message draft; must be of the type inputMessageText
  InputMessageContent? inputMessageText;

  /// Parse from a json
  DraftMessage.fromJson(Map<String, dynamic> json)  {
    replyToMessageId = json['reply_to_message_id'];
    date = json['date'];
    inputMessageText = InputMessageContent.fromJson(json['input_message_text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reply_to_message_id": replyToMessageId,
      "date": date,
      "input_message_text": inputMessageText == null ? null : inputMessageText?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'draftMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}