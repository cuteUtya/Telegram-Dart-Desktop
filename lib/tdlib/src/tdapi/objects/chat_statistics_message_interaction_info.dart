part of '../tdapi.dart';

class ChatStatisticsMessageInteractionInfo extends TdObject {

  /// Contains statistics about interactions with a message
  ChatStatisticsMessageInteractionInfo({this.messageId,
    this.viewCount,
    this.forwardCount});

  /// [messageId] Message identifier
  int? messageId;

  /// [viewCount] Number of times the message was viewed
  int? viewCount;

  /// [forwardCount] Number of times the message was forwarded
  int? forwardCount;

  /// Parse from a json
  ChatStatisticsMessageInteractionInfo.fromJson(Map<String, dynamic> json)  {
    messageId = json['message_id'] == null ? null : json['message_id'];
    viewCount = json['view_count'] == null ? null : json['view_count'];
    forwardCount = json['forward_count'] == null ? null : json['forward_count'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_id": messageId,
      "view_count": viewCount,
      "forward_count": forwardCount,
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsMessageInteractionInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}