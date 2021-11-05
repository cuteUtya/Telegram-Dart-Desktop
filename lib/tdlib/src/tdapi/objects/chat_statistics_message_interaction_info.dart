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
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    int? pre_viewCount;
    try{
      pre_viewCount=json['view_count'];
   }catch(_){}
    viewCount = pre_viewCount;
    int? pre_forwardCount;
    try{
      pre_forwardCount=json['forward_count'];
   }catch(_){}
    forwardCount = pre_forwardCount;
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