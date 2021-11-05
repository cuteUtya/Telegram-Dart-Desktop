part of '../tdapi.dart';

class MessageReplyInfo extends TdObject {

  /// Contains information about replies to a message
  MessageReplyInfo({this.replyCount,
    this.recentRepliers,
    this.lastReadInboxMessageId,
    this.lastReadOutboxMessageId,
    this.lastMessageId});

  /// [replyCount] Number of times the message was directly or indirectly replied
  int? replyCount;

  /// [recentRepliers] Recent repliers to the message; available in channels with a discussion supergroup
  List<MessageSender>? recentRepliers;

  /// [lastReadInboxMessageId] Identifier of the last read incoming reply to the message
  int? lastReadInboxMessageId;

  /// [lastReadOutboxMessageId] Identifier of the last read outgoing reply to the message
  int? lastReadOutboxMessageId;

  /// [lastMessageId] Identifier of the last reply to the message
  int? lastMessageId;

  /// Parse from a json
  MessageReplyInfo.fromJson(Map<String, dynamic> json)  {
    int? pre_replyCount;
    try{
      pre_replyCount=json['reply_count'];
   }catch(_){}
    replyCount = pre_replyCount;
    List<MessageSender>? pre_recentRepliers;
    try{
      pre_recentRepliers=List<MessageSender>.from((json['recent_repliers'] ?? [])!.map((item) => MessageSender.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    recentRepliers = pre_recentRepliers;
    int? pre_lastReadInboxMessageId;
    try{
      pre_lastReadInboxMessageId=json['last_read_inbox_message_id'];
   }catch(_){}
    lastReadInboxMessageId = pre_lastReadInboxMessageId;
    int? pre_lastReadOutboxMessageId;
    try{
      pre_lastReadOutboxMessageId=json['last_read_outbox_message_id'];
   }catch(_){}
    lastReadOutboxMessageId = pre_lastReadOutboxMessageId;
    int? pre_lastMessageId;
    try{
      pre_lastMessageId=json['last_message_id'];
   }catch(_){}
    lastMessageId = pre_lastMessageId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reply_count": replyCount,
      "recent_repliers": recentRepliers?.map((i) => i.toJson()).toList(),
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "last_message_id": lastMessageId,
    };
  }

  static const CONSTRUCTOR = 'messageReplyInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}