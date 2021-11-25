part of '../tdapi.dart';

class Chat extends TdObject {

  /// A chat. (Can be a private chat, basic group, supergroup, or secret chat)
  Chat({this.id,
    this.type,
    this.title,
    this.photo,
    this.permissions,
    this.lastMessage,
    this.positions,
    this.isMarkedAsUnread,
    this.isBlocked,
    this.hasScheduledMessages,
    this.canBeDeletedOnlyForSelf,
    this.canBeDeletedForAllUsers,
    this.canBeReported,
    this.defaultDisableNotification,
    this.unreadCount,
    this.lastReadInboxMessageId,
    this.lastReadOutboxMessageId,
    this.unreadMentionCount,
    this.notificationSettings,
    this.messageTtlSetting,
    this.themeName,
    this.actionBar,
    this.videoChat,
    this.pendingJoinRequests,
    this.replyMarkupMessageId,
    this.draftMessage,
    this.clientData});

  /// [id] Chat unique identifier
  int? id;

  /// [type] Type of the chat
  ChatType? type;

  /// [title] Chat title
  String? title;

  /// [photo] Chat photo; may be null
  ChatPhotoInfo? photo;

  /// [permissions] Actions that non-administrator chat members are allowed to take in the chat
  ChatPermissions? permissions;

  /// [lastMessage] Last message in the chat; may be null
  Message? lastMessage;

  /// [positions] Positions of the chat in chat lists
  List<ChatPosition>? positions;

  /// [isMarkedAsUnread] True, if the chat is marked as unread
  bool? isMarkedAsUnread;

  /// [isBlocked] True, if the chat is blocked by the current user and private messages from the chat can't be received
  bool? isBlocked;

  /// [hasScheduledMessages] True, if the chat has scheduled messages
  bool? hasScheduledMessages;

  /// [canBeDeletedOnlyForSelf] True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
  bool? canBeDeletedOnlyForSelf;

  /// [canBeDeletedForAllUsers] True, if the chat messages can be deleted for all users
  bool? canBeDeletedForAllUsers;

  /// [canBeReported] True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
  bool? canBeReported;

  /// [defaultDisableNotification] Default value of the disable_notification parameter, used when a message is sent to the chat
  bool? defaultDisableNotification;

  /// [unreadCount] Number of unread messages in the chat
  int? unreadCount;

  /// [lastReadInboxMessageId] Identifier of the last read incoming message
  int? lastReadInboxMessageId;

  /// [lastReadOutboxMessageId] Identifier of the last read outgoing message
  int? lastReadOutboxMessageId;

  /// [unreadMentionCount] Number of unread messages with a mention/reply in the chat
  int? unreadMentionCount;

  /// [notificationSettings] Notification settings for this chat
  ChatNotificationSettings? notificationSettings;

  /// [messageTtlSetting] Current message Time To Live setting (self-destruct timer) for the chat; 0 if not defined. TTL is counted from the time message or its content is viewed in secret chats and from the send date in other chats
  int? messageTtlSetting;

  /// [themeName] If non-empty, name of a theme, set for the chat
  String? themeName;

  /// [actionBar] Information about actions which must be possible to do through the chat action bar; may be null
  ChatActionBar? actionBar;

  /// [videoChat] Information about video chat of the chat
  VideoChat? videoChat;

  /// [pendingJoinRequests] Information about pending join requests; may be null
  ChatJoinRequestsInfo? pendingJoinRequests;

  /// [replyMarkupMessageId] Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
  int? replyMarkupMessageId;

  /// [draftMessage] A draft of a message in the chat; may be null
  DraftMessage? draftMessage;

