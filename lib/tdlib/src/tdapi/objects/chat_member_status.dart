part of '../tdapi.dart';

class ChatMemberStatus extends TdObject {

  /// Provides information about the status of a member in a chat
  ChatMemberStatus();

  

  /// a ChatMemberStatus return type can be :
  /// * ChatMemberStatusCreator
  /// * ChatMemberStatusAdministrator
  /// * ChatMemberStatusMember
  /// * ChatMemberStatusRestricted
  /// * ChatMemberStatusLeft
  /// * ChatMemberStatusBanned
  factory ChatMemberStatus.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatMemberStatusCreator.CONSTRUCTOR:
        return ChatMemberStatusCreator.fromJson(json);
      case ChatMemberStatusAdministrator.CONSTRUCTOR:
        return ChatMemberStatusAdministrator.fromJson(json);
      case ChatMemberStatusMember.CONSTRUCTOR:
        return ChatMemberStatusMember.fromJson(json);
      case ChatMemberStatusRestricted.CONSTRUCTOR:
        return ChatMemberStatusRestricted.fromJson(json);
      case ChatMemberStatusLeft.CONSTRUCTOR:
        return ChatMemberStatusLeft.fromJson(json);
      case ChatMemberStatusBanned.CONSTRUCTOR:
        return ChatMemberStatusBanned.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatus';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusCreator extends ChatMemberStatus {

  /// The user is the owner of the chat and has all the administrator privileges
  ChatMemberStatusCreator({this.customTitle,
    this.isAnonymous,
    this.isMember});

  /// [customTitle] A custom title of the owner; 0-16 characters without emojis; applicable to supergroups only
  String? customTitle;

  /// [isAnonymous] True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  bool? isAnonymous;

  /// [isMember] True, if the user is a member of the chat
  bool? isMember;

