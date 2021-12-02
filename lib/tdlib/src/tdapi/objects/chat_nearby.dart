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
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    distance = json['distance'] == null ? null : json['distance'];
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