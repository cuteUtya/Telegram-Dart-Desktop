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

  /// [recentSpeakers] At most 3 recently speaking users in the group call
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
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    scheduledStartDate = json['scheduled_start_date'] == null ? null : json['scheduled_start_date'];
    enabledStartNotification = json['enabled_start_notification'] == null ? null : json['enabled_start_notification'];
    isActive = json['is_active'] == null ? null : json['is_active'];
    isJoined = json['is_joined'] == null ? null : json['is_joined'];
    needRejoin = json['need_rejoin'] == null ? null : json['need_rejoin'];
    canBeManaged = json['can_be_managed'] == null ? null : json['can_be_managed'];
    participantCount = json['participant_count'] == null ? null : json['participant_count'];
    loadedAllParticipants = json['loaded_all_participants'] == null ? null : json['loaded_all_participants'];
    recentSpeakers = json['recent_speakers'] == null ? null : List<GroupCallRecentSpeaker>.from((json['recent_speakers'] ?? [])!.map((item) => GroupCallRecentSpeaker.fromJson(item ?? <String, dynamic>{})).toList());
    isMyVideoEnabled = json['is_my_video_enabled'] == null ? null : json['is_my_video_enabled'];
    isMyVideoPaused = json['is_my_video_paused'] == null ? null : json['is_my_video_paused'];
    canEnableVideo = json['can_enable_video'] == null ? null : json['can_enable_video'];
    muteNewParticipants = json['mute_new_participants'] == null ? null : json['mute_new_participants'];
    canToggleMuteNewParticipants = json['can_toggle_mute_new_participants'] == null ? null : json['can_toggle_mute_new_participants'];
    recordDuration = json['record_duration'] == null ? null : json['record_duration'];
    isVideoRecorded = json['is_video_recorded'] == null ? null : json['is_video_recorded'];
    duration = json['duration'] == null ? null : json['duration'];
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