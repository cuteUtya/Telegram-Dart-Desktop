part of '../tdapi.dart';

class ChatEvents extends TdObject {

  /// Contains a list of chat events
  ChatEvents({this.events});

  /// [events] List of events
  List<ChatEvent>? events;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatEvents.fromJson(Map<String, dynamic> json)  {
    List<ChatEvent>? pre_events;
    try{
      pre_events=List<ChatEvent>.from((json['events'] ?? [])!.map((item) => ChatEvent.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    events = pre_events;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "events": events?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatEvents';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}