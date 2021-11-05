part of '../tdapi.dart';

class MessageInteractionInfo extends TdObject {

  /// Contains information about interactions with a message
  MessageInteractionInfo({this.viewCount,
    this.forwardCount,
    this.replyInfo});

  /// [viewCount] Number of times the message was viewed
  int? viewCount;

  /// [forwardCount] Number of times the message was forwarded
  int? forwardCount;

  /// [replyInfo] Contains information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
  MessageReplyInfo? replyInfo;

  /// Parse from a json
  MessageInteractionInfo.fromJson(Map<String, dynamic> json)  {
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
    MessageReplyInfo? pre_replyInfo;
    try{
      pre_replyInfo=MessageReplyInfo.fromJson(json['reply_info'] ?? <String, dynamic>{});
   }catch(_){}
    replyInfo = pre_replyInfo;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "view_count": viewCount,
      "forward_count": forwardCount,
      "reply_info": replyInfo == null ? null : replyInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageInteractionInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}