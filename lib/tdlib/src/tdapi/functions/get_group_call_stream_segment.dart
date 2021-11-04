part of '../tdapi.dart';

class GetGroupCallStreamSegment extends TdFunction {

  /// Returns a file with a segment of a group call stream in a modified OGG format for audio or MPEG-4 format for video
  GetGroupCallStreamSegment({this.groupCallId,
    this.timeOffset,
    this.scale,
    this.channelId,
    this.videoQuality});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [timeOffset] Point in time when the stream segment begins; Unix timestamp in milliseconds
  int? timeOffset;

  /// [scale] Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
  int? scale;

  /// [channelId] Identifier of an audio/video channel to get as received from tgcalls
  int? channelId;

  /// [videoQuality] Video quality as received from tgcalls; pass null to get the worst available quality
  GroupCallVideoQuality? videoQuality;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetGroupCallStreamSegment.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "time_offset": timeOffset,
      "scale": scale,
      "channel_id": channelId,
      "video_quality": videoQuality == null ? null : videoQuality?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getGroupCallStreamSegment';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}