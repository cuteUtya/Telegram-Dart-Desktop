part of '../tdapi.dart';

class Message extends TdObject {

  /// Describes a message
  Message({this.id,
    this.sender,
    this.chatId,
    this.sendingState,
    this.schedulingState,
    this.isOutgoing,
    this.isPinned,
    this.canBeEdited,
    this.canBeForwarded,
    this.canBeDeletedOnlyForSelf,
    this.canBeDeletedForAllUsers,
    this.canGetStatistics,
    this.canGetMessageThread,
    this.canGetViewers,
    this.canGetMediaTimestampLinks,
    this.hasTimestampedMedia,
    this.isChannelPost,
    this.containsUnreadMention,
    this.date,
    this.editDate,
    this.forwardInfo,
    this.interactionInfo,
    this.replyInChatId,
    this.replyToMessageId,
    this.messageThreadId,
    this.ttl,
    this.ttlExpiresIn,
    this.viaBotUserId,
    this.authorSignature,
    this.mediaAlbumId,
    this.restrictionReason,
    this.content,
    this.replyMarkup});

  /// [id] Message identifier; unique for the chat to which the message belongs
  int? id;

  /// [sender] The sender of the message
  MessageSender? sender;

  /// [chatId] Chat identifier
  int? chatId;

  /// [sendingState] Information about the sending state of the message; may be null
  MessageSendingState? sendingState;

  /// [schedulingState] Information about the scheduling state of the message; may be null
  MessageSchedulingState? schedulingState;

  /// [isOutgoing] True, if the message is outgoing
  bool? isOutgoing;

  /// [isPinned] True, if the message is pinned
  bool? isPinned;

  /// [canBeEdited] True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
  bool? canBeEdited;

  /// [canBeForwarded] True, if the message can be forwarded
  bool? canBeForwarded;

  /// [canBeDeletedOnlyForSelf] True, if the message can be deleted only for the current user while other users will continue to see it
  bool? canBeDeletedOnlyForSelf;

  /// [canBeDeletedForAllUsers] True, if the message can be deleted for all users
  bool? canBeDeletedForAllUsers;

  /// [canGetStatistics] True, if the message statistics are available
  bool? canGetStatistics;

  /// [canGetMessageThread] True, if the message thread info is available
  bool? canGetMessageThread;

  /// [canGetViewers] True, if chat members already viewed the message can be received through getMessageViewers
  bool? canGetViewers;

  /// [canGetMediaTimestampLinks] True, if media timestamp links can be generated for media timestamp entities in the message text, caption or web page description
  bool? canGetMediaTimestampLinks;

  /// [hasTimestampedMedia] True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
  bool? hasTimestampedMedia;

  /// [isChannelPost] True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
  bool? isChannelPost;

  /// [containsUnreadMention] True, if the message contains an unread mention for the current user
  bool? containsUnreadMention;

  /// [date] Point in time (Unix timestamp) when the message was sent
  int? date;

  /// [editDate] Point in time (Unix timestamp) when the message was last edited
  int? editDate;

  /// [forwardInfo] Information about the initial message sender; may be null
  MessageForwardInfo? forwardInfo;

  /// [interactionInfo] Information about interactions with the message; may be null
  MessageInteractionInfo? interactionInfo;

  /// [replyInChatId] If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
  int? replyInChatId;

  /// [replyToMessageId] If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
  int? replyToMessageId;

  /// [messageThreadId] If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
  int? messageThreadId;

  /// [ttl] For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
  int? ttl;

  /// [ttlExpiresIn] Time left before the message expires, in seconds. If the TTL timer isn't started yet, equals to the value of the ttl field
  double? ttlExpiresIn;

  /// [viaBotUserId] If non-zero, the user identifier of the bot through which this message was sent
  int? viaBotUserId;

  /// [authorSignature] For channel posts and anonymous group messages, optional author signature
  String? authorSignature;

  /// [mediaAlbumId] Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
  int? mediaAlbumId;

  /// [restrictionReason] If non-empty, contains a human-readable description of the reason why access to this message must be restricted
  String? restrictionReason;

  /// [content] Content of the message
  MessageContent? content;

  /// [replyMarkup] Reply markup for the message; may be null
  ReplyMarkup? replyMarkup;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Message.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    sender = MessageSender.fromJson(json['sender'] ?? <String, dynamic>{});
    chatId = json['chat_id'];
    sendingState = MessageSendingState.fromJson(json['sending_state'] ?? <String, dynamic>{});
    schedulingState = MessageSchedulingState.fromJson(json['scheduling_state'] ?? <String, dynamic>{});
    isOutgoing = json['is_outgoing'];
    isPinned = json['is_pinned'];
    canBeEdited = json['can_be_edited'];
    canBeForwarded = json['can_be_forwarded'];
    canBeDeletedOnlyForSelf = json['can_be_deleted_only_for_self'];
    canBeDeletedForAllUsers = json['can_be_deleted_for_all_users'];
    canGetStatistics = json['can_get_statistics'];
    canGetMessageThread = json['can_get_message_thread'];
    canGetViewers = json['can_get_viewers'];
    canGetMediaTimestampLinks = json['can_get_media_timestamp_links'];
    hasTimestampedMedia = json['has_timestamped_media'];
    isChannelPost = json['is_channel_post'];
    containsUnreadMention = json['contains_unread_mention'];
    date = json['date'];
    editDate = json['edit_date'];
    forwardInfo = MessageForwardInfo.fromJson(json['forward_info'] ?? <String, dynamic>{});
    interactionInfo = MessageInteractionInfo.fromJson(json['interaction_info'] ?? <String, dynamic>{});
    replyInChatId = json['reply_in_chat_id'];
    replyToMessageId = json['reply_to_message_id'];
    messageThreadId = json['message_thread_id'];
    ttl = json['ttl'];
    ttlExpiresIn = json['ttl_expires_in'];
    viaBotUserId = json['via_bot_user_id'];
    authorSignature = json['author_signature'];
    mediaAlbumId = int.tryParse(json['media_album_id'] ?? "");
    restrictionReason = json['restriction_reason'];
    content = MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
    replyMarkup = ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender": sender == null ? null : sender?.toJson(),
      "chat_id": chatId,
      "sending_state": sendingState == null ? null : sendingState?.toJson(),
      "scheduling_state": schedulingState == null ? null : schedulingState?.toJson(),
      "is_outgoing": isOutgoing,
      "is_pinned": isPinned,
      "can_be_edited": canBeEdited,
      "can_be_forwarded": canBeForwarded,
      "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
      "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
      "can_get_statistics": canGetStatistics,
      "can_get_message_thread": canGetMessageThread,
      "can_get_viewers": canGetViewers,
      "can_get_media_timestamp_links": canGetMediaTimestampLinks,
      "has_timestamped_media": hasTimestampedMedia,
      "is_channel_post": isChannelPost,
      "contains_unread_mention": containsUnreadMention,
      "date": date,
      "edit_date": editDate,
      "forward_info": forwardInfo == null ? null : forwardInfo?.toJson(),
      "interaction_info": interactionInfo == null ? null : interactionInfo?.toJson(),
      "reply_in_chat_id": replyInChatId,
      "reply_to_message_id": replyToMessageId,
      "message_thread_id": messageThreadId,
      "ttl": ttl,
      "ttl_expires_in": ttlExpiresIn,
      "via_bot_user_id": viaBotUserId,
      "author_signature": authorSignature,
      "media_album_id": mediaAlbumId,
      "restriction_reason": restrictionReason,
      "content": content == null ? null : content?.toJson(),
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'message';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}