part of '../tdapi.dart';

class Call extends TdObject {

  /// Describes a call
  Call({this.id,
    this.userId,
    this.isOutgoing,
    this.isVideo,
    this.state});

  /// [id] Call identifier, not persistent 
  int? id;

  /// [userId] Peer user identifier 
  int? userId;

  /// [isOutgoing] True, if the call is outgoing 
  bool? isOutgoing;

  /// [isVideo] True, if the call is a video call 
  bool? isVideo;

  /// [state] Call state
  CallState? state;

  /// Parse from a json
  Call.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    bool? pre_isOutgoing;
    try{
      pre_isOutgoing=json['is_outgoing'];
   }catch(_){}
    isOutgoing = pre_isOutgoing;
    bool? pre_isVideo;
    try{
      pre_isVideo=json['is_video'];
   }catch(_){}
    isVideo = pre_isVideo;
    CallState? pre_state;
    try{
      pre_state=CallState.fromJson(json['state'] ?? <String, dynamic>{});
   }catch(_){}
    state = pre_state;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "user_id": userId,
      "is_outgoing": isOutgoing,
      "is_video": isVideo,
      "state": state == null ? null : state?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'call';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}