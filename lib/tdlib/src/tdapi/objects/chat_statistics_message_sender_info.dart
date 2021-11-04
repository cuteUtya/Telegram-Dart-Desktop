part of '../tdapi.dart';

class ChatStatisticsMessageSenderInfo extends TdObject {

  /// Contains statistics about messages sent by a user
  ChatStatisticsMessageSenderInfo({this.userId,
    this.sentMessageCount,
    this.averageCharacterCount});

  /// [userId] User identifier
  int? userId;

  /// [sentMessageCount] Number of sent messages
  int? sentMessageCount;

  /// [averageCharacterCount] Average number of characters in sent messages; 0 if unknown
  int? averageCharacterCount;

  /// Parse from a json
  ChatStatisticsMessageSenderInfo.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'];
    sentMessageCount = json['sent_message_count'];
    averageCharacterCount = json['average_character_count'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "sent_message_count": sentMessageCount,
      "average_character_count": averageCharacterCount,
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsMessageSenderInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}