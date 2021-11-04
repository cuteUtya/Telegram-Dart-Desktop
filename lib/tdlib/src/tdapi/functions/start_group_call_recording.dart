part of '../tdapi.dart';

class StartGroupCallRecording extends TdFunction {

  /// Starts recording of an active group call. Requires groupCall.can_be_managed group call flag
  StartGroupCallRecording({this.groupCallId,
    this.title,
    this.recordVideo,
    this.usePortraitOrientation});

  /// [groupCallId] Group call identifier 
  int? groupCallId;

  /// [title] Group call recording title; 0-64 characters
  String? title;

  /// [recordVideo] Pass true to record a video file instead of an audio file
  bool? recordVideo;

  /// [usePortraitOrientation] Pass true to use portrait orientation for video instead of landscape one
  bool? usePortraitOrientation;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StartGroupCallRecording.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "title": title,
      "record_video": recordVideo,
      "use_portrait_orientation": usePortraitOrientation,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'startGroupCallRecording';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}