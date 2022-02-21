part of '../tdapi.dart';

class MessageReaction extends TdObject {

  /// Contains information about a reaction to a message
  MessageReaction({this.reaction,
    this.totalCount,
    this.isChosen,
    this.recentSenderIds});

  /// [reaction] Text representation of the reaction
  String? reaction;

  /// [totalCount] Number of times the reaction was added
  int? totalCount;

  /// [isChosen] True, if the reaction is chosen by the current user
  bool? isChosen;

  /// [recentSenderIds] Identifiers of at most 3 recent message senders, added the reaction; available in private chats, basic groups and supergroups
  List<MessageSender>? recentSenderIds;

  /// Parse from a json
  MessageReaction.fromJson(Map<String, dynamic> json)  {
    reaction = json['reaction'] == null ? null : json['reaction'];
    totalCount = json['total_count'] == null ? null : json['total_count'];
    isChosen = json['is_chosen'] == null ? null : json['is_chosen'];
    recentSenderIds = json['recent_sender_ids'] == null ? null : List<MessageSender>.from((json['recent_sender_ids'] ?? [])!.map((item) => MessageSender.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reaction": reaction,
      "total_count": totalCount,
      "is_chosen": isChosen,
      "recent_sender_ids": recentSenderIds?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageReaction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}