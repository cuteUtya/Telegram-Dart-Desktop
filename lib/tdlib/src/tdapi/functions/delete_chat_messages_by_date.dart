part of '../tdapi.dart';

class DeleteChatMessagesByDate extends TdFunction {

  /// Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
  DeleteChatMessagesByDate({this.chatId,
    this.minDate,
    this.maxDate,
    this.revoke});

  /// [chatId] Chat identifier
  int? chatId;

  /// [minDate] The minimum date of the messages to delete 
  int? minDate;

  /// [maxDate] The maximum date of the messages to delete 
  int? maxDate;

  /// [revoke] Pass true to delete chat messages for all users; private chats only
  bool? revoke;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteChatMessagesByDate.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "min_date": minDate,
      "max_date": maxDate,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteChatMessagesByDate';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}