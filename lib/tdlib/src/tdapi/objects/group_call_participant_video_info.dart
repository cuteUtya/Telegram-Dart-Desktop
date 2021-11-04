part of '../tdapi.dart';

class GroupCallParticipantVideoInfo extends TdObject {

  /// Contains information about a group call participant's video channel
  GroupCallParticipantVideoInfo({this.sourceGroups,
    this.endpointId,
    this.isPaused});

  /// [sourceGroups] List of synchronization source groups of the video 
  List<GroupCallVideoSourceGroup>? sourceGroups;

  /// [endpointId] Video channel endpoint identifier
  String? endpointId;

  /// [isPaused] True if the video is paused. This flag needs to be ignored, if new video frames are received
  bool? isPaused;

  /// Parse from a json
  GroupCallParticipantVideoInfo.fromJson(Map<String, dynamic> json)  {
    sourceGroups = List<GroupCallVideoSourceGroup>.from((json['source_groups'] ?? [])!.map((item) => GroupCallVideoSourceGroup.fromJson(item ?? <String, dynamic>{})).toList());
    endpointId = json['endpoint_id'];
    isPaused = json['is_paused'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "source_groups": sourceGroups?.map((i) => i.toJson()).toList(),
      "endpoint_id": endpointId,
      "is_paused": isPaused,
    };
  }

  static const CONSTRUCTOR = 'groupCallParticipantVideoInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}