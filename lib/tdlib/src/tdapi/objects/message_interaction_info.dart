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
    viewCount = json['view_count'];
    forwardCount = json['forward_count'];
    replyInfo = MessageReplyInfo.fromJson(json['reply_info'] ?? <String, dynamic>{});
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