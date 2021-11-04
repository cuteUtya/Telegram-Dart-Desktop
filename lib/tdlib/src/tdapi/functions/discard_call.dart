part of '../tdapi.dart';

class DiscardCall extends TdFunction {

  /// Discards a call
  DiscardCall({this.callId,
    this.isDisconnected,
    this.duration,
    this.isVideo,
    this.connectionId});

  /// [callId] Call identifier 
  int? callId;

  /// [isDisconnected] True, if the user was disconnected 
  bool? isDisconnected;

  /// [duration] The call duration, in seconds 
  int? duration;

  /// [isVideo] True, if the call was a video call 
  bool? isVideo;

  /// [connectionId] Identifier of the connection used during the call
  int? connectionId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DiscardCall.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "call_id": callId,
      "is_disconnected": isDisconnected,
      "duration": duration,
      "is_video": isVideo,
      "connection_id": connectionId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'discardCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}