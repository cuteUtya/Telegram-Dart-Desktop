part of '../tdapi.dart';

class ChatEvent extends TdObject {

  /// Represents a chat event
  ChatEvent({this.id,
    this.date,
    this.userId,
    this.action});

  /// [id] Chat event identifier 
  int? id;

  /// [date] Point in time (Unix timestamp) when the event happened 
  int? date;

  /// [userId] Identifier of the user who performed the action that triggered the event 
  int? userId;

  /// [action] Action performed by the user
  ChatEventAction? action;

  /// Parse from a json
  ChatEvent.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    date = json['date'] == null ? null : json['date'];
    userId = json['user_id'] == null ? null : json['user_id'];
    action = json['action'] == null ? null : ChatEventAction.fromJson(json['action'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "date": date,
      "user_id": userId,
      "action": action == null ? null : action?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEvent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}