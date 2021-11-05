part of '../tdapi.dart';

class ChatEventAction extends TdObject {

  /// Represents a chat event
  ChatEventAction();

  

  /// a ChatEventAction return type can be :
  /// * ChatEventMessageEdited
  /// * ChatEventMessageDeleted
  /// * ChatEventPollStopped
  /// * ChatEventMessagePinned
  /// * ChatEventMessageUnpinned
  /// * ChatEventMemberJoined
  /// * ChatEventMemberJoinedByInviteLink
  /// * ChatEventMemberLeft
  /// * ChatEventMemberInvited
  /// * ChatEventMemberPromoted
  /// * ChatEventMemberRestricted
  /// * ChatEventTitleChanged
  /// * ChatEventPermissionsChanged
  /// * ChatEventDescriptionChanged
  /// * ChatEventUsernameChanged
  /// * ChatEventPhotoChanged
  /// * ChatEventInvitesToggled
  /// * ChatEventLinkedChatChanged
  /// * ChatEventSlowModeDelayChanged
  /// * ChatEventMessageTtlSettingChanged
  /// * ChatEventSignMessagesToggled
  /// * ChatEventStickerSetChanged
  /// * ChatEventLocationChanged
  /// * ChatEventIsAllHistoryAvailableToggled
  /// * ChatEventInviteLinkEdited
  /// * ChatEventInviteLinkRevoked
  /// * ChatEventInviteLinkDeleted
  /// * ChatEventVoiceChatCreated
  /// * ChatEventVoiceChatDiscarded
  /// * ChatEventVoiceChatParticipantIsMutedToggled
  /// * ChatEventVoiceChatParticipantVolumeLevelChanged
  /// * ChatEventVoiceChatMuteNewParticipantsToggled
  factory ChatEventAction.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatEventMessageEdited.CONSTRUCTOR:
        return ChatEventMessageEdited.fromJson(json);
      case ChatEventMessageDeleted.CONSTRUCTOR:
        return ChatEventMessageDeleted.fromJson(json);
      case ChatEventPollStopped.CONSTRUCTOR:
        return ChatEventPollStopped.fromJson(json);
      case ChatEventMessagePinned.CONSTRUCTOR:
        return ChatEventMessagePinned.fromJson(json);
      case ChatEventMessageUnpinned.CONSTRUCTOR:
        return ChatEventMessageUnpinned.fromJson(json);
      case ChatEventMemberJoined.CONSTRUCTOR:
        return ChatEventMemberJoined.fromJson(json);
      case ChatEventMemberJoinedByInviteLink.CONSTRUCTOR:
        return ChatEventMemberJoinedByInviteLink.fromJson(json);
      case ChatEventMemberLeft.CONSTRUCTOR:
        return ChatEventMemberLeft.fromJson(json);
      case ChatEventMemberInvited.CONSTRUCTOR:
        return ChatEventMemberInvited.fromJson(json);
      case ChatEventMemberPromoted.CONSTRUCTOR:
        return ChatEventMemberPromoted.fromJson(json);
      case ChatEventMemberRestricted.CONSTRUCTOR:
        return ChatEventMemberRestricted.fromJson(json);
      case ChatEventTitleChanged.CONSTRUCTOR:
        return ChatEventTitleChanged.fromJson(json);
      case ChatEventPermissionsChanged.CONSTRUCTOR:
        return ChatEventPermissionsChanged.fromJson(json);
      case ChatEventDescriptionChanged.CONSTRUCTOR:
        return ChatEventDescriptionChanged.fromJson(json);
      case ChatEventUsernameChanged.CONSTRUCTOR:
        return ChatEventUsernameChanged.fromJson(json);
      case ChatEventPhotoChanged.CONSTRUCTOR:
        return ChatEventPhotoChanged.fromJson(json);
      case ChatEventInvitesToggled.CONSTRUCTOR:
        return ChatEventInvitesToggled.fromJson(json);
      case ChatEventLinkedChatChanged.CONSTRUCTOR:
        return ChatEventLinkedChatChanged.fromJson(json);
      case ChatEventSlowModeDelayChanged.CONSTRUCTOR:
        return ChatEventSlowModeDelayChanged.fromJson(json);
      case ChatEventMessageTtlSettingChanged.CONSTRUCTOR:
        return ChatEventMessageTtlSettingChanged.fromJson(json);
      case ChatEventSignMessagesToggled.CONSTRUCTOR:
        return ChatEventSignMessagesToggled.fromJson(json);
      case ChatEventStickerSetChanged.CONSTRUCTOR:
        return ChatEventStickerSetChanged.fromJson(json);
      case ChatEventLocationChanged.CONSTRUCTOR:
        return ChatEventLocationChanged.fromJson(json);
      case ChatEventIsAllHistoryAvailableToggled.CONSTRUCTOR:
        return ChatEventIsAllHistoryAvailableToggled.fromJson(json);
      case ChatEventInviteLinkEdited.CONSTRUCTOR:
        return ChatEventInviteLinkEdited.fromJson(json);
      case ChatEventInviteLinkRevoked.CONSTRUCTOR:
        return ChatEventInviteLinkRevoked.fromJson(json);
      case ChatEventInviteLinkDeleted.CONSTRUCTOR:
        return ChatEventInviteLinkDeleted.fromJson(json);
      case ChatEventVoiceChatCreated.CONSTRUCTOR:
        return ChatEventVoiceChatCreated.fromJson(json);
      case ChatEventVoiceChatDiscarded.CONSTRUCTOR:
        return ChatEventVoiceChatDiscarded.fromJson(json);
      case ChatEventVoiceChatParticipantIsMutedToggled.CONSTRUCTOR:
        return ChatEventVoiceChatParticipantIsMutedToggled.fromJson(json);
      case ChatEventVoiceChatParticipantVolumeLevelChanged.CONSTRUCTOR:
        return ChatEventVoiceChatParticipantVolumeLevelChanged.fromJson(json);
      case ChatEventVoiceChatMuteNewParticipantsToggled.CONSTRUCTOR:
        return ChatEventVoiceChatMuteNewParticipantsToggled.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatEventAction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMessageEdited extends ChatEventAction {

  /// A message was edited
  ChatEventMessageEdited({this.oldMessage,
    this.newMessage});

  /// [oldMessage] The original message before the edit 
  Message? oldMessage;

  /// [newMessage] The message after it was edited
  Message? newMessage;

  /// Parse from a json
  ChatEventMessageEdited.fromJson(Map<String, dynamic> json)  {
    Message? pre_oldMessage;
    try{
      pre_oldMessage=Message.fromJson(json['old_message'] ?? <String, dynamic>{});
   }catch(_){}
    oldMessage = pre_oldMessage;
    Message? pre_newMessage;
    try{
      pre_newMessage=Message.fromJson(json['new_message'] ?? <String, dynamic>{});
   }catch(_){}
    newMessage = pre_newMessage;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_message": oldMessage == null ? null : oldMessage?.toJson(),
      "new_message": newMessage == null ? null : newMessage?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMessageEdited';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMessageDeleted extends ChatEventAction {

  /// A message was deleted
  ChatEventMessageDeleted({this.message});

  /// [message] Deleted message
  Message? message;

  /// Parse from a json
  ChatEventMessageDeleted.fromJson(Map<String, dynamic> json)  {
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMessageDeleted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventPollStopped extends ChatEventAction {

  /// A poll in a message was stopped
  ChatEventPollStopped({this.message});

  /// [message] The message with the poll
  Message? message;

  /// Parse from a json
  ChatEventPollStopped.fromJson(Map<String, dynamic> json)  {
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventPollStopped';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMessagePinned extends ChatEventAction {

  /// A message was pinned
  ChatEventMessagePinned({this.message});

  /// [message] Pinned message
  Message? message;

  /// Parse from a json
  ChatEventMessagePinned.fromJson(Map<String, dynamic> json)  {
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMessagePinned';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMessageUnpinned extends ChatEventAction {

  /// A message was unpinned
  ChatEventMessageUnpinned({this.message});

  /// [message] Unpinned message
  Message? message;

  /// Parse from a json
  ChatEventMessageUnpinned.fromJson(Map<String, dynamic> json)  {
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMessageUnpinned';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberJoined extends ChatEventAction {

  /// A new member joined the chat
  ChatEventMemberJoined();

  

  /// Parse from a json
  ChatEventMemberJoined.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberJoined';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberJoinedByInviteLink extends ChatEventAction {

  /// A new member joined the chat by an invite link
  ChatEventMemberJoinedByInviteLink({this.inviteLink});

  /// [inviteLink] Invite link used to join the chat
  ChatInviteLink? inviteLink;

  /// Parse from a json
  ChatEventMemberJoinedByInviteLink.fromJson(Map<String, dynamic> json)  {
    ChatInviteLink? pre_inviteLink;
    try{
      pre_inviteLink=ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    inviteLink = pre_inviteLink;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberJoinedByInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberLeft extends ChatEventAction {

  /// A member left the chat
  ChatEventMemberLeft();

  

  /// Parse from a json
  ChatEventMemberLeft.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberLeft';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberInvited extends ChatEventAction {

  /// A new chat member was invited
  ChatEventMemberInvited({this.userId,
    this.status});

  /// [userId] New member user identifier 
  int? userId;

  /// [status] New member status
  ChatMemberStatus? status;

  /// Parse from a json
  ChatEventMemberInvited.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    ChatMemberStatus? pre_status;
    try{
      pre_status=ChatMemberStatus.fromJson(json['status'] ?? <String, dynamic>{});
   }catch(_){}
    status = pre_status;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "status": status == null ? null : status?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberInvited';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberPromoted extends ChatEventAction {

  /// A chat member has gained/lost administrator status, or the list of their administrator privileges has changed
  ChatEventMemberPromoted({this.userId,
    this.oldStatus,
    this.newStatus});

  /// [userId] Affected chat member user identifier 
  int? userId;

  /// [oldStatus] Previous status of the chat member 
  ChatMemberStatus? oldStatus;

  /// [newStatus] New status of the chat member
  ChatMemberStatus? newStatus;

  /// Parse from a json
  ChatEventMemberPromoted.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    ChatMemberStatus? pre_oldStatus;
    try{
      pre_oldStatus=ChatMemberStatus.fromJson(json['old_status'] ?? <String, dynamic>{});
   }catch(_){}
    oldStatus = pre_oldStatus;
    ChatMemberStatus? pre_newStatus;
    try{
      pre_newStatus=ChatMemberStatus.fromJson(json['new_status'] ?? <String, dynamic>{});
   }catch(_){}
    newStatus = pre_newStatus;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "old_status": oldStatus == null ? null : oldStatus?.toJson(),
      "new_status": newStatus == null ? null : newStatus?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberPromoted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMemberRestricted extends ChatEventAction {

  /// A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed
  ChatEventMemberRestricted({this.memberId,
    this.oldStatus,
    this.newStatus});

  /// [memberId] Affected chat member identifier 
  MessageSender? memberId;

  /// [oldStatus] Previous status of the chat member 
  ChatMemberStatus? oldStatus;

  /// [newStatus] New status of the chat member
  ChatMemberStatus? newStatus;

  /// Parse from a json
  ChatEventMemberRestricted.fromJson(Map<String, dynamic> json)  {
    MessageSender? pre_memberId;
    try{
      pre_memberId=MessageSender.fromJson(json['member_id'] ?? <String, dynamic>{});
   }catch(_){}
    memberId = pre_memberId;
    ChatMemberStatus? pre_oldStatus;
    try{
      pre_oldStatus=ChatMemberStatus.fromJson(json['old_status'] ?? <String, dynamic>{});
   }catch(_){}
    oldStatus = pre_oldStatus;
    ChatMemberStatus? pre_newStatus;
    try{
      pre_newStatus=ChatMemberStatus.fromJson(json['new_status'] ?? <String, dynamic>{});
   }catch(_){}
    newStatus = pre_newStatus;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "old_status": oldStatus == null ? null : oldStatus?.toJson(),
      "new_status": newStatus == null ? null : newStatus?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberRestricted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventTitleChanged extends ChatEventAction {

  /// The chat title was changed
  ChatEventTitleChanged({this.oldTitle,
    this.newTitle});

  /// [oldTitle] Previous chat title 
  String? oldTitle;

  /// [newTitle] New chat title
  String? newTitle;

  /// Parse from a json
  ChatEventTitleChanged.fromJson(Map<String, dynamic> json)  {
    String? pre_oldTitle;
    try{
      pre_oldTitle=json['old_title'];
   }catch(_){}
    oldTitle = pre_oldTitle;
    String? pre_newTitle;
    try{
      pre_newTitle=json['new_title'];
   }catch(_){}
    newTitle = pre_newTitle;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_title": oldTitle,
      "new_title": newTitle,
    };
  }

  static const CONSTRUCTOR = 'chatEventTitleChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventPermissionsChanged extends ChatEventAction {

  /// The chat permissions was changed
  ChatEventPermissionsChanged({this.oldPermissions,
    this.newPermissions});

  /// [oldPermissions] Previous chat permissions 
  ChatPermissions? oldPermissions;

  /// [newPermissions] New chat permissions
  ChatPermissions? newPermissions;

  /// Parse from a json
  ChatEventPermissionsChanged.fromJson(Map<String, dynamic> json)  {
    ChatPermissions? pre_oldPermissions;
    try{
      pre_oldPermissions=ChatPermissions.fromJson(json['old_permissions'] ?? <String, dynamic>{});
   }catch(_){}
    oldPermissions = pre_oldPermissions;
    ChatPermissions? pre_newPermissions;
    try{
      pre_newPermissions=ChatPermissions.fromJson(json['new_permissions'] ?? <String, dynamic>{});
   }catch(_){}
    newPermissions = pre_newPermissions;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_permissions": oldPermissions == null ? null : oldPermissions?.toJson(),
      "new_permissions": newPermissions == null ? null : newPermissions?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventPermissionsChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventDescriptionChanged extends ChatEventAction {

  /// The chat description was changed
  ChatEventDescriptionChanged({this.oldDescription,
    this.newDescription});

  /// [oldDescription] Previous chat description 
  String? oldDescription;

  /// [newDescription] New chat description
  String? newDescription;

  /// Parse from a json
  ChatEventDescriptionChanged.fromJson(Map<String, dynamic> json)  {
    String? pre_oldDescription;
    try{
      pre_oldDescription=json['old_description'];
   }catch(_){}
    oldDescription = pre_oldDescription;
    String? pre_newDescription;
    try{
      pre_newDescription=json['new_description'];
   }catch(_){}
    newDescription = pre_newDescription;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_description": oldDescription,
      "new_description": newDescription,
    };
  }

  static const CONSTRUCTOR = 'chatEventDescriptionChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventUsernameChanged extends ChatEventAction {

  /// The chat username was changed
  ChatEventUsernameChanged({this.oldUsername,
    this.newUsername});

  /// [oldUsername] Previous chat username 
  String? oldUsername;

  /// [newUsername] New chat username
  String? newUsername;

  /// Parse from a json
  ChatEventUsernameChanged.fromJson(Map<String, dynamic> json)  {
    String? pre_oldUsername;
    try{
      pre_oldUsername=json['old_username'];
   }catch(_){}
    oldUsername = pre_oldUsername;
    String? pre_newUsername;
    try{
      pre_newUsername=json['new_username'];
   }catch(_){}
    newUsername = pre_newUsername;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_username": oldUsername,
      "new_username": newUsername,
    };
  }

  static const CONSTRUCTOR = 'chatEventUsernameChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventPhotoChanged extends ChatEventAction {

  /// The chat photo was changed
  ChatEventPhotoChanged({this.oldPhoto,
    this.newPhoto});

  /// [oldPhoto] Previous chat photo value; may be null 
  ChatPhoto? oldPhoto;

  /// [newPhoto] New chat photo value; may be null
  ChatPhoto? newPhoto;

  /// Parse from a json
  ChatEventPhotoChanged.fromJson(Map<String, dynamic> json)  {
    ChatPhoto? pre_oldPhoto;
    try{
      pre_oldPhoto=ChatPhoto.fromJson(json['old_photo'] ?? <String, dynamic>{});
   }catch(_){}
    oldPhoto = pre_oldPhoto;
    ChatPhoto? pre_newPhoto;
    try{
      pre_newPhoto=ChatPhoto.fromJson(json['new_photo'] ?? <String, dynamic>{});
   }catch(_){}
    newPhoto = pre_newPhoto;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_photo": oldPhoto == null ? null : oldPhoto?.toJson(),
      "new_photo": newPhoto == null ? null : newPhoto?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventPhotoChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventInvitesToggled extends ChatEventAction {

  /// The can_invite_users permission of a supergroup chat was toggled
  ChatEventInvitesToggled({this.canInviteUsers});

  /// [canInviteUsers] New value of can_invite_users permission
  bool? canInviteUsers;

  /// Parse from a json
  ChatEventInvitesToggled.fromJson(Map<String, dynamic> json)  {
    bool? pre_canInviteUsers;
    try{
      pre_canInviteUsers=json['can_invite_users'];
   }catch(_){}
    canInviteUsers = pre_canInviteUsers;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "can_invite_users": canInviteUsers,
    };
  }

  static const CONSTRUCTOR = 'chatEventInvitesToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventLinkedChatChanged extends ChatEventAction {

  /// The linked chat of a supergroup was changed
  ChatEventLinkedChatChanged({this.oldLinkedChatId,
    this.newLinkedChatId});

  /// [oldLinkedChatId] Previous supergroup linked chat identifier 
  int? oldLinkedChatId;

  /// [newLinkedChatId] New supergroup linked chat identifier
  int? newLinkedChatId;

  /// Parse from a json
  ChatEventLinkedChatChanged.fromJson(Map<String, dynamic> json)  {
    int? pre_oldLinkedChatId;
    try{
      pre_oldLinkedChatId=json['old_linked_chat_id'];
   }catch(_){}
    oldLinkedChatId = pre_oldLinkedChatId;
    int? pre_newLinkedChatId;
    try{
      pre_newLinkedChatId=json['new_linked_chat_id'];
   }catch(_){}
    newLinkedChatId = pre_newLinkedChatId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_linked_chat_id": oldLinkedChatId,
      "new_linked_chat_id": newLinkedChatId,
    };
  }

  static const CONSTRUCTOR = 'chatEventLinkedChatChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventSlowModeDelayChanged extends ChatEventAction {

  /// The slow_mode_delay setting of a supergroup was changed
  ChatEventSlowModeDelayChanged({this.oldSlowModeDelay,
    this.newSlowModeDelay});

  /// [oldSlowModeDelay] Previous value of slow_mode_delay, in seconds 
  int? oldSlowModeDelay;

  /// [newSlowModeDelay] New value of slow_mode_delay, in seconds
  int? newSlowModeDelay;

  /// Parse from a json
  ChatEventSlowModeDelayChanged.fromJson(Map<String, dynamic> json)  {
    int? pre_oldSlowModeDelay;
    try{
      pre_oldSlowModeDelay=json['old_slow_mode_delay'];
   }catch(_){}
    oldSlowModeDelay = pre_oldSlowModeDelay;
    int? pre_newSlowModeDelay;
    try{
      pre_newSlowModeDelay=json['new_slow_mode_delay'];
   }catch(_){}
    newSlowModeDelay = pre_newSlowModeDelay;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_slow_mode_delay": oldSlowModeDelay,
      "new_slow_mode_delay": newSlowModeDelay,
    };
  }

  static const CONSTRUCTOR = 'chatEventSlowModeDelayChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventMessageTtlSettingChanged extends ChatEventAction {

  /// The message TTL setting was changed
  ChatEventMessageTtlSettingChanged({this.oldMessageTtlSetting,
    this.newMessageTtlSetting});

  /// [oldMessageTtlSetting] Previous value of message_ttl_setting 
  int? oldMessageTtlSetting;

  /// [newMessageTtlSetting] New value of message_ttl_setting
  int? newMessageTtlSetting;

  /// Parse from a json
  ChatEventMessageTtlSettingChanged.fromJson(Map<String, dynamic> json)  {
    int? pre_oldMessageTtlSetting;
    try{
      pre_oldMessageTtlSetting=json['old_message_ttl_setting'];
   }catch(_){}
    oldMessageTtlSetting = pre_oldMessageTtlSetting;
    int? pre_newMessageTtlSetting;
    try{
      pre_newMessageTtlSetting=json['new_message_ttl_setting'];
   }catch(_){}
    newMessageTtlSetting = pre_newMessageTtlSetting;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_message_ttl_setting": oldMessageTtlSetting,
      "new_message_ttl_setting": newMessageTtlSetting,
    };
  }

  static const CONSTRUCTOR = 'chatEventMessageTtlSettingChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventSignMessagesToggled extends ChatEventAction {

  /// The sign_messages setting of a channel was toggled
  ChatEventSignMessagesToggled({this.signMessages});

  /// [signMessages] New value of sign_messages
  bool? signMessages;

  /// Parse from a json
  ChatEventSignMessagesToggled.fromJson(Map<String, dynamic> json)  {
    bool? pre_signMessages;
    try{
      pre_signMessages=json['sign_messages'];
   }catch(_){}
    signMessages = pre_signMessages;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sign_messages": signMessages,
    };
  }

  static const CONSTRUCTOR = 'chatEventSignMessagesToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventStickerSetChanged extends ChatEventAction {

  /// The supergroup sticker set was changed
  ChatEventStickerSetChanged({this.oldStickerSetId,
    this.newStickerSetId});

  /// [oldStickerSetId] Previous identifier of the chat sticker set; 0 if none 
  int? oldStickerSetId;

  /// [newStickerSetId] New identifier of the chat sticker set; 0 if none
  int? newStickerSetId;

  /// Parse from a json
  ChatEventStickerSetChanged.fromJson(Map<String, dynamic> json)  {
    int? pre_oldStickerSetId;
    try{
      pre_oldStickerSetId=int.tryParse(json['old_sticker_set_id'] ?? "");
   }catch(_){}
    oldStickerSetId = pre_oldStickerSetId;
    int? pre_newStickerSetId;
    try{
      pre_newStickerSetId=int.tryParse(json['new_sticker_set_id'] ?? "");
   }catch(_){}
    newStickerSetId = pre_newStickerSetId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_sticker_set_id": oldStickerSetId,
      "new_sticker_set_id": newStickerSetId,
    };
  }

  static const CONSTRUCTOR = 'chatEventStickerSetChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventLocationChanged extends ChatEventAction {

  /// The supergroup location was changed
  ChatEventLocationChanged({this.oldLocation,
    this.newLocation});

  /// [oldLocation] Previous location; may be null 
  ChatLocation? oldLocation;

  /// [newLocation] New location; may be null
  ChatLocation? newLocation;

  /// Parse from a json
  ChatEventLocationChanged.fromJson(Map<String, dynamic> json)  {
    ChatLocation? pre_oldLocation;
    try{
      pre_oldLocation=ChatLocation.fromJson(json['old_location'] ?? <String, dynamic>{});
   }catch(_){}
    oldLocation = pre_oldLocation;
    ChatLocation? pre_newLocation;
    try{
      pre_newLocation=ChatLocation.fromJson(json['new_location'] ?? <String, dynamic>{});
   }catch(_){}
    newLocation = pre_newLocation;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_location": oldLocation == null ? null : oldLocation?.toJson(),
      "new_location": newLocation == null ? null : newLocation?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventLocationChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventIsAllHistoryAvailableToggled extends ChatEventAction {

  /// The is_all_history_available setting of a supergroup was toggled
  ChatEventIsAllHistoryAvailableToggled({this.isAllHistoryAvailable});

  /// [isAllHistoryAvailable] New value of is_all_history_available
  bool? isAllHistoryAvailable;

  /// Parse from a json
  ChatEventIsAllHistoryAvailableToggled.fromJson(Map<String, dynamic> json)  {
    bool? pre_isAllHistoryAvailable;
    try{
      pre_isAllHistoryAvailable=json['is_all_history_available'];
   }catch(_){}
    isAllHistoryAvailable = pre_isAllHistoryAvailable;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_all_history_available": isAllHistoryAvailable,
    };
  }

  static const CONSTRUCTOR = 'chatEventIsAllHistoryAvailableToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventInviteLinkEdited extends ChatEventAction {

  /// A chat invite link was edited
  ChatEventInviteLinkEdited({this.oldInviteLink,
    this.newInviteLink});

  /// [oldInviteLink] Previous information about the invite link 
  ChatInviteLink? oldInviteLink;

  /// [newInviteLink] New information about the invite link
  ChatInviteLink? newInviteLink;

  /// Parse from a json
  ChatEventInviteLinkEdited.fromJson(Map<String, dynamic> json)  {
    ChatInviteLink? pre_oldInviteLink;
    try{
      pre_oldInviteLink=ChatInviteLink.fromJson(json['old_invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    oldInviteLink = pre_oldInviteLink;
    ChatInviteLink? pre_newInviteLink;
    try{
      pre_newInviteLink=ChatInviteLink.fromJson(json['new_invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    newInviteLink = pre_newInviteLink;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_invite_link": oldInviteLink == null ? null : oldInviteLink?.toJson(),
      "new_invite_link": newInviteLink == null ? null : newInviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventInviteLinkEdited';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventInviteLinkRevoked extends ChatEventAction {

  /// A chat invite link was revoked
  ChatEventInviteLinkRevoked({this.inviteLink});

  /// [inviteLink] The invite link
  ChatInviteLink? inviteLink;

  /// Parse from a json
  ChatEventInviteLinkRevoked.fromJson(Map<String, dynamic> json)  {
    ChatInviteLink? pre_inviteLink;
    try{
      pre_inviteLink=ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    inviteLink = pre_inviteLink;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventInviteLinkRevoked';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventInviteLinkDeleted extends ChatEventAction {

  /// A revoked chat invite link was deleted
  ChatEventInviteLinkDeleted({this.inviteLink});

  /// [inviteLink] The invite link
  ChatInviteLink? inviteLink;

  /// Parse from a json
  ChatEventInviteLinkDeleted.fromJson(Map<String, dynamic> json)  {
    ChatInviteLink? pre_inviteLink;
    try{
      pre_inviteLink=ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    inviteLink = pre_inviteLink;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventInviteLinkDeleted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVoiceChatCreated extends ChatEventAction {

  /// A voice chat was created
  ChatEventVoiceChatCreated({this.groupCallId});

  /// [groupCallId] Identifier of the voice chat. The voice chat can be received through the method getGroupCall
  int? groupCallId;

  /// Parse from a json
  ChatEventVoiceChatCreated.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
    };
  }

  static const CONSTRUCTOR = 'chatEventVoiceChatCreated';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVoiceChatDiscarded extends ChatEventAction {

  /// A voice chat was discarded
  ChatEventVoiceChatDiscarded({this.groupCallId});

  /// [groupCallId] Identifier of the voice chat. The voice chat can be received through the method getGroupCall
  int? groupCallId;

  /// Parse from a json
  ChatEventVoiceChatDiscarded.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
    };
  }

  static const CONSTRUCTOR = 'chatEventVoiceChatDiscarded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVoiceChatParticipantIsMutedToggled extends ChatEventAction {

  /// A voice chat participant was muted or unmuted
  ChatEventVoiceChatParticipantIsMutedToggled({this.participantId,
    this.isMuted});

  /// [participantId] Identifier of the affected group call participant 
  MessageSender? participantId;

  /// [isMuted] New value of is_muted
  bool? isMuted;

  /// Parse from a json
  ChatEventVoiceChatParticipantIsMutedToggled.fromJson(Map<String, dynamic> json)  {
    MessageSender? pre_participantId;
    try{
      pre_participantId=MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
   }catch(_){}
    participantId = pre_participantId;
    bool? pre_isMuted;
    try{
      pre_isMuted=json['is_muted'];
   }catch(_){}
    isMuted = pre_isMuted;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "is_muted": isMuted,
    };
  }

  static const CONSTRUCTOR = 'chatEventVoiceChatParticipantIsMutedToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVoiceChatParticipantVolumeLevelChanged extends ChatEventAction {

  /// A voice chat participant volume level was changed
  ChatEventVoiceChatParticipantVolumeLevelChanged({this.participantId,
    this.volumeLevel});

  /// [participantId] Identifier of the affected group call participant 
  MessageSender? participantId;

  /// [volumeLevel] New value of volume_level; 1-20000 in hundreds of percents
  int? volumeLevel;

  /// Parse from a json
  ChatEventVoiceChatParticipantVolumeLevelChanged.fromJson(Map<String, dynamic> json)  {
    MessageSender? pre_participantId;
    try{
      pre_participantId=MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
   }catch(_){}
    participantId = pre_participantId;
    int? pre_volumeLevel;
    try{
      pre_volumeLevel=json['volume_level'];
   }catch(_){}
    volumeLevel = pre_volumeLevel;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "volume_level": volumeLevel,
    };
  }

  static const CONSTRUCTOR = 'chatEventVoiceChatParticipantVolumeLevelChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVoiceChatMuteNewParticipantsToggled extends ChatEventAction {

  /// The mute_new_participants setting of a voice chat was toggled
  ChatEventVoiceChatMuteNewParticipantsToggled({this.muteNewParticipants});

  /// [muteNewParticipants] New value of the mute_new_participants setting
  bool? muteNewParticipants;

  /// Parse from a json
  ChatEventVoiceChatMuteNewParticipantsToggled.fromJson(Map<String, dynamic> json)  {
    bool? pre_muteNewParticipants;
    try{
      pre_muteNewParticipants=json['mute_new_participants'];
   }catch(_){}
    muteNewParticipants = pre_muteNewParticipants;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "mute_new_participants": muteNewParticipants,
    };
  }

  static const CONSTRUCTOR = 'chatEventVoiceChatMuteNewParticipantsToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}