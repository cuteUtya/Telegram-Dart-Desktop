part of '../tdapi.dart';

class GroupCall extends TdObject {

  /// Describes a group call
  GroupCall({this.id,
    this.title,
    this.scheduledStartDate,
    this.enabledStartNotification,
    this.isActive,
    this.isJoined,
    this.needRejoin,
    this.canBeManaged,
    this.participantCount,
    this.loadedAllParticipants,
    this.recentSpeakers,
    this.isMyVideoEnabled,
    this.isMyVideoPaused,
    this.canEnableVideo,
    this.muteNewParticipants,
    this.canToggleMuteNewParticipants,
    this.recordDuration,
    this.isVideoRecorded,
    this.duration});

  /// [id] Group call identifier
  int? id;

  /// [title] Group call title
  String? title;

  /// [scheduledStartDate] Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 if it is already active or was ended
  int? scheduledStartDate;

  /// [enabledStartNotification] True, if the group call is scheduled and the current user will receive a notification when the group call will start
  bool? enabledStartNotification;

  /// [isActive] True, if the call is active
  bool? isActive;

  /// [isJoined] True, if the call is joined
  bool? isJoined;

  /// [needRejoin] True, if user was kicked from the call because of network loss and the call needs to be rejoined
  bool? needRejoin;

  /// [canBeManaged] True, if the current user can manage the group call
  bool? canBeManaged;

  /// [participantCount] Number of participants in the group call
  int? participantCount;

  /// [loadedAllParticipants] True, if all group call participants are loaded
  bool? loadedAllParticipants;

  /// [recentSpeakers] Recently speaking users in the group call
  List<GroupCallRecentSpeaker>? recentSpeakers;

  /// [isMyVideoEnabled] True, if the current user's video is enabled
  bool? isMyVideoEnabled;

  /// [isMyVideoPaused] True, if the current user's video is paused
  bool? isMyVideoPaused;

  /// [canEnableVideo] True, if the current user can broadcast video or share screen
  bool? canEnableVideo;

  /// [muteNewParticipants] True, if only group call administrators can unmute new participants
  bool? muteNewParticipants;

  /// [canToggleMuteNewParticipants] True, if the current user can enable or disable mute_new_participants setting
  bool? canToggleMuteNewParticipants;

  /// [recordDuration] Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
  int? recordDuration;

  /// [isVideoRecorded] True, if a video file is being recorded for the call
  bool? isVideoRecorded;

  /// [duration] Call duration, in seconds; for ended calls only
  int? duration;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GroupCall.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    int? pre_scheduledStartDate;
    try{
      pre_scheduledStartDate=json['scheduled_start_date'];
   }catch(_){}
    scheduledStartDate = pre_scheduledStartDate;
    bool? pre_enabledStartNotification;
    try{
      pre_enabledStartNotification=json['enabled_start_notification'];
   }catch(_){}
    enabledStartNotification = pre_enabledStartNotification;
    bool? pre_isActive;
    try{
      pre_isActive=json['is_active'];
   }catch(_){}
    isActive = pre_isActive;
    bool? pre_isJoined;
    try{
      pre_isJoined=json['is_joined'];
   }catch(_){}
    isJoined = pre_isJoined;
    bool? pre_needRejoin;
    try{
      pre_needRejoin=json['need_rejoin'];
   }catch(_){}
    needRejoin = pre_needRejoin;
    bool? pre_canBeManaged;
    try{
      pre_canBeManaged=json['can_be_managed'];
   }catch(_){}
    canBeManaged = pre_canBeManaged;
    int? pre_participantCount;
    try{
      pre_participantCount=json['participant_count'];
   }catch(_){}
    participantCount = pre_participantCount;
    bool? pre_loadedAllParticipants;
    try{
      pre_loadedAllParticipants=json['loaded_all_participants'];
   }catch(_){}
    loadedAllParticipants = pre_loadedAllParticipants;
    List<GroupCallRecentSpeaker>? pre_recentSpeakers;
    try{
      pre_recentSpeakers=List<GroupCallRecentSpeaker>.from((json['recent_speakers'] ?? [])!.map((item) => GroupCallRecentSpeaker.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    recentSpeakers = pre_recentSpeakers;
    bool? pre_isMyVideoEnabled;
    try{
      pre_isMyVideoEnabled=json['is_my_video_enabled'];
   }catch(_){}
    isMyVideoEnabled = pre_isMyVideoEnabled;
    bool? pre_isMyVideoPaused;
    try{
      pre_isMyVideoPaused=json['is_my_video_paused'];
   }catch(_){}
    isMyVideoPaused = pre_isMyVideoPaused;
    bool? pre_canEnableVideo;
    try{
      pre_canEnableVideo=json['can_enable_video'];
   }catch(_){}
    canEnableVideo = pre_canEnableVideo;
    bool? pre_muteNewParticipants;
    try{
      pre_muteNewParticipants=json['mute_new_participants'];
   }catch(_){}
    muteNewParticipants = pre_muteNewParticipants;
    bool? pre_canToggleMuteNewParticipants;
    try{
      pre_canToggleMuteNewParticipants=json['can_toggle_mute_new_participants'];
   }catch(_){}
    canToggleMuteNewParticipants = pre_canToggleMuteNewParticipants;
    int? pre_recordDuration;
    try{
      pre_recordDuration=json['record_duration'];
   }catch(_){}
    recordDuration = pre_recordDuration;
    bool? pre_isVideoRecorded;
    try{
      pre_isVideoRecorded=json['is_video_recorded'];
   }catch(_){}
    isVideoRecorded = pre_isVideoRecorded;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "scheduled_start_date": scheduledStartDate,
      "enabled_start_notification": enabledStartNotification,
      "is_active": isActive,
      "is_joined": isJoined,
      "need_rejoin": needRejoin,
      "can_be_managed": canBeManaged,
      "participant_count": participantCount,
      "loaded_all_participants": loadedAllParticipants,
      "recent_speakers": recentSpeakers?.map((i) => i.toJson()).toList(),
      "is_my_video_enabled": isMyVideoEnabled,
      "is_my_video_paused": isMyVideoPaused,
      "can_enable_video": canEnableVideo,
      "mute_new_participants": muteNewParticipants,
      "can_toggle_mute_new_participants": canToggleMuteNewParticipants,
      "record_duration": recordDuration,
      "is_video_recorded": isVideoRecorded,
      "duration": duration,
    };
  }

  static const CONSTRUCTOR = 'groupCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}