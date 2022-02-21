part of '../tdapi.dart';

class UnreadReaction extends TdObject {

  /// Contains information about an unread reaction to a message
  UnreadReaction({this.reaction,
    this.senderId,
    this.isBig});

  /// [reaction] Text representation of the reaction
  String? reaction;

  /// [senderId] Identifier of the sender, added the reaction
  MessageSender? senderId;

  /// [isBig] True, if the reaction was added with a big animation
  bool? isBig;

  /// Parse from a json
  UnreadReaction.fromJson(Map<String, dynamic> json)  {
    reaction = json['reaction'] == null ? null : json['reaction'];
    senderId = json['sender_id'] == null ? null : MessageSender.fromJson(json['sender_id'] ?? <String, dynamic>{});
    isBig = json['is_big'] == null ? null : json['is_big'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reaction": reaction,
      "sender_id": senderId == null ? null : senderId?.toJson(),
      "is_big": isBig,
    };
  }

  static const CONSTRUCTOR = 'unreadReaction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}