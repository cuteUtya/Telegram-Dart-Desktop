part of '../tdapi.dart';

class SetPollAnswer extends TdFunction {

  /// Changes the user answer to a poll. A poll in quiz mode can be answered only once
  SetPollAnswer({this.chatId,
    this.messageId,
    this.optionIds});

  /// [chatId] Identifier of the chat to which the poll belongs
  int? chatId;

  /// [messageId] Identifier of the message containing the poll
  int? messageId;

  /// [optionIds] 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only is the poll allows multiple answers
  List<int>? optionIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetPollAnswer.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "option_ids": optionIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setPollAnswer';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}