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
  /// * ChatEventMemberJoinedByRequest
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
  /// * ChatEventMessageTtlChanged
  /// * ChatEventSignMessagesToggled
  /// * ChatEventHasProtectedContentToggled
  /// * ChatEventStickerSetChanged
  /// * ChatEventLocationChanged
  /// * ChatEventIsAllHistoryAvailableToggled
  /// * ChatEventInviteLinkEdited
  /// * ChatEventInviteLinkRevoked
  /// * ChatEventInviteLinkDeleted
  /// * ChatEventVideoChatCreated
  /// * ChatEventVideoChatEnded
  /// * ChatEventVideoChatParticipantIsMutedToggled
  /// * ChatEventVideoChatParticipantVolumeLevelChanged
  /// * ChatEventVideoChatMuteNewParticipantsToggled
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
      case ChatEventMemberJoinedByRequest.CONSTRUCTOR:
        return ChatEventMemberJoinedByRequest.fromJson(json);
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
      case ChatEventMessageTtlChanged.CONSTRUCTOR:
        return ChatEventMessageTtlChanged.fromJson(json);
      case ChatEventSignMessagesToggled.CONSTRUCTOR:
        return ChatEventSignMessagesToggled.fromJson(json);
      case ChatEventHasProtectedContentToggled.CONSTRUCTOR:
        return ChatEventHasProtectedContentToggled.fromJson(json);
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
      case ChatEventVideoChatCreated.CONSTRUCTOR:
        return ChatEventVideoChatCreated.fromJson(json);
      case ChatEventVideoChatEnded.CONSTRUCTOR:
        return ChatEventVideoChatEnded.fromJson(json);
      case ChatEventVideoChatParticipantIsMutedToggled.CONSTRUCTOR:
        return ChatEventVideoChatParticipantIsMutedToggled.fromJson(json);
      case ChatEventVideoChatParticipantVolumeLevelChanged.CONSTRUCTOR:
        return ChatEventVideoChatParticipantVolumeLevelChanged.fromJson(json);
      case ChatEventVideoChatMuteNewParticipantsToggled.CONSTRUCTOR:
        return ChatEventVideoChatMuteNewParticipantsToggled.fromJson(json);
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
    oldMessage = json['old_message'] == null ? null : Message.fromJson(json['old_message'] ?? <String, dynamic>{});
    newMessage = json['new_message'] == null ? null : Message.fromJson(json['new_message'] ?? <String, dynamic>{});
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
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
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
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
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
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
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
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
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

  /// A new member joined the chat via an invite link
  ChatEventMemberJoinedByInviteLink({this.inviteLink});

  /// [inviteLink] Invite link used to join the chat
  ChatInviteLink? inviteLink;

  /// Parse from a json
  ChatEventMemberJoinedByInviteLink.fromJson(Map<String, dynamic> json)  {
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
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

class ChatEventMemberJoinedByRequest extends ChatEventAction {

  /// A new member was accepted to the chat by an administrator
  ChatEventMemberJoinedByRequest({this.approverUserId,
    this.inviteLink});

  /// [approverUserId] User identifier of the chat administrator, approved user join request 
  int? approverUserId;

  /// [inviteLink] Invite link used to join the chat; may be null
  ChatInviteLink? inviteLink;

  /// Parse from a json
  ChatEventMemberJoinedByRequest.fromJson(Map<String, dynamic> json)  {
    approverUserId = json['approver_user_id'] == null ? null : json['approver_user_id'];
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "approver_user_id": approverUserId,
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatEventMemberJoinedByRequest';
  
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
    userId = json['user_id'] == null ? null : json['user_id'];
    status = json['status'] == null ? null : ChatMemberStatus.fromJson(json['status'] ?? <String, dynamic>{});
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
    userId = json['user_id'] == null ? null : json['user_id'];
    oldStatus = json['old_status'] == null ? null : ChatMemberStatus.fromJson(json['old_status'] ?? <String, dynamic>{});
    newStatus = json['new_status'] == null ? null : ChatMemberStatus.fromJson(json['new_status'] ?? <String, dynamic>{});
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
    memberId = json['member_id'] == null ? null : MessageSender.fromJson(json['member_id'] ?? <String, dynamic>{});
    oldStatus = json['old_status'] == null ? null : ChatMemberStatus.fromJson(json['old_status'] ?? <String, dynamic>{});
    newStatus = json['new_status'] == null ? null : ChatMemberStatus.fromJson(json['new_status'] ?? <String, dynamic>{});
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
    oldTitle = json['old_title'] == null ? null : json['old_title'];
    newTitle = json['new_title'] == null ? null : json['new_title'];
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
    oldPermissions = json['old_permissions'] == null ? null : ChatPermissions.fromJson(json['old_permissions'] ?? <String, dynamic>{});
    newPermissions = json['new_permissions'] == null ? null : ChatPermissions.fromJson(json['new_permissions'] ?? <String, dynamic>{});
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
    oldDescription = json['old_description'] == null ? null : json['old_description'];
    newDescription = json['new_description'] == null ? null : json['new_description'];
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
    oldUsername = json['old_username'] == null ? null : json['old_username'];
    newUsername = json['new_username'] == null ? null : json['new_username'];
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
    oldPhoto = json['old_photo'] == null ? null : ChatPhoto.fromJson(json['old_photo'] ?? <String, dynamic>{});
    newPhoto = json['new_photo'] == null ? null : ChatPhoto.fromJson(json['new_photo'] ?? <String, dynamic>{});
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
    canInviteUsers = json['can_invite_users'] == null ? null : json['can_invite_users'];
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
    oldLinkedChatId = json['old_linked_chat_id'] == null ? null : json['old_linked_chat_id'];
    newLinkedChatId = json['new_linked_chat_id'] == null ? null : json['new_linked_chat_id'];
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
    oldSlowModeDelay = json['old_slow_mode_delay'] == null ? null : json['old_slow_mode_delay'];
    newSlowModeDelay = json['new_slow_mode_delay'] == null ? null : json['new_slow_mode_delay'];
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

class ChatEventMessageTtlChanged extends ChatEventAction {

  /// The message TTL was changed
  ChatEventMessageTtlChanged({this.oldMessageTtl,
    this.newMessageTtl});

  /// [oldMessageTtl] Previous value of message_ttl 
  int? oldMessageTtl;

  /// [newMessageTtl] New value of message_ttl
  int? newMessageTtl;

  /// Parse from a json
  ChatEventMessageTtlChanged.fromJson(Map<String, dynamic> json)  {
    oldMessageTtl = json['old_message_ttl'] == null ? null : json['old_message_ttl'];
    newMessageTtl = json['new_message_ttl'] == null ? null : json['new_message_ttl'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_message_ttl": oldMessageTtl,
      "new_message_ttl": newMessageTtl,
    };
  }

  static const CONSTRUCTOR = 'chatEventMessageTtlChanged';
  
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
    signMessages = json['sign_messages'] == null ? null : json['sign_messages'];
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

class ChatEventHasProtectedContentToggled extends ChatEventAction {

  /// The has_protected_content setting of a channel was toggled
  ChatEventHasProtectedContentToggled({this.hasProtectedContent});

  /// [hasProtectedContent] New value of has_protected_content
  bool? hasProtectedContent;

  /// Parse from a json
  ChatEventHasProtectedContentToggled.fromJson(Map<String, dynamic> json)  {
    hasProtectedContent = json['has_protected_content'] == null ? null : json['has_protected_content'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "has_protected_content": hasProtectedContent,
    };
  }

  static const CONSTRUCTOR = 'chatEventHasProtectedContentToggled';
  
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
    oldStickerSetId = json['old_sticker_set_id'] == null ? null : int.tryParse(json['old_sticker_set_id'] ?? "");
    newStickerSetId = json['new_sticker_set_id'] == null ? null : int.tryParse(json['new_sticker_set_id'] ?? "");
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
    oldLocation = json['old_location'] == null ? null : ChatLocation.fromJson(json['old_location'] ?? <String, dynamic>{});
    newLocation = json['new_location'] == null ? null : ChatLocation.fromJson(json['new_location'] ?? <String, dynamic>{});
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
    isAllHistoryAvailable = json['is_all_history_available'] == null ? null : json['is_all_history_available'];
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
    oldInviteLink = json['old_invite_link'] == null ? null : ChatInviteLink.fromJson(json['old_invite_link'] ?? <String, dynamic>{});
    newInviteLink = json['new_invite_link'] == null ? null : ChatInviteLink.fromJson(json['new_invite_link'] ?? <String, dynamic>{});
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
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
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
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
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

class ChatEventVideoChatCreated extends ChatEventAction {

  /// A video chat was created
  ChatEventVideoChatCreated({this.groupCallId});

  /// [groupCallId] Identifier of the video chat. The video chat can be received through the method getGroupCall
  int? groupCallId;

  /// Parse from a json
  ChatEventVideoChatCreated.fromJson(Map<String, dynamic> json)  {
    groupCallId = json['group_call_id'] == null ? null : json['group_call_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
    };
  }

  static const CONSTRUCTOR = 'chatEventVideoChatCreated';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVideoChatEnded extends ChatEventAction {

  /// A video chat was ended
  ChatEventVideoChatEnded({this.groupCallId});

  /// [groupCallId] Identifier of the video chat. The video chat can be received through the method getGroupCall
  int? groupCallId;

  /// Parse from a json
  ChatEventVideoChatEnded.fromJson(Map<String, dynamic> json)  {
    groupCallId = json['group_call_id'] == null ? null : json['group_call_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
    };
  }

  static const CONSTRUCTOR = 'chatEventVideoChatEnded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVideoChatParticipantIsMutedToggled extends ChatEventAction {

  /// A video chat participant was muted or unmuted
  ChatEventVideoChatParticipantIsMutedToggled({this.participantId,
    this.isMuted});

  /// [participantId] Identifier of the affected group call participant 
  MessageSender? participantId;

  /// [isMuted] New value of is_muted
  bool? isMuted;

  /// Parse from a json
  ChatEventVideoChatParticipantIsMutedToggled.fromJson(Map<String, dynamic> json)  {
    participantId = json['participant_id'] == null ? null : MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
    isMuted = json['is_muted'] == null ? null : json['is_muted'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "is_muted": isMuted,
    };
  }

  static const CONSTRUCTOR = 'chatEventVideoChatParticipantIsMutedToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVideoChatParticipantVolumeLevelChanged extends ChatEventAction {

  /// A video chat participant volume level was changed
  ChatEventVideoChatParticipantVolumeLevelChanged({this.participantId,
    this.volumeLevel});

  /// [participantId] Identifier of the affected group call participant 
  MessageSender? participantId;

  /// [volumeLevel] New value of volume_level; 1-20000 in hundreds of percents
  int? volumeLevel;

  /// Parse from a json
  ChatEventVideoChatParticipantVolumeLevelChanged.fromJson(Map<String, dynamic> json)  {
    participantId = json['participant_id'] == null ? null : MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
    volumeLevel = json['volume_level'] == null ? null : json['volume_level'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "volume_level": volumeLevel,
    };
  }

  static const CONSTRUCTOR = 'chatEventVideoChatParticipantVolumeLevelChanged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatEventVideoChatMuteNewParticipantsToggled extends ChatEventAction {

  /// The mute_new_participants setting of a video chat was toggled
  ChatEventVideoChatMuteNewParticipantsToggled({this.muteNewParticipants});

  /// [muteNewParticipants] New value of the mute_new_participants setting
  bool? muteNewParticipants;

  /// Parse from a json
  ChatEventVideoChatMuteNewParticipantsToggled.fromJson(Map<String, dynamic> json)  {
    muteNewParticipants = json['mute_new_participants'] == null ? null : json['mute_new_participants'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "mute_new_participants": muteNewParticipants,
    };
  }

  static const CONSTRUCTOR = 'chatEventVideoChatMuteNewParticipantsToggled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}