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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    ChatEventAction? pre_action;
    try{
      pre_action=ChatEventAction.fromJson(json['action'] ?? <String, dynamic>{});
   }catch(_){}
    action = pre_action;
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