part of '../tdapi.dart';

class ChatEvent extends TdObject {

  /// Represents a chat event
  ChatEvent({this.id,
    this.date,
    this.memberId,
    this.action});

  /// [id] Chat event identifier 
  int? id;

  /// [date] Point in time (Unix timestamp) when the event happened 
  int? date;

  /// [memberId] Identifier of the user or chat who performed the action 
  MessageSender? memberId;

  /// [action] The action
  ChatEventAction? action;

  /// Parse from a json
  ChatEvent.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    date = json['date'] == null ? null : json['date'];
    memberId = json['member_id'] == null ? null : MessageSender.fromJson(json['member_id'] ?? <String, dynamic>{});
    action = json['action'] == null ? null : ChatEventAction.fromJson(json['action'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "date": date,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "action": action == null ? null : action?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEvent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}