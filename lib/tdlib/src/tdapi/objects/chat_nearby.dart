part of '../tdapi.dart';

class ChatNearby extends TdObject {

  /// Describes a chat located nearby
  ChatNearby({this.chatId,
    this.distance});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [distance] Distance to the chat location, in meters
  int? distance;

  /// Parse from a json
  ChatNearby.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_distance;
    try{
      pre_distance=json['distance'];
   }catch(_){}
    distance = pre_distance;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "distance": distance,
    };
  }

  static const CONSTRUCTOR = 'chatNearby';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}