  /// [clientData] Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
  String? clientData;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Chat.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    ChatType? pre_type;
    try{
      pre_type=ChatType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    ChatPhotoInfo? pre_photo;
    try{
      pre_photo=ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    ChatPermissions? pre_permissions;
    try{
      pre_permissions=ChatPermissions.fromJson(json['permissions'] ?? <String, dynamic>{});
   }catch(_){}
    permissions = pre_permissions;
    Message? pre_lastMessage;
    try{
      pre_lastMessage=Message.fromJson(json['last_message'] ?? <String, dynamic>{});
   }catch(_){}
    lastMessage = pre_lastMessage;
    List<ChatPosition>? pre_positions;
    try{
      pre_positions=List<ChatPosition>.from((json['positions'] ?? [])!.map((item) => ChatPosition.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    positions = pre_positions;
    bool? pre_isMarkedAsUnread;
    try{
      pre_isMarkedAsUnread=json['is_marked_as_unread'];
   }catch(_){}
    isMarkedAsUnread = pre_isMarkedAsUnread;
    bool? pre_isBlocked;
    try{
      pre_isBlocked=json['is_blocked'];
   }catch(_){}
    isBlocked = pre_isBlocked;
    bool? pre_hasScheduledMessages;
    try{
      pre_hasScheduledMessages=json['has_scheduled_messages'];
   }catch(_){}
    hasScheduledMessages = pre_hasScheduledMessages;
    bool? pre_canBeDeletedOnlyForSelf;
    try{
      pre_canBeDeletedOnlyForSelf=json['can_be_deleted_only_for_self'];
   }catch(_){}
    canBeDeletedOnlyForSelf = pre_canBeDeletedOnlyForSelf;
    bool? pre_canBeDeletedForAllUsers;
    try{
      pre_canBeDeletedForAllUsers=json['can_be_deleted_for_all_users'];
   }catch(_){}
    canBeDeletedForAllUsers = pre_canBeDeletedForAllUsers;
    bool? pre_canBeReported;
    try{
      pre_canBeReported=json['can_be_reported'];
   }catch(_){}
    canBeReported = pre_canBeReported;
    bool? pre_defaultDisableNotification;
    try{
      pre_defaultDisableNotification=json['default_disable_notification'];
   }catch(_){}
    defaultDisableNotification = pre_defaultDisableNotification;
    int? pre_unreadCount;
    try{
      pre_unreadCount=json['unread_count'];
   }catch(_){}
    unreadCount = pre_unreadCount;
    int? pre_lastReadInboxMessageId;
    try{
      pre_lastReadInboxMessageId=json['last_read_inbox_message_id'];
   }catch(_){}
    lastReadInboxMessageId = pre_lastReadInboxMessageId;
    int? pre_lastReadOutboxMessageId;
    try{
      pre_lastReadOutboxMessageId=json['last_read_outbox_message_id'];
   }catch(_){}
    lastReadOutboxMessageId = pre_lastReadOutboxMessageId;
    int? pre_unreadMentionCount;
    try{
      pre_unreadMentionCount=json['unread_mention_count'];
   }catch(_){}
    unreadMentionCount = pre_unreadMentionCount;
    ChatNotificationSettings? pre_notificationSettings;
    try{
      pre_notificationSettings=ChatNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
   }catch(_){}
    notificationSettings = pre_notificationSettings;
    int? pre_messageTtlSetting;
    try{
      pre_messageTtlSetting=json['message_ttl_setting'];
   }catch(_){}
    messageTtlSetting = pre_messageTtlSetting;
    String? pre_themeName;
    try{
      pre_themeName=json['theme_name'];
   }catch(_){}
    themeName = pre_themeName;
    ChatActionBar? pre_actionBar;
    try{
      pre_actionBar=ChatActionBar.fromJson(json['action_bar'] ?? <String, dynamic>{});
   }catch(_){}
    actionBar = pre_actionBar;
    VideoChat? pre_videoChat;
    try{
      pre_videoChat=VideoChat.fromJson(json['video_chat'] ?? <String, dynamic>{});
   }catch(_){}
    videoChat = pre_videoChat;
    ChatJoinRequestsInfo? pre_pendingJoinRequests;
    try{
      pre_pendingJoinRequests=ChatJoinRequestsInfo.fromJson(json['pending_join_requests'] ?? <String, dynamic>{});
   }catch(_){}
    pendingJoinRequests = pre_pendingJoinRequests;
    int? pre_replyMarkupMessageId;
    try{
      pre_replyMarkupMessageId=json['reply_markup_message_id'];
   }catch(_){}
    replyMarkupMessageId = pre_replyMarkupMessageId;
    DraftMessage? pre_draftMessage;
    try{
      pre_draftMessage=DraftMessage.fromJson(json['draft_message'] ?? <String, dynamic>{});
   }catch(_){}
    draftMessage = pre_draftMessage;
    String? pre_clientData;
    try{
      pre_clientData=json['client_data'];
   }catch(_){}
    clientData = pre_clientData;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "type": type == null ? null : type?.toJson(),
      "title": title,
      "photo": photo == null ? null : photo?.toJson(),
      "permissions": permissions == null ? null : permissions?.toJson(),
      "last_message": lastMessage == null ? null : lastMessage?.toJson(),
      "positions": positions?.map((i) => i.toJson()).toList(),
      "is_marked_as_unread": isMarkedAsUnread,
      "is_blocked": isBlocked,
      "has_scheduled_messages": hasScheduledMessages,
      "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
      "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
      "can_be_reported": canBeReported,
      "default_disable_notification": defaultDisableNotification,
      "unread_count": unreadCount,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "unread_mention_count": unreadMentionCount,
      "notification_settings": notificationSettings == null ? null : notificationSettings?.toJson(),
      "message_ttl_setting": messageTtlSetting,
      "theme_name": themeName,
      "action_bar": actionBar == null ? null : actionBar?.toJson(),
      "video_chat": videoChat == null ? null : videoChat?.toJson(),
      "pending_join_requests": pendingJoinRequests == null ? null : pendingJoinRequests?.toJson(),
      "reply_markup_message_id": replyMarkupMessageId,
      "draft_message": draftMessage == null ? null : draftMessage?.toJson(),
      "client_data": clientData,
    };
  }

  static const CONSTRUCTOR = 'chat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}