  /// Parse from a json
  ChatMemberStatusCreator.fromJson(Map<String, dynamic> json)  {
    customTitle = json['custom_title'] == null ? null : json['custom_title'];
    isAnonymous = json['is_anonymous'] == null ? null : json['is_anonymous'];
    isMember = json['is_member'] == null ? null : json['is_member'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "custom_title": customTitle,
      "is_anonymous": isAnonymous,
      "is_member": isMember,
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusCreator';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusAdministrator extends ChatMemberStatus {

  /// The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage video chats. In supergroups and channels, there are more detailed options for administrator privileges
  ChatMemberStatusAdministrator({this.customTitle,
    this.canBeEdited,
    this.canManageChat,
    this.canChangeInfo,
    this.canPostMessages,
    this.canEditMessages,
    this.canDeleteMessages,
    this.canInviteUsers,
    this.canRestrictMembers,
    this.canPinMessages,
    this.canPromoteMembers,
    this.canManageVideoChats,
    this.isAnonymous});

  /// [customTitle] A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
  String? customTitle;

  /// [canBeEdited] True, if the current user can edit the administrator privileges for the called user
  bool? canBeEdited;

  /// [canManageChat] True, if the administrator can get chat event log, get chat statistics, get message statistics in channels, get channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
  bool? canManageChat;

  /// [canChangeInfo] True, if the administrator can change the chat title, photo, and other settings
  bool? canChangeInfo;

  /// [canPostMessages] True, if the administrator can create channel posts; applicable to channels only
  bool? canPostMessages;

  /// [canEditMessages] True, if the administrator can edit messages of other users and pin messages; applicable to channels only
  bool? canEditMessages;

  /// [canDeleteMessages] True, if the administrator can delete messages of other users
  bool? canDeleteMessages;

  /// [canInviteUsers] True, if the administrator can invite new users to the chat
  bool? canInviteUsers;

  /// [canRestrictMembers] True, if the administrator can restrict, ban, or unban chat members; always true for channels
  bool? canRestrictMembers;

  /// [canPinMessages] True, if the administrator can pin messages; applicable to basic groups and supergroups only
  bool? canPinMessages;

  /// [canPromoteMembers] True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
  bool? canPromoteMembers;

  /// [canManageVideoChats] True, if the administrator can manage video chats
  bool? canManageVideoChats;

  /// [isAnonymous] True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  bool? isAnonymous;

  /// Parse from a json
  ChatMemberStatusAdministrator.fromJson(Map<String, dynamic> json)  {
    customTitle = json['custom_title'] == null ? null : json['custom_title'];
    canBeEdited = json['can_be_edited'] == null ? null : json['can_be_edited'];
    canManageChat = json['can_manage_chat'] == null ? null : json['can_manage_chat'];
    canChangeInfo = json['can_change_info'] == null ? null : json['can_change_info'];
    canPostMessages = json['can_post_messages'] == null ? null : json['can_post_messages'];
    canEditMessages = json['can_edit_messages'] == null ? null : json['can_edit_messages'];
    canDeleteMessages = json['can_delete_messages'] == null ? null : json['can_delete_messages'];
    canInviteUsers = json['can_invite_users'] == null ? null : json['can_invite_users'];
    canRestrictMembers = json['can_restrict_members'] == null ? null : json['can_restrict_members'];
    canPinMessages = json['can_pin_messages'] == null ? null : json['can_pin_messages'];
    canPromoteMembers = json['can_promote_members'] == null ? null : json['can_promote_members'];
    canManageVideoChats = json['can_manage_video_chats'] == null ? null : json['can_manage_video_chats'];
    isAnonymous = json['is_anonymous'] == null ? null : json['is_anonymous'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "custom_title": customTitle,
      "can_be_edited": canBeEdited,
      "can_manage_chat": canManageChat,
      "can_change_info": canChangeInfo,
      "can_post_messages": canPostMessages,
      "can_edit_messages": canEditMessages,
      "can_delete_messages": canDeleteMessages,
      "can_invite_users": canInviteUsers,
      "can_restrict_members": canRestrictMembers,
      "can_pin_messages": canPinMessages,
      "can_promote_members": canPromoteMembers,
      "can_manage_video_chats": canManageVideoChats,
      "is_anonymous": isAnonymous,
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusAdministrator';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusMember extends ChatMemberStatus {

  /// The user is a member of the chat, without any additional privileges or restrictions
  ChatMemberStatusMember();

  

  /// Parse from a json
  ChatMemberStatusMember.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusRestricted extends ChatMemberStatus {

  /// The user is under certain restrictions in the chat. Not supported in basic groups and channels
  ChatMemberStatusRestricted({this.isMember,
    this.restrictedUntilDate,
    this.permissions});

  /// [isMember] True, if the user is a member of the chat
  bool? isMember;

  /// [restrictedUntilDate] Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
  int? restrictedUntilDate;

  /// [permissions] User permissions in the chat
  ChatPermissions? permissions;

  /// Parse from a json
  ChatMemberStatusRestricted.fromJson(Map<String, dynamic> json)  {
    isMember = json['is_member'] == null ? null : json['is_member'];
    restrictedUntilDate = json['restricted_until_date'] == null ? null : json['restricted_until_date'];
    permissions = json['permissions'] == null ? null : ChatPermissions.fromJson(json['permissions'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_member": isMember,
      "restricted_until_date": restrictedUntilDate,
      "permissions": permissions == null ? null : permissions?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusRestricted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusLeft extends ChatMemberStatus {

  /// The user or the chat is not a chat member
  ChatMemberStatusLeft();

  

  /// Parse from a json
  ChatMemberStatusLeft.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusLeft';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatMemberStatusBanned extends ChatMemberStatus {

  /// The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat
  ChatMemberStatusBanned({this.bannedUntilDate});

  /// [bannedUntilDate] Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
  int? bannedUntilDate;

  /// Parse from a json
  ChatMemberStatusBanned.fromJson(Map<String, dynamic> json)  {
    bannedUntilDate = json['banned_until_date'] == null ? null : json['banned_until_date'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "banned_until_date": bannedUntilDate,
    };
  }

  static const CONSTRUCTOR = 'chatMemberStatusBanned';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}