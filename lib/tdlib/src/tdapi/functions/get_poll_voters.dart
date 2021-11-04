part of '../tdapi.dart';

class GetPollVoters extends TdFunction {

  /// Returns users voted for the specified option in a non-anonymous polls. For optimal performance, the number of returned users is chosen by TDLib
  GetPollVoters({this.chatId,
    this.messageId,
    this.optionId,
    this.offset,
    this.limit});

  /// [chatId] Identifier of the chat to which the poll belongs
  int? chatId;

  /// [messageId] Identifier of the message containing the poll
  int? messageId;

  /// [optionId] 0-based identifier of the answer option
  int? optionId;

  /// [offset] Number of users to skip in the result; must be non-negative
  int? offset;

  /// [limit] The maximum number of users to be returned; must be positive and can't be greater than 50. For optimal performance, the number of returned users is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetPollVoters.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "option_id": optionId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getPollVoters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}