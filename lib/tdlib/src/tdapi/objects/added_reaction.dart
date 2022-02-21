part of '../tdapi.dart';

class AddedReaction extends TdObject {

  /// Represents a reaction applied to a message
  AddedReaction({this.reaction,
    this.senderId});

  /// [reaction] Text representation of the reaction 
  String? reaction;

  /// [senderId] Identifier of the chat member, applied the reaction
  MessageSender? senderId;

  /// Parse from a json
  AddedReaction.fromJson(Map<String, dynamic> json)  {
    reaction = json['reaction'] == null ? null : json['reaction'];
    senderId = json['sender_id'] == null ? null : MessageSender.fromJson(json['sender_id'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reaction": reaction,
      "sender_id": senderId == null ? null : senderId?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'addedReaction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}