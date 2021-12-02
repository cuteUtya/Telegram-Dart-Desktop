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
    id = json['id'] == null ? null : json['id'];
    type = json['type'] == null ? null : ChatType.fromJson(json['type'] ?? <String, dynamic>{});
    title = json['title'] == null ? null : json['title'];
    photo = json['photo'] == null ? null : ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
    permissions = json['permissions'] == null ? null : ChatPermissions.fromJson(json['permissions'] ?? <String, dynamic>{});
    lastMessage = json['last_message'] == null ? null : Message.fromJson(json['last_message'] ?? <String, dynamic>{});
    positions = json['positions'] == null ? null : List<ChatPosition>.from((json['positions'] ?? [])!.map((item) => ChatPosition.fromJson(item ?? <String, dynamic>{})).toList());
    isMarkedAsUnread = json['is_marked_as_unread'] == null ? null : json['is_marked_as_unread'];
    isBlocked = json['is_blocked'] == null ? null : json['is_blocked'];
    hasScheduledMessages = json['has_scheduled_messages'] == null ? null : json['has_scheduled_messages'];
    canBeDeletedOnlyForSelf = json['can_be_deleted_only_for_self'] == null ? null : json['can_be_deleted_only_for_self'];
    canBeDeletedForAllUsers = json['can_be_deleted_for_all_users'] == null ? null : json['can_be_deleted_for_all_users'];
    canBeReported = json['can_be_reported'] == null ? null : json['can_be_reported'];
    defaultDisableNotification = json['default_disable_notification'] == null ? null : json['default_disable_notification'];
    unreadCount = json['unread_count'] == null ? null : json['unread_count'];
    lastReadInboxMessageId = json['last_read_inbox_message_id'] == null ? null : json['last_read_inbox_message_id'];
    lastReadOutboxMessageId = json['last_read_outbox_message_id'] == null ? null : json['last_read_outbox_message_id'];
    unreadMentionCount = json['unread_mention_count'] == null ? null : json['unread_mention_count'];
    notificationSettings = json['notification_settings'] == null ? null : ChatNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
    messageTtlSetting = json['message_ttl_setting'] == null ? null : json['message_ttl_setting'];
    themeName = json['theme_name'] == null ? null : json['theme_name'];
    actionBar = json['action_bar'] == null ? null : ChatActionBar.fromJson(json['action_bar'] ?? <String, dynamic>{});
    videoChat = json['video_chat'] == null ? null : VideoChat.fromJson(json['video_chat'] ?? <String, dynamic>{});
    pendingJoinRequests = json['pending_join_requests'] == null ? null : ChatJoinRequestsInfo.fromJson(json['pending_join_requests'] ?? <String, dynamic>{});
    replyMarkupMessageId = json['reply_markup_message_id'] == null ? null : json['reply_markup_message_id'];
    draftMessage = json['draft_message'] == null ? null : DraftMessage.fromJson(json['draft_message'] ?? <String, dynamic>{});
    clientData = json['client_data'] == null ? null : json['client_data'];
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