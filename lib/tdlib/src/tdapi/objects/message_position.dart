part of '../tdapi.dart';

class MessagePosition extends TdObject {

  /// Contains information about a message in a specific position
  MessagePosition({this.position,
    this.messageId,
    this.date});

  /// [position] 0-based message position in the full list of suitable messages 
  int? position;

  /// [messageId] Message identifier 
  int? messageId;

  /// [date] Point in time (Unix timestamp) when the message was sent
  int? date;

  /// Parse from a json
  MessagePosition.fromJson(Map<String, dynamic> json)  {
    int? pre_position;
    try{
      pre_position=json['position'];
   }catch(_){}
    position = pre_position;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "position": position,
      "message_id": messageId,
      "date": date,
    };
  }

  static const CONSTRUCTOR = 'messagePosition';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}