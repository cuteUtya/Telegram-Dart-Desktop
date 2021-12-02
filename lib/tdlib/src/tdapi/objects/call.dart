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
    id = json['id'] == null ? null : json['id'];
    userId = json['user_id'] == null ? null : json['user_id'];
    isOutgoing = json['is_outgoing'] == null ? null : json['is_outgoing'];
    isVideo = json['is_video'] == null ? null : json['is_video'];
    state = json['state'] == null ? null : CallState.fromJson(json['state'] ?? <String, dynamic>{});
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