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
    List<GroupCallVideoSourceGroup>? pre_sourceGroups;
    try{
      pre_sourceGroups=List<GroupCallVideoSourceGroup>.from((json['source_groups'] ?? [])!.map((item) => GroupCallVideoSourceGroup.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    sourceGroups = pre_sourceGroups;
    String? pre_endpointId;
    try{
      pre_endpointId=json['endpoint_id'];
   }catch(_){}
    endpointId = pre_endpointId;
    bool? pre_isPaused;
    try{
      pre_isPaused=json['is_paused'];
   }catch(_){}
    isPaused = pre_isPaused;
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