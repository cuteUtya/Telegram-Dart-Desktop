part of '../tdapi.dart';

class MessageInteractionInfo extends TdObject {

  /// Contains information about interactions with a message
  MessageInteractionInfo({this.viewCount,
    this.forwardCount,
    this.replyInfo,
    this.reactions});

  /// [viewCount] Number of times the message was viewed
  int? viewCount;

  /// [forwardCount] Number of times the message was forwarded
  int? forwardCount;

  /// [replyInfo] Information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
  MessageReplyInfo? replyInfo;

  /// [reactions] The list of reactions added to the message
  List<MessageReaction>? reactions;

  /// Parse from a json
  MessageInteractionInfo.fromJson(Map<String, dynamic> json)  {
    viewCount = json['view_count'] == null ? null : json['view_count'];
    forwardCount = json['forward_count'] == null ? null : json['forward_count'];
    replyInfo = json['reply_info'] == null ? null : MessageReplyInfo.fromJson(json['reply_info'] ?? <String, dynamic>{});
    reactions = json['reactions'] == null ? null : List<MessageReaction>.from((json['reactions'] ?? [])!.map((item) => MessageReaction.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "view_count": viewCount,
      "forward_count": forwardCount,
      "reply_info": replyInfo == null ? null : replyInfo?.toJson(),
      "reactions": reactions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageInteractionInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}