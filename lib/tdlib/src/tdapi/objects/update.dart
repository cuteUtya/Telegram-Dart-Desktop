part of '../tdapi.dart';

class Update extends TdObject {

  /// Contains notifications about data changes
  Update();

  

  /// a Update return type can be :
  /// * UpdateAuthorizationState
  /// * UpdateNewMessage
  /// * UpdateMessageSendAcknowledged
  /// * UpdateMessageSendSucceeded
  /// * UpdateMessageSendFailed
  /// * UpdateMessageContent
  /// * UpdateMessageEdited
  /// * UpdateMessageIsPinned
  /// * UpdateMessageInteractionInfo
  /// * UpdateMessageContentOpened
  /// * UpdateMessageMentionRead
  /// * UpdateMessageLiveLocationViewed
  /// * UpdateNewChat
  /// * UpdateChatTitle
  /// * UpdateChatPhoto
  /// * UpdateChatPermissions
  /// * UpdateChatLastMessage
  /// * UpdateChatPosition
  /// * UpdateChatReadInbox
  /// * UpdateChatReadOutbox
  /// * UpdateChatActionBar
  /// * UpdateChatDraftMessage
  /// * UpdateChatMessageSender
  /// * UpdateChatMessageTtl
  /// * UpdateChatNotificationSettings
  /// * UpdateChatPendingJoinRequests
  /// * UpdateChatReplyMarkup
  /// * UpdateChatTheme
  /// * UpdateChatUnreadMentionCount
  /// * UpdateChatVideoChat
  /// * UpdateChatDefaultDisableNotification
  /// * UpdateChatHasProtectedContent
  /// * UpdateChatHasScheduledMessages
  /// * UpdateChatIsBlocked
  /// * UpdateChatIsMarkedAsUnread
  /// * UpdateChatFilters
  /// * UpdateChatOnlineMemberCount
  /// * UpdateScopeNotificationSettings
  /// * UpdateNotification
  /// * UpdateNotificationGroup
  /// * UpdateActiveNotifications
  /// * UpdateHavePendingNotifications
  /// * UpdateDeleteMessages
  /// * UpdateChatAction
  /// * UpdateUserStatus
  /// * UpdateUser
  /// * UpdateBasicGroup
  /// * UpdateSupergroup
  /// * UpdateSecretChat
  /// * UpdateUserFullInfo
  /// * UpdateBasicGroupFullInfo
  /// * UpdateSupergroupFullInfo
  /// * UpdateServiceNotification
  /// * UpdateFile
  /// * UpdateFileGenerationStart
  /// * UpdateFileGenerationStop
  /// * UpdateCall
  /// * UpdateGroupCall
  /// * UpdateGroupCallParticipant
  /// * UpdateNewCallSignalingData
  /// * UpdateUserPrivacySettingRules
  /// * UpdateUnreadMessageCount
  /// * UpdateUnreadChatCount
  /// * UpdateOption
  /// * UpdateStickerSet
  /// * UpdateInstalledStickerSets
  /// * UpdateTrendingStickerSets
  /// * UpdateRecentStickers
  /// * UpdateFavoriteStickers
  /// * UpdateSavedAnimations
  /// * UpdateSelectedBackground
  /// * UpdateChatThemes
  /// * UpdateLanguagePackStrings
  /// * UpdateConnectionState
  /// * UpdateTermsOfService
  /// * UpdateUsersNearby
  /// * UpdateDiceEmojis
  /// * UpdateAnimatedEmojiMessageClicked
  /// * UpdateAnimationSearchParameters
  /// * UpdateSuggestedActions
  /// * UpdateNewInlineQuery
  /// * UpdateNewChosenInlineResult
  /// * UpdateNewCallbackQuery
  /// * UpdateNewInlineCallbackQuery
  /// * UpdateNewShippingQuery
  /// * UpdateNewPreCheckoutQuery
  /// * UpdateNewCustomEvent
  /// * UpdateNewCustomQuery
  /// * UpdatePoll
  /// * UpdatePollAnswer
  /// * UpdateChatMember
  /// * UpdateNewChatJoinRequest
  factory Update.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case UpdateAuthorizationState.CONSTRUCTOR:
        return UpdateAuthorizationState.fromJson(json);
      case UpdateNewMessage.CONSTRUCTOR:
        return UpdateNewMessage.fromJson(json);
      case UpdateMessageSendAcknowledged.CONSTRUCTOR:
        return UpdateMessageSendAcknowledged.fromJson(json);
      case UpdateMessageSendSucceeded.CONSTRUCTOR:
        return UpdateMessageSendSucceeded.fromJson(json);
      case UpdateMessageSendFailed.CONSTRUCTOR:
        return UpdateMessageSendFailed.fromJson(json);
      case UpdateMessageContent.CONSTRUCTOR:
        return UpdateMessageContent.fromJson(json);
      case UpdateMessageEdited.CONSTRUCTOR:
        return UpdateMessageEdited.fromJson(json);
      case UpdateMessageIsPinned.CONSTRUCTOR:
        return UpdateMessageIsPinned.fromJson(json);
      case UpdateMessageInteractionInfo.CONSTRUCTOR:
        return UpdateMessageInteractionInfo.fromJson(json);
      case UpdateMessageContentOpened.CONSTRUCTOR:
        return UpdateMessageContentOpened.fromJson(json);
      case UpdateMessageMentionRead.CONSTRUCTOR:
        return UpdateMessageMentionRead.fromJson(json);
      case UpdateMessageLiveLocationViewed.CONSTRUCTOR:
        return UpdateMessageLiveLocationViewed.fromJson(json);
      case UpdateNewChat.CONSTRUCTOR:
        return UpdateNewChat.fromJson(json);
      case UpdateChatTitle.CONSTRUCTOR:
        return UpdateChatTitle.fromJson(json);
      case UpdateChatPhoto.CONSTRUCTOR:
        return UpdateChatPhoto.fromJson(json);
      case UpdateChatPermissions.CONSTRUCTOR:
        return UpdateChatPermissions.fromJson(json);
      case UpdateChatLastMessage.CONSTRUCTOR:
        return UpdateChatLastMessage.fromJson(json);
      case UpdateChatPosition.CONSTRUCTOR:
        return UpdateChatPosition.fromJson(json);
      case UpdateChatReadInbox.CONSTRUCTOR:
        return UpdateChatReadInbox.fromJson(json);
      case UpdateChatReadOutbox.CONSTRUCTOR:
        return UpdateChatReadOutbox.fromJson(json);
      case UpdateChatActionBar.CONSTRUCTOR:
        return UpdateChatActionBar.fromJson(json);
      case UpdateChatDraftMessage.CONSTRUCTOR:
        return UpdateChatDraftMessage.fromJson(json);
      case UpdateChatMessageSender.CONSTRUCTOR:
        return UpdateChatMessageSender.fromJson(json);
      case UpdateChatMessageTtl.CONSTRUCTOR:
        return UpdateChatMessageTtl.fromJson(json);
      case UpdateChatNotificationSettings.CONSTRUCTOR:
        return UpdateChatNotificationSettings.fromJson(json);
      case UpdateChatPendingJoinRequests.CONSTRUCTOR:
        return UpdateChatPendingJoinRequests.fromJson(json);
      case UpdateChatReplyMarkup.CONSTRUCTOR:
        return UpdateChatReplyMarkup.fromJson(json);
      case UpdateChatTheme.CONSTRUCTOR:
        return UpdateChatTheme.fromJson(json);
      case UpdateChatUnreadMentionCount.CONSTRUCTOR:
        return UpdateChatUnreadMentionCount.fromJson(json);
      case UpdateChatVideoChat.CONSTRUCTOR:
        return UpdateChatVideoChat.fromJson(json);
      case UpdateChatDefaultDisableNotification.CONSTRUCTOR:
        return UpdateChatDefaultDisableNotification.fromJson(json);
      case UpdateChatHasProtectedContent.CONSTRUCTOR:
        return UpdateChatHasProtectedContent.fromJson(json);
      case UpdateChatHasScheduledMessages.CONSTRUCTOR:
        return UpdateChatHasScheduledMessages.fromJson(json);
      case UpdateChatIsBlocked.CONSTRUCTOR:
        return UpdateChatIsBlocked.fromJson(json);
      case UpdateChatIsMarkedAsUnread.CONSTRUCTOR:
        return UpdateChatIsMarkedAsUnread.fromJson(json);
      case UpdateChatFilters.CONSTRUCTOR:
        return UpdateChatFilters.fromJson(json);
      case UpdateChatOnlineMemberCount.CONSTRUCTOR:
        return UpdateChatOnlineMemberCount.fromJson(json);
      case UpdateScopeNotificationSettings.CONSTRUCTOR:
        return UpdateScopeNotificationSettings.fromJson(json);
      case UpdateNotification.CONSTRUCTOR:
        return UpdateNotification.fromJson(json);
      case UpdateNotificationGroup.CONSTRUCTOR:
        return UpdateNotificationGroup.fromJson(json);
      case UpdateActiveNotifications.CONSTRUCTOR:
        return UpdateActiveNotifications.fromJson(json);
      case UpdateHavePendingNotifications.CONSTRUCTOR:
        return UpdateHavePendingNotifications.fromJson(json);
      case UpdateDeleteMessages.CONSTRUCTOR:
        return UpdateDeleteMessages.fromJson(json);
      case UpdateChatAction.CONSTRUCTOR:
        return UpdateChatAction.fromJson(json);
      case UpdateUserStatus.CONSTRUCTOR:
        return UpdateUserStatus.fromJson(json);
      case UpdateUser.CONSTRUCTOR:
        return UpdateUser.fromJson(json);
      case UpdateBasicGroup.CONSTRUCTOR:
        return UpdateBasicGroup.fromJson(json);
      case UpdateSupergroup.CONSTRUCTOR:
        return UpdateSupergroup.fromJson(json);
      case UpdateSecretChat.CONSTRUCTOR:
        return UpdateSecretChat.fromJson(json);
      case UpdateUserFullInfo.CONSTRUCTOR:
        return UpdateUserFullInfo.fromJson(json);
      case UpdateBasicGroupFullInfo.CONSTRUCTOR:
        return UpdateBasicGroupFullInfo.fromJson(json);
      case UpdateSupergroupFullInfo.CONSTRUCTOR:
        return UpdateSupergroupFullInfo.fromJson(json);
      case UpdateServiceNotification.CONSTRUCTOR:
        return UpdateServiceNotification.fromJson(json);
      case UpdateFile.CONSTRUCTOR:
        return UpdateFile.fromJson(json);
      case UpdateFileGenerationStart.CONSTRUCTOR:
        return UpdateFileGenerationStart.fromJson(json);
      case UpdateFileGenerationStop.CONSTRUCTOR:
        return UpdateFileGenerationStop.fromJson(json);
      case UpdateCall.CONSTRUCTOR:
        return UpdateCall.fromJson(json);
      case UpdateGroupCall.CONSTRUCTOR:
        return UpdateGroupCall.fromJson(json);
      case UpdateGroupCallParticipant.CONSTRUCTOR:
        return UpdateGroupCallParticipant.fromJson(json);
      case UpdateNewCallSignalingData.CONSTRUCTOR:
        return UpdateNewCallSignalingData.fromJson(json);
      case UpdateUserPrivacySettingRules.CONSTRUCTOR:
        return UpdateUserPrivacySettingRules.fromJson(json);
      case UpdateUnreadMessageCount.CONSTRUCTOR:
        return UpdateUnreadMessageCount.fromJson(json);
      case UpdateUnreadChatCount.CONSTRUCTOR:
        return UpdateUnreadChatCount.fromJson(json);
      case UpdateOption.CONSTRUCTOR:
        return UpdateOption.fromJson(json);
      case UpdateStickerSet.CONSTRUCTOR:
        return UpdateStickerSet.fromJson(json);
      case UpdateInstalledStickerSets.CONSTRUCTOR:
        return UpdateInstalledStickerSets.fromJson(json);
      case UpdateTrendingStickerSets.CONSTRUCTOR:
        return UpdateTrendingStickerSets.fromJson(json);
      case UpdateRecentStickers.CONSTRUCTOR:
        return UpdateRecentStickers.fromJson(json);
      case UpdateFavoriteStickers.CONSTRUCTOR:
        return UpdateFavoriteStickers.fromJson(json);
      case UpdateSavedAnimations.CONSTRUCTOR:
        return UpdateSavedAnimations.fromJson(json);
      case UpdateSelectedBackground.CONSTRUCTOR:
        return UpdateSelectedBackground.fromJson(json);
      case UpdateChatThemes.CONSTRUCTOR:
        return UpdateChatThemes.fromJson(json);
      case UpdateLanguagePackStrings.CONSTRUCTOR:
        return UpdateLanguagePackStrings.fromJson(json);
      case UpdateConnectionState.CONSTRUCTOR:
        return UpdateConnectionState.fromJson(json);
      case UpdateTermsOfService.CONSTRUCTOR:
        return UpdateTermsOfService.fromJson(json);
      case UpdateUsersNearby.CONSTRUCTOR:
        return UpdateUsersNearby.fromJson(json);
      case UpdateDiceEmojis.CONSTRUCTOR:
        return UpdateDiceEmojis.fromJson(json);
      case UpdateAnimatedEmojiMessageClicked.CONSTRUCTOR:
        return UpdateAnimatedEmojiMessageClicked.fromJson(json);
      case UpdateAnimationSearchParameters.CONSTRUCTOR:
        return UpdateAnimationSearchParameters.fromJson(json);
      case UpdateSuggestedActions.CONSTRUCTOR:
        return UpdateSuggestedActions.fromJson(json);
      case UpdateNewInlineQuery.CONSTRUCTOR:
        return UpdateNewInlineQuery.fromJson(json);
      case UpdateNewChosenInlineResult.CONSTRUCTOR:
        return UpdateNewChosenInlineResult.fromJson(json);
      case UpdateNewCallbackQuery.CONSTRUCTOR:
        return UpdateNewCallbackQuery.fromJson(json);
      case UpdateNewInlineCallbackQuery.CONSTRUCTOR:
        return UpdateNewInlineCallbackQuery.fromJson(json);
      case UpdateNewShippingQuery.CONSTRUCTOR:
        return UpdateNewShippingQuery.fromJson(json);
      case UpdateNewPreCheckoutQuery.CONSTRUCTOR:
        return UpdateNewPreCheckoutQuery.fromJson(json);
      case UpdateNewCustomEvent.CONSTRUCTOR:
        return UpdateNewCustomEvent.fromJson(json);
      case UpdateNewCustomQuery.CONSTRUCTOR:
        return UpdateNewCustomQuery.fromJson(json);
      case UpdatePoll.CONSTRUCTOR:
        return UpdatePoll.fromJson(json);
      case UpdatePollAnswer.CONSTRUCTOR:
        return UpdatePollAnswer.fromJson(json);
      case UpdateChatMember.CONSTRUCTOR:
        return UpdateChatMember.fromJson(json);
      case UpdateNewChatJoinRequest.CONSTRUCTOR:
        return UpdateNewChatJoinRequest.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'update';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateAuthorizationState extends Update {

  /// The user authorization state has changed
  UpdateAuthorizationState({this.authorizationState});

  /// [authorizationState] New authorization state
  AuthorizationState? authorizationState;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateAuthorizationState.fromJson(Map<String, dynamic> json)  {
    authorizationState = json['authorization_state'] == null ? null : AuthorizationState.fromJson(json['authorization_state'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "authorization_state": authorizationState == null ? null : authorizationState?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateAuthorizationState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewMessage extends Update {

  /// A new message was received; can also be an outgoing message
  UpdateNewMessage({this.message});

  /// [message] The new message
  Message? message;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewMessage.fromJson(Map<String, dynamic> json)  {
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageSendAcknowledged extends Update {

  /// A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed. This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
  UpdateMessageSendAcknowledged({this.chatId,
    this.messageId});

  /// [chatId] The chat identifier of the sent message
  int? chatId;

  /// [messageId] A temporary message identifier
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageSendAcknowledged.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  static const CONSTRUCTOR = 'updateMessageSendAcknowledged';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageSendSucceeded extends Update {

  /// A message has been successfully sent
  UpdateMessageSendSucceeded({this.message,
    this.oldMessageId});

  /// [message] The sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change 
  Message? message;

  /// [oldMessageId] The previous temporary message identifier
  int? oldMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageSendSucceeded.fromJson(Map<String, dynamic> json)  {
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
    oldMessageId = json['old_message_id'] == null ? null : json['old_message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
      "old_message_id": oldMessageId,
    };
  }

  static const CONSTRUCTOR = 'updateMessageSendSucceeded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageSendFailed extends Update {

  /// A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
  UpdateMessageSendFailed({this.message,
    this.oldMessageId,
    this.errorCode,
    this.errorMessage});

  /// [message] The failed to send message
  Message? message;

  /// [oldMessageId] The previous temporary message identifier 
  int? oldMessageId;

  /// [errorCode] An error code 
  int? errorCode;

  /// [errorMessage] Error message
  String? errorMessage;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageSendFailed.fromJson(Map<String, dynamic> json)  {
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
    oldMessageId = json['old_message_id'] == null ? null : json['old_message_id'];
    errorCode = json['error_code'] == null ? null : json['error_code'];
    errorMessage = json['error_message'] == null ? null : json['error_message'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message": message == null ? null : message?.toJson(),
      "old_message_id": oldMessageId,
      "error_code": errorCode,
      "error_message": errorMessage,
    };
  }

  static const CONSTRUCTOR = 'updateMessageSendFailed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageContent extends Update {

  /// The message content has changed
  UpdateMessageContent({this.chatId,
    this.messageId,
    this.newContent});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [newContent] New message content
  MessageContent? newContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageContent.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    newContent = json['new_content'] == null ? null : MessageContent.fromJson(json['new_content'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "new_content": newContent == null ? null : newContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateMessageContent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageEdited extends Update {

  /// A message was edited. Changes in the message content will come in a separate updateMessageContent
  UpdateMessageEdited({this.chatId,
    this.messageId,
    this.editDate,
    this.replyMarkup});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [editDate] Point in time (Unix timestamp) when the message was edited 
  int? editDate;

  /// [replyMarkup] New message reply markup; may be null
  ReplyMarkup? replyMarkup;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageEdited.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    editDate = json['edit_date'] == null ? null : json['edit_date'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "edit_date": editDate,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateMessageEdited';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageIsPinned extends Update {

  /// The message pinned state was changed
  UpdateMessageIsPinned({this.chatId,
    this.messageId,
    this.isPinned});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] The message identifier 
  int? messageId;

  /// [isPinned] True, if the message is pinned
  bool? isPinned;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageIsPinned.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    isPinned = json['is_pinned'] == null ? null : json['is_pinned'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "is_pinned": isPinned,
    };
  }

  static const CONSTRUCTOR = 'updateMessageIsPinned';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageInteractionInfo extends Update {

  /// The information about interactions with a message has changed
  UpdateMessageInteractionInfo({this.chatId,
    this.messageId,
    this.interactionInfo});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [interactionInfo] New information about interactions with the message; may be null
  MessageInteractionInfo? interactionInfo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageInteractionInfo.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    interactionInfo = json['interaction_info'] == null ? null : MessageInteractionInfo.fromJson(json['interaction_info'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "interaction_info": interactionInfo == null ? null : interactionInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateMessageInteractionInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageContentOpened extends Update {

  /// The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the TTL timer for self-destructing messages
  UpdateMessageContentOpened({this.chatId,
    this.messageId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageContentOpened.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  static const CONSTRUCTOR = 'updateMessageContentOpened';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageMentionRead extends Update {

  /// A message with an unread mention was read
  UpdateMessageMentionRead({this.chatId,
    this.messageId,
    this.unreadMentionCount});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [unreadMentionCount] The new number of unread mention messages left in the chat
  int? unreadMentionCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageMentionRead.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    unreadMentionCount = json['unread_mention_count'] == null ? null : json['unread_mention_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "unread_mention_count": unreadMentionCount,
    };
  }

  static const CONSTRUCTOR = 'updateMessageMentionRead';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateMessageLiveLocationViewed extends Update {

  /// A message with a live location was viewed. When the update is received, the application is supposed to update the live location
  UpdateMessageLiveLocationViewed({this.chatId,
    this.messageId});

  /// [chatId] Identifier of the chat with the live location message
  int? chatId;

  /// [messageId] Identifier of the message with live location
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateMessageLiveLocationViewed.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  static const CONSTRUCTOR = 'updateMessageLiveLocationViewed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewChat extends Update {

  /// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
  UpdateNewChat({this.chat});

  /// [chat] The chat
  Chat? chat;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewChat.fromJson(Map<String, dynamic> json)  {
    chat = json['chat'] == null ? null : Chat.fromJson(json['chat'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat": chat == null ? null : chat?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatTitle extends Update {

  /// The title of a chat was changed
  UpdateChatTitle({this.chatId,
    this.title});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [title] The new chat title
  String? title;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatTitle.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    title = json['title'] == null ? null : json['title'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'updateChatTitle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatPhoto extends Update {

  /// A chat photo was changed
  UpdateChatPhoto({this.chatId,
    this.photo});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [photo] The new chat photo; may be null
  ChatPhotoInfo? photo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatPhoto.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    photo = json['photo'] == null ? null : ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "photo": photo == null ? null : photo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatPermissions extends Update {

  /// Chat permissions was changed
  UpdateChatPermissions({this.chatId,
    this.permissions});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [permissions] The new chat permissions
  ChatPermissions? permissions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatPermissions.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    permissions = json['permissions'] == null ? null : ChatPermissions.fromJson(json['permissions'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "permissions": permissions == null ? null : permissions?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatPermissions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatLastMessage extends Update {

  /// The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
  UpdateChatLastMessage({this.chatId,
    this.lastMessage,
    this.positions});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [lastMessage] The new last message in the chat; may be null 
  Message? lastMessage;

  /// [positions] The new chat positions in the chat lists
  List<ChatPosition>? positions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatLastMessage.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    lastMessage = json['last_message'] == null ? null : Message.fromJson(json['last_message'] ?? <String, dynamic>{});
    positions = json['positions'] == null ? null : List<ChatPosition>.from((json['positions'] ?? [])!.map((item) => ChatPosition.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "last_message": lastMessage == null ? null : lastMessage?.toJson(),
      "positions": positions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateChatLastMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatPosition extends Update {

  /// The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent
  UpdateChatPosition({this.chatId,
    this.position});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [position] New chat position. If new order is 0, then the chat needs to be removed from the list
  ChatPosition? position;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatPosition.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    position = json['position'] == null ? null : ChatPosition.fromJson(json['position'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "position": position == null ? null : position?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatPosition';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatReadInbox extends Update {

  /// Incoming messages were read or the number of unread messages has been changed
  UpdateChatReadInbox({this.chatId,
    this.lastReadInboxMessageId,
    this.unreadCount});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [lastReadInboxMessageId] Identifier of the last read incoming message 
  int? lastReadInboxMessageId;

  /// [unreadCount] The number of unread messages left in the chat
  int? unreadCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatReadInbox.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    lastReadInboxMessageId = json['last_read_inbox_message_id'] == null ? null : json['last_read_inbox_message_id'];
    unreadCount = json['unread_count'] == null ? null : json['unread_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "unread_count": unreadCount,
    };
  }

  static const CONSTRUCTOR = 'updateChatReadInbox';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatReadOutbox extends Update {

  /// Outgoing messages were read
  UpdateChatReadOutbox({this.chatId,
    this.lastReadOutboxMessageId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [lastReadOutboxMessageId] Identifier of last read outgoing message
  int? lastReadOutboxMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatReadOutbox.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    lastReadOutboxMessageId = json['last_read_outbox_message_id'] == null ? null : json['last_read_outbox_message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
    };
  }

  static const CONSTRUCTOR = 'updateChatReadOutbox';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatActionBar extends Update {

  /// The chat action bar was changed
  UpdateChatActionBar({this.chatId,
    this.actionBar});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [actionBar] The new value of the action bar; may be null
  ChatActionBar? actionBar;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatActionBar.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    actionBar = json['action_bar'] == null ? null : ChatActionBar.fromJson(json['action_bar'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "action_bar": actionBar == null ? null : actionBar?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatActionBar';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatDraftMessage extends Update {

  /// A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied
  UpdateChatDraftMessage({this.chatId,
    this.draftMessage,
    this.positions});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [draftMessage] The new draft message; may be null 
  DraftMessage? draftMessage;

  /// [positions] The new chat positions in the chat lists
  List<ChatPosition>? positions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatDraftMessage.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    draftMessage = json['draft_message'] == null ? null : DraftMessage.fromJson(json['draft_message'] ?? <String, dynamic>{});
    positions = json['positions'] == null ? null : List<ChatPosition>.from((json['positions'] ?? [])!.map((item) => ChatPosition.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "draft_message": draftMessage == null ? null : draftMessage?.toJson(),
      "positions": positions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateChatDraftMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatMessageSender extends Update {

  /// The message sender that is selected to send messages in a chat has changed
  UpdateChatMessageSender({this.chatId,
    this.messageSenderId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageSenderId] New value of message_sender_id; may be null if the user can't change message sender
  MessageSender? messageSenderId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatMessageSender.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageSenderId = json['message_sender_id'] == null ? null : MessageSender.fromJson(json['message_sender_id'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_sender_id": messageSenderId == null ? null : messageSenderId?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatMessageSender';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatMessageTtl extends Update {

  /// The message Time To Live setting for a chat was changed
  UpdateChatMessageTtl({this.chatId,
    this.messageTtl});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageTtl] New value of message_ttl
  int? messageTtl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatMessageTtl.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageTtl = json['message_ttl'] == null ? null : json['message_ttl'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_ttl": messageTtl,
    };
  }

  static const CONSTRUCTOR = 'updateChatMessageTtl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatNotificationSettings extends Update {

  /// Notification settings for a chat were changed
  UpdateChatNotificationSettings({this.chatId,
    this.notificationSettings});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [notificationSettings] The new notification settings
  ChatNotificationSettings? notificationSettings;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatNotificationSettings.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    notificationSettings = json['notification_settings'] == null ? null : ChatNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "notification_settings": notificationSettings == null ? null : notificationSettings?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatNotificationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatPendingJoinRequests extends Update {

  /// The chat pending join requests were changed
  UpdateChatPendingJoinRequests({this.chatId,
    this.pendingJoinRequests});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [pendingJoinRequests] The new data about pending join requests; may be null
  ChatJoinRequestsInfo? pendingJoinRequests;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatPendingJoinRequests.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    pendingJoinRequests = json['pending_join_requests'] == null ? null : ChatJoinRequestsInfo.fromJson(json['pending_join_requests'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "pending_join_requests": pendingJoinRequests == null ? null : pendingJoinRequests?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatPendingJoinRequests';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatReplyMarkup extends Update {

  /// The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
  UpdateChatReplyMarkup({this.chatId,
    this.replyMarkupMessageId});

  /// [chatId] Chat identifier
  int? chatId;

  /// [replyMarkupMessageId] Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
  int? replyMarkupMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatReplyMarkup.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    replyMarkupMessageId = json['reply_markup_message_id'] == null ? null : json['reply_markup_message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "reply_markup_message_id": replyMarkupMessageId,
    };
  }

  static const CONSTRUCTOR = 'updateChatReplyMarkup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatTheme extends Update {

  /// The chat theme was changed
  UpdateChatTheme({this.chatId,
    this.themeName});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [themeName] The new name of the chat theme; may be empty if theme was reset to default
  String? themeName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatTheme.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    themeName = json['theme_name'] == null ? null : json['theme_name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "theme_name": themeName,
    };
  }

  static const CONSTRUCTOR = 'updateChatTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatUnreadMentionCount extends Update {

  /// The chat unread_mention_count has changed
  UpdateChatUnreadMentionCount({this.chatId,
    this.unreadMentionCount});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [unreadMentionCount] The number of unread mention messages left in the chat
  int? unreadMentionCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatUnreadMentionCount.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    unreadMentionCount = json['unread_mention_count'] == null ? null : json['unread_mention_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "unread_mention_count": unreadMentionCount,
    };
  }

  static const CONSTRUCTOR = 'updateChatUnreadMentionCount';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatVideoChat extends Update {

  /// A chat video chat state has changed
  UpdateChatVideoChat({this.chatId,
    this.videoChat});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [videoChat] New value of video_chat
  VideoChat? videoChat;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatVideoChat.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    videoChat = json['video_chat'] == null ? null : VideoChat.fromJson(json['video_chat'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "video_chat": videoChat == null ? null : videoChat?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatVideoChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatDefaultDisableNotification extends Update {

  /// The value of the default disable_notification parameter, used when a message is sent to the chat, was changed
  UpdateChatDefaultDisableNotification({this.chatId,
    this.defaultDisableNotification});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [defaultDisableNotification] The new default_disable_notification value
  bool? defaultDisableNotification;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatDefaultDisableNotification.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    defaultDisableNotification = json['default_disable_notification'] == null ? null : json['default_disable_notification'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "default_disable_notification": defaultDisableNotification,
    };
  }

  static const CONSTRUCTOR = 'updateChatDefaultDisableNotification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatHasProtectedContent extends Update {

  /// A chat content was allowed or restricted for saving
  UpdateChatHasProtectedContent({this.chatId,
    this.hasProtectedContent});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [hasProtectedContent] New value of has_protected_content
  bool? hasProtectedContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatHasProtectedContent.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    hasProtectedContent = json['has_protected_content'] == null ? null : json['has_protected_content'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "has_protected_content": hasProtectedContent,
    };
  }

  static const CONSTRUCTOR = 'updateChatHasProtectedContent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatHasScheduledMessages extends Update {

  /// A chat's has_scheduled_messages field has changed
  UpdateChatHasScheduledMessages({this.chatId,
    this.hasScheduledMessages});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [hasScheduledMessages] New value of has_scheduled_messages
  bool? hasScheduledMessages;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatHasScheduledMessages.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    hasScheduledMessages = json['has_scheduled_messages'] == null ? null : json['has_scheduled_messages'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "has_scheduled_messages": hasScheduledMessages,
    };
  }

  static const CONSTRUCTOR = 'updateChatHasScheduledMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatIsBlocked extends Update {

  /// A chat was blocked or unblocked
  UpdateChatIsBlocked({this.chatId,
    this.isBlocked});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [isBlocked] New value of is_blocked
  bool? isBlocked;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatIsBlocked.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    isBlocked = json['is_blocked'] == null ? null : json['is_blocked'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "is_blocked": isBlocked,
    };
  }

  static const CONSTRUCTOR = 'updateChatIsBlocked';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatIsMarkedAsUnread extends Update {

  /// A chat was marked as unread or was read
  UpdateChatIsMarkedAsUnread({this.chatId,
    this.isMarkedAsUnread});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [isMarkedAsUnread] New value of is_marked_as_unread
  bool? isMarkedAsUnread;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatIsMarkedAsUnread.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    isMarkedAsUnread = json['is_marked_as_unread'] == null ? null : json['is_marked_as_unread'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "is_marked_as_unread": isMarkedAsUnread,
    };
  }

  static const CONSTRUCTOR = 'updateChatIsMarkedAsUnread';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatFilters extends Update {

  /// The list of chat filters or a chat filter has changed
  UpdateChatFilters({this.chatFilters});

  /// [chatFilters] The new list of chat filters
  List<ChatFilterInfo>? chatFilters;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatFilters.fromJson(Map<String, dynamic> json)  {
    chatFilters = json['chat_filters'] == null ? null : List<ChatFilterInfo>.from((json['chat_filters'] ?? [])!.map((item) => ChatFilterInfo.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_filters": chatFilters?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateChatFilters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatOnlineMemberCount extends Update {

  /// The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed
  UpdateChatOnlineMemberCount({this.chatId,
    this.onlineMemberCount});

  /// [chatId] Identifier of the chat 
  int? chatId;

  /// [onlineMemberCount] New number of online members in the chat, or 0 if unknown
  int? onlineMemberCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatOnlineMemberCount.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    onlineMemberCount = json['online_member_count'] == null ? null : json['online_member_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "online_member_count": onlineMemberCount,
    };
  }

  static const CONSTRUCTOR = 'updateChatOnlineMemberCount';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateScopeNotificationSettings extends Update {

  /// Notification settings for some type of chats were updated
  UpdateScopeNotificationSettings({this.scope,
    this.notificationSettings});

  /// [scope] Types of chats for which notification settings were updated 
  NotificationSettingsScope? scope;

  /// [notificationSettings] The new notification settings
  ScopeNotificationSettings? notificationSettings;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateScopeNotificationSettings.fromJson(Map<String, dynamic> json)  {
    scope = json['scope'] == null ? null : NotificationSettingsScope.fromJson(json['scope'] ?? <String, dynamic>{});
    notificationSettings = json['notification_settings'] == null ? null : ScopeNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "scope": scope == null ? null : scope?.toJson(),
      "notification_settings": notificationSettings == null ? null : notificationSettings?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateScopeNotificationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNotification extends Update {

  /// A notification was changed
  UpdateNotification({this.notificationGroupId,
    this.notification});

  /// [notificationGroupId] Unique notification group identifier 
  int? notificationGroupId;

  /// [notification] Changed notification
  Notification? notification;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNotification.fromJson(Map<String, dynamic> json)  {
    notificationGroupId = json['notification_group_id'] == null ? null : json['notification_group_id'];
    notification = json['notification'] == null ? null : Notification.fromJson(json['notification'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "notification_group_id": notificationGroupId,
      "notification": notification == null ? null : notification?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNotification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNotificationGroup extends Update {

  /// A list of active notifications in a notification group has changed
  UpdateNotificationGroup({this.notificationGroupId,
    this.type,
    this.chatId,
    this.notificationSettingsChatId,
    this.isSilent,
    this.totalCount,
    this.addedNotifications,
    this.removedNotificationIds});

  /// [notificationGroupId] Unique notification group identifier
  int? notificationGroupId;

  /// [type] New type of the notification group
  NotificationGroupType? type;

  /// [chatId] Identifier of a chat to which all notifications in the group belong
  int? chatId;

  /// [notificationSettingsChatId] Chat identifier, which notification settings must be applied to the added notifications
  int? notificationSettingsChatId;

  /// [isSilent] True, if the notifications must be shown without sound
  bool? isSilent;

  /// [totalCount] Total number of unread notifications in the group, can be bigger than number of active notifications
  int? totalCount;

  /// [addedNotifications] List of added group notifications, sorted by notification updateNotificationGroup
  List<Notification>? addedNotifications;

  /// [removedNotificationIds] Identifiers of removed group notifications, sorted by notification updateNotificationGroup
  List<int>? removedNotificationIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNotificationGroup.fromJson(Map<String, dynamic> json)  {
    notificationGroupId = json['notification_group_id'] == null ? null : json['notification_group_id'];
    type = json['type'] == null ? null : NotificationGroupType.fromJson(json['type'] ?? <String, dynamic>{});
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    notificationSettingsChatId = json['notification_settings_chat_id'] == null ? null : json['notification_settings_chat_id'];
    isSilent = json['is_silent'] == null ? null : json['is_silent'];
    totalCount = json['total_count'] == null ? null : json['total_count'];
    addedNotifications = json['added_notifications'] == null ? null : List<Notification>.from((json['added_notifications'] ?? [])!.map((item) => Notification.fromJson(item ?? <String, dynamic>{})).toList());
    removedNotificationIds = json['removed_notification_ids'] == null ? null : List<int>.from((json['removed_notification_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "notification_group_id": notificationGroupId,
      "type": type == null ? null : type?.toJson(),
      "chat_id": chatId,
      "notification_settings_chat_id": notificationSettingsChatId,
      "is_silent": isSilent,
      "total_count": totalCount,
      "added_notifications": addedNotifications?.map((i) => i.toJson()).toList(),
      "removed_notification_ids": removedNotificationIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateNotificationGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateActiveNotifications extends Update {

  /// Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update
  UpdateActiveNotifications({this.groups});

  /// [groups] Lists of active notification groups
  List<NotificationGroup>? groups;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateActiveNotifications.fromJson(Map<String, dynamic> json)  {
    groups = json['groups'] == null ? null : List<NotificationGroup>.from((json['groups'] ?? [])!.map((item) => NotificationGroup.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "groups": groups?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateActiveNotifications';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateHavePendingNotifications extends Update {

  /// Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
  UpdateHavePendingNotifications({this.haveDelayedNotifications,
    this.haveUnreceivedNotifications});

  /// [haveDelayedNotifications] True, if there are some delayed notification updates, which will be sent soon
  bool? haveDelayedNotifications;

  /// [haveUnreceivedNotifications] True, if there can be some yet unreceived notifications, which are being fetched from the server
  bool? haveUnreceivedNotifications;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateHavePendingNotifications.fromJson(Map<String, dynamic> json)  {
    haveDelayedNotifications = json['have_delayed_notifications'] == null ? null : json['have_delayed_notifications'];
    haveUnreceivedNotifications = json['have_unreceived_notifications'] == null ? null : json['have_unreceived_notifications'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "have_delayed_notifications": haveDelayedNotifications,
      "have_unreceived_notifications": haveUnreceivedNotifications,
    };
  }

  static const CONSTRUCTOR = 'updateHavePendingNotifications';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateDeleteMessages extends Update {

  /// Some messages were deleted
  UpdateDeleteMessages({this.chatId,
    this.messageIds,
    this.isPermanent,
    this.fromCache});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageIds] Identifiers of the deleted messages
  List<int>? messageIds;

  /// [isPermanent] True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
  bool? isPermanent;

  /// [fromCache] True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
  bool? fromCache;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateDeleteMessages.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageIds = json['message_ids'] == null ? null : List<int>.from((json['message_ids'] ?? [])!.map((item) => item).toList());
    isPermanent = json['is_permanent'] == null ? null : json['is_permanent'];
    fromCache = json['from_cache'] == null ? null : json['from_cache'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_ids": messageIds?.map((i) => i).toList(),
      "is_permanent": isPermanent,
      "from_cache": fromCache,
    };
  }

  static const CONSTRUCTOR = 'updateDeleteMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatAction extends Update {

  /// A message sender activity in the chat has changed
  UpdateChatAction({this.chatId,
    this.messageThreadId,
    this.senderId,
    this.action});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the action was performed 
  int? messageThreadId;

  /// [senderId] Identifier of a message sender performing the action 
  MessageSender? senderId;

  /// [action] The action
  ChatAction? action;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatAction.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageThreadId = json['message_thread_id'] == null ? null : json['message_thread_id'];
    senderId = json['sender_id'] == null ? null : MessageSender.fromJson(json['sender_id'] ?? <String, dynamic>{});
    action = json['action'] == null ? null : ChatAction.fromJson(json['action'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "sender_id": senderId == null ? null : senderId?.toJson(),
      "action": action == null ? null : action?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatAction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUserStatus extends Update {

  /// The user went online or offline
  UpdateUserStatus({this.userId,
    this.status});

  /// [userId] User identifier 
  int? userId;

  /// [status] New status of the user
  UserStatus? status;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUserStatus.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'] == null ? null : json['user_id'];
    status = json['status'] == null ? null : UserStatus.fromJson(json['status'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "status": status == null ? null : status?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateUserStatus';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUser extends Update {

  /// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
  UpdateUser({this.user});

  /// [user] New data about the user
  User? user;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUser.fromJson(Map<String, dynamic> json)  {
    user = json['user'] == null ? null : User.fromJson(json['user'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user": user == null ? null : user?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateUser';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateBasicGroup extends Update {

  /// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
  UpdateBasicGroup({this.basicGroup});

  /// [basicGroup] New data about the group
  BasicGroup? basicGroup;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateBasicGroup.fromJson(Map<String, dynamic> json)  {
    basicGroup = json['basic_group'] == null ? null : BasicGroup.fromJson(json['basic_group'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "basic_group": basicGroup == null ? null : basicGroup?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateBasicGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSupergroup extends Update {

  /// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
  UpdateSupergroup({this.supergroup});

  /// [supergroup] New data about the supergroup
  Supergroup? supergroup;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSupergroup.fromJson(Map<String, dynamic> json)  {
    supergroup = json['supergroup'] == null ? null : Supergroup.fromJson(json['supergroup'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup": supergroup == null ? null : supergroup?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateSupergroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSecretChat extends Update {

  /// Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application
  UpdateSecretChat({this.secretChat});

  /// [secretChat] New data about the secret chat
  SecretChat? secretChat;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSecretChat.fromJson(Map<String, dynamic> json)  {
    secretChat = json['secret_chat'] == null ? null : SecretChat.fromJson(json['secret_chat'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "secret_chat": secretChat == null ? null : secretChat?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateSecretChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUserFullInfo extends Update {

  /// Some data in userFullInfo has been changed
  UpdateUserFullInfo({this.userId,
    this.userFullInfo});

  /// [userId] User identifier 
  int? userId;

  /// [userFullInfo] New full information about the user
  UserFullInfo? userFullInfo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUserFullInfo.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'] == null ? null : json['user_id'];
    userFullInfo = json['user_full_info'] == null ? null : UserFullInfo.fromJson(json['user_full_info'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "user_full_info": userFullInfo == null ? null : userFullInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateUserFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateBasicGroupFullInfo extends Update {

  /// Some data in basicGroupFullInfo has been changed
  UpdateBasicGroupFullInfo({this.basicGroupId,
    this.basicGroupFullInfo});

  /// [basicGroupId] Identifier of a basic group 
  int? basicGroupId;

  /// [basicGroupFullInfo] New full information about the group
  BasicGroupFullInfo? basicGroupFullInfo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateBasicGroupFullInfo.fromJson(Map<String, dynamic> json)  {
    basicGroupId = json['basic_group_id'] == null ? null : json['basic_group_id'];
    basicGroupFullInfo = json['basic_group_full_info'] == null ? null : BasicGroupFullInfo.fromJson(json['basic_group_full_info'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "basic_group_id": basicGroupId,
      "basic_group_full_info": basicGroupFullInfo == null ? null : basicGroupFullInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateBasicGroupFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSupergroupFullInfo extends Update {

  /// Some data in supergroupFullInfo has been changed
  UpdateSupergroupFullInfo({this.supergroupId,
    this.supergroupFullInfo});

  /// [supergroupId] Identifier of the supergroup or channel 
  int? supergroupId;

  /// [supergroupFullInfo] New full information about the supergroup
  SupergroupFullInfo? supergroupFullInfo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSupergroupFullInfo.fromJson(Map<String, dynamic> json)  {
    supergroupId = json['supergroup_id'] == null ? null : json['supergroup_id'];
    supergroupFullInfo = json['supergroup_full_info'] == null ? null : SupergroupFullInfo.fromJson(json['supergroup_full_info'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "supergroup_full_info": supergroupFullInfo == null ? null : supergroupFullInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateSupergroupFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateServiceNotification extends Update {

  /// A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification
  UpdateServiceNotification({this.type,
    this.content});

  /// [type] Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
  String? type;

  /// [content] Notification content
  MessageContent? content;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateServiceNotification.fromJson(Map<String, dynamic> json)  {
    type = json['type'] == null ? null : json['type'];
    content = json['content'] == null ? null : MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type,
      "content": content == null ? null : content?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateServiceNotification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateFile extends Update {

  /// Information about a file was updated
  UpdateFile({this.file});

  /// [file] New data about the file
  File? file;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateFile.fromJson(Map<String, dynamic> json)  {
    file = json['file'] == null ? null : File.fromJson(json['file'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file": file == null ? null : file?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateFileGenerationStart extends Update {

  /// The file generation process needs to be started by the application
  UpdateFileGenerationStart({this.generationId,
    this.originalPath,
    this.destinationPath,
    this.conversion});

  /// [generationId] Unique identifier for the generation process
  int? generationId;

  /// [originalPath] The path to a file from which a new file is generated; may be empty
  String? originalPath;

  /// [destinationPath] The path to a file that must be created and where the new file is generated
  String? destinationPath;

  /// [conversion] String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which must be downloaded by the application
  String? conversion;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateFileGenerationStart.fromJson(Map<String, dynamic> json)  {
    generationId = json['generation_id'] == null ? null : int.tryParse(json['generation_id'] ?? "");
    originalPath = json['original_path'] == null ? null : json['original_path'];
    destinationPath = json['destination_path'] == null ? null : json['destination_path'];
    conversion = json['conversion'] == null ? null : json['conversion'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "generation_id": generationId,
      "original_path": originalPath,
      "destination_path": destinationPath,
      "conversion": conversion,
    };
  }

  static const CONSTRUCTOR = 'updateFileGenerationStart';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateFileGenerationStop extends Update {

  /// File generation is no longer needed
  UpdateFileGenerationStop({this.generationId});

  /// [generationId] Unique identifier for the generation process
  int? generationId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateFileGenerationStop.fromJson(Map<String, dynamic> json)  {
    generationId = json['generation_id'] == null ? null : int.tryParse(json['generation_id'] ?? "");
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "generation_id": generationId,
    };
  }

  static const CONSTRUCTOR = 'updateFileGenerationStop';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateCall extends Update {

  /// New call was created or information about a call was updated
  UpdateCall({this.call});

  /// [call] New data about a call
  Call? call;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateCall.fromJson(Map<String, dynamic> json)  {
    call = json['call'] == null ? null : Call.fromJson(json['call'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "call": call == null ? null : call?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateGroupCall extends Update {

  /// Information about a group call was updated
  UpdateGroupCall({this.groupCall});

  /// [groupCall] New data about a group call
  GroupCall? groupCall;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateGroupCall.fromJson(Map<String, dynamic> json)  {
    groupCall = json['group_call'] == null ? null : GroupCall.fromJson(json['group_call'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call": groupCall == null ? null : groupCall?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateGroupCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateGroupCallParticipant extends Update {

  /// Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
  UpdateGroupCallParticipant({this.groupCallId,
    this.participant});

  /// [groupCallId] Identifier of group call
  int? groupCallId;

  /// [participant] New data about a participant
  GroupCallParticipant? participant;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateGroupCallParticipant.fromJson(Map<String, dynamic> json)  {
    groupCallId = json['group_call_id'] == null ? null : json['group_call_id'];
    participant = json['participant'] == null ? null : GroupCallParticipant.fromJson(json['participant'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "participant": participant == null ? null : participant?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateGroupCallParticipant';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewCallSignalingData extends Update {

  /// New call signaling data arrived
  UpdateNewCallSignalingData({this.callId,
    this.data});

  /// [callId] The call identifier 
  int? callId;

  /// [data] The data
  String? data;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewCallSignalingData.fromJson(Map<String, dynamic> json)  {
    callId = json['call_id'] == null ? null : json['call_id'];
    data = json['data'] == null ? null : json['data'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "call_id": callId,
      "data": data,
    };
  }

  static const CONSTRUCTOR = 'updateNewCallSignalingData';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUserPrivacySettingRules extends Update {

  /// Some privacy setting rules have been changed
  UpdateUserPrivacySettingRules({this.setting,
    this.rules});

  /// [setting] The privacy setting 
  UserPrivacySetting? setting;

  /// [rules] New privacy rules
  UserPrivacySettingRules? rules;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUserPrivacySettingRules.fromJson(Map<String, dynamic> json)  {
    setting = json['setting'] == null ? null : UserPrivacySetting.fromJson(json['setting'] ?? <String, dynamic>{});
    rules = json['rules'] == null ? null : UserPrivacySettingRules.fromJson(json['rules'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "setting": setting == null ? null : setting?.toJson(),
      "rules": rules == null ? null : rules?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateUserPrivacySettingRules';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUnreadMessageCount extends Update {

  /// Number of unread messages in a chat list has changed. This update is sent only if the message database is used
  UpdateUnreadMessageCount({this.chatList,
    this.unreadCount,
    this.unreadUnmutedCount});

  /// [chatList] The chat list with changed number of unread messages
  ChatList? chatList;

  /// [unreadCount] Total number of unread messages
  int? unreadCount;

  /// [unreadUnmutedCount] Total number of unread messages in unmuted chats
  int? unreadUnmutedCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUnreadMessageCount.fromJson(Map<String, dynamic> json)  {
    chatList = json['chat_list'] == null ? null : ChatList.fromJson(json['chat_list'] ?? <String, dynamic>{});
    unreadCount = json['unread_count'] == null ? null : json['unread_count'];
    unreadUnmutedCount = json['unread_unmuted_count'] == null ? null : json['unread_unmuted_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "unread_count": unreadCount,
      "unread_unmuted_count": unreadUnmutedCount,
    };
  }

  static const CONSTRUCTOR = 'updateUnreadMessageCount';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUnreadChatCount extends Update {

  /// Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
  UpdateUnreadChatCount({this.chatList,
    this.totalCount,
    this.unreadCount,
    this.unreadUnmutedCount,
    this.markedAsUnreadCount,
    this.markedAsUnreadUnmutedCount});

  /// [chatList] The chat list with changed number of unread messages
  ChatList? chatList;

  /// [totalCount] Approximate total number of chats in the chat list
  int? totalCount;

  /// [unreadCount] Total number of unread chats
  int? unreadCount;

  /// [unreadUnmutedCount] Total number of unread unmuted chats
  int? unreadUnmutedCount;

  /// [markedAsUnreadCount] Total number of chats marked as unread
  int? markedAsUnreadCount;

  /// [markedAsUnreadUnmutedCount] Total number of unmuted chats marked as unread
  int? markedAsUnreadUnmutedCount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUnreadChatCount.fromJson(Map<String, dynamic> json)  {
    chatList = json['chat_list'] == null ? null : ChatList.fromJson(json['chat_list'] ?? <String, dynamic>{});
    totalCount = json['total_count'] == null ? null : json['total_count'];
    unreadCount = json['unread_count'] == null ? null : json['unread_count'];
    unreadUnmutedCount = json['unread_unmuted_count'] == null ? null : json['unread_unmuted_count'];
    markedAsUnreadCount = json['marked_as_unread_count'] == null ? null : json['marked_as_unread_count'];
    markedAsUnreadUnmutedCount = json['marked_as_unread_unmuted_count'] == null ? null : json['marked_as_unread_unmuted_count'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "total_count": totalCount,
      "unread_count": unreadCount,
      "unread_unmuted_count": unreadUnmutedCount,
      "marked_as_unread_count": markedAsUnreadCount,
      "marked_as_unread_unmuted_count": markedAsUnreadUnmutedCount,
    };
  }

  static const CONSTRUCTOR = 'updateUnreadChatCount';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateOption extends Update {

  /// An option changed its value
  UpdateOption({this.name,
    this.value});

  /// [name] The option name 
  String? name;

  /// [value] The new option value
  OptionValue? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateOption.fromJson(Map<String, dynamic> json)  {
    name = json['name'] == null ? null : json['name'];
    value = json['value'] == null ? null : OptionValue.fromJson(json['value'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "value": value == null ? null : value?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateOption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateStickerSet extends Update {

  /// A sticker set has changed
  UpdateStickerSet({this.stickerSet});

  /// [stickerSet] The sticker set
  StickerSet? stickerSet;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateStickerSet.fromJson(Map<String, dynamic> json)  {
    stickerSet = json['sticker_set'] == null ? null : StickerSet.fromJson(json['sticker_set'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker_set": stickerSet == null ? null : stickerSet?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateStickerSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateInstalledStickerSets extends Update {

  /// The list of installed sticker sets was updated
  UpdateInstalledStickerSets({this.isMasks,
    this.stickerSetIds});

  /// [isMasks] True, if the list of installed mask sticker sets was updated 
  bool? isMasks;

  /// [stickerSetIds] The new list of installed ordinary sticker sets
  List<int>? stickerSetIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateInstalledStickerSets.fromJson(Map<String, dynamic> json)  {
    isMasks = json['is_masks'] == null ? null : json['is_masks'];
    stickerSetIds = json['sticker_set_ids'] == null ? null : List<int>.from((json['sticker_set_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_masks": isMasks,
      "sticker_set_ids": stickerSetIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateInstalledStickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateTrendingStickerSets extends Update {

  /// The list of trending sticker sets was updated or some of them were viewed
  UpdateTrendingStickerSets({this.stickerSets});

  /// [stickerSets] The prefix of the list of trending sticker sets with the newest trending sticker sets
  StickerSets? stickerSets;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateTrendingStickerSets.fromJson(Map<String, dynamic> json)  {
    stickerSets = json['sticker_sets'] == null ? null : StickerSets.fromJson(json['sticker_sets'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker_sets": stickerSets == null ? null : stickerSets?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateTrendingStickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateRecentStickers extends Update {

  /// The list of recently used stickers was updated
  UpdateRecentStickers({this.isAttached,
    this.stickerIds});

  /// [isAttached] True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated 
  bool? isAttached;

  /// [stickerIds] The new list of file identifiers of recently used stickers
  List<int>? stickerIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateRecentStickers.fromJson(Map<String, dynamic> json)  {
    isAttached = json['is_attached'] == null ? null : json['is_attached'];
    stickerIds = json['sticker_ids'] == null ? null : List<int>.from((json['sticker_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_attached": isAttached,
      "sticker_ids": stickerIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateRecentStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateFavoriteStickers extends Update {

  /// The list of favorite stickers was updated
  UpdateFavoriteStickers({this.stickerIds});

  /// [stickerIds] The new list of file identifiers of favorite stickers
  List<int>? stickerIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateFavoriteStickers.fromJson(Map<String, dynamic> json)  {
    stickerIds = json['sticker_ids'] == null ? null : List<int>.from((json['sticker_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker_ids": stickerIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateFavoriteStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSavedAnimations extends Update {

  /// The list of saved animations was updated
  UpdateSavedAnimations({this.animationIds});

  /// [animationIds] The new list of file identifiers of saved animations
  List<int>? animationIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSavedAnimations.fromJson(Map<String, dynamic> json)  {
    animationIds = json['animation_ids'] == null ? null : List<int>.from((json['animation_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "animation_ids": animationIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateSavedAnimations';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSelectedBackground extends Update {

  /// The selected background has changed
  UpdateSelectedBackground({this.forDarkTheme,
    this.background});

  /// [forDarkTheme] True, if background for dark theme has changed 
  bool? forDarkTheme;

  /// [background] The new selected background; may be null
  Background? background;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSelectedBackground.fromJson(Map<String, dynamic> json)  {
    forDarkTheme = json['for_dark_theme'] == null ? null : json['for_dark_theme'];
    background = json['background'] == null ? null : Background.fromJson(json['background'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "for_dark_theme": forDarkTheme,
      "background": background == null ? null : background?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateSelectedBackground';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatThemes extends Update {

  /// The list of available chat themes has changed
  UpdateChatThemes({this.chatThemes});

  /// [chatThemes] The new list of chat themes
  List<ChatTheme>? chatThemes;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatThemes.fromJson(Map<String, dynamic> json)  {
    chatThemes = json['chat_themes'] == null ? null : List<ChatTheme>.from((json['chat_themes'] ?? [])!.map((item) => ChatTheme.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_themes": chatThemes?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateChatThemes';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateLanguagePackStrings extends Update {

  /// Some language pack strings have been updated
  UpdateLanguagePackStrings({this.localizationTarget,
    this.languagePackId,
    this.strings});

  /// [localizationTarget] Localization target to which the language pack belongs 
  String? localizationTarget;

  /// [languagePackId] Identifier of the updated language pack 
  String? languagePackId;

  /// [strings] List of changed language pack strings
  List<LanguagePackString>? strings;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateLanguagePackStrings.fromJson(Map<String, dynamic> json)  {
    localizationTarget = json['localization_target'] == null ? null : json['localization_target'];
    languagePackId = json['language_pack_id'] == null ? null : json['language_pack_id'];
    strings = json['strings'] == null ? null : List<LanguagePackString>.from((json['strings'] ?? [])!.map((item) => LanguagePackString.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "localization_target": localizationTarget,
      "language_pack_id": languagePackId,
      "strings": strings?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateLanguagePackStrings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateConnectionState extends Update {

  /// The connection state has changed. This update must be used only to show a human-readable description of the connection state
  UpdateConnectionState({this.state});

  /// [state] The new connection state
  ConnectionState? state;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateConnectionState.fromJson(Map<String, dynamic> json)  {
    state = json['state'] == null ? null : ConnectionState.fromJson(json['state'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "state": state == null ? null : state?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateConnectionState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateTermsOfService extends Update {

  /// New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update"
  UpdateTermsOfService({this.termsOfServiceId,
    this.termsOfService});

  /// [termsOfServiceId] Identifier of the terms of service 
  String? termsOfServiceId;

  /// [termsOfService] The new terms of service
  TermsOfService? termsOfService;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateTermsOfService.fromJson(Map<String, dynamic> json)  {
    termsOfServiceId = json['terms_of_service_id'] == null ? null : json['terms_of_service_id'];
    termsOfService = json['terms_of_service'] == null ? null : TermsOfService.fromJson(json['terms_of_service'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "terms_of_service_id": termsOfServiceId,
      "terms_of_service": termsOfService == null ? null : termsOfService?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateTermsOfService';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateUsersNearby extends Update {

  /// The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request
  UpdateUsersNearby({this.usersNearby});

  /// [usersNearby] The new list of users nearby
  List<ChatNearby>? usersNearby;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUsersNearby.fromJson(Map<String, dynamic> json)  {
    usersNearby = json['users_nearby'] == null ? null : List<ChatNearby>.from((json['users_nearby'] ?? [])!.map((item) => ChatNearby.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "users_nearby": usersNearby?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateUsersNearby';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateDiceEmojis extends Update {

  /// The list of supported dice emojis has changed
  UpdateDiceEmojis({this.emojis});

  /// [emojis] The new list of supported dice emojis
  List<String>? emojis;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateDiceEmojis.fromJson(Map<String, dynamic> json)  {
    emojis = json['emojis'] == null ? null : List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emojis": emojis?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateDiceEmojis';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateAnimatedEmojiMessageClicked extends Update {

  /// Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
  UpdateAnimatedEmojiMessageClicked({this.chatId,
    this.messageId,
    this.sticker});

  /// [chatId] Chat identifier
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [sticker] The animated sticker to be played
  Sticker? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateAnimatedEmojiMessageClicked.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    sticker = json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateAnimatedEmojiMessageClicked';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateAnimationSearchParameters extends Update {

  /// The parameters of animation search through GetOption("animation_search_bot_username") bot has changed
  UpdateAnimationSearchParameters({this.provider,
    this.emojis});

  /// [provider] Name of the animation search provider 
  String? provider;

  /// [emojis] The new list of emojis suggested for searching
  List<String>? emojis;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateAnimationSearchParameters.fromJson(Map<String, dynamic> json)  {
    provider = json['provider'] == null ? null : json['provider'];
    emojis = json['emojis'] == null ? null : List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "provider": provider,
      "emojis": emojis?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateAnimationSearchParameters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateSuggestedActions extends Update {

  /// The list of suggested to the user actions has changed
  UpdateSuggestedActions({this.addedActions,
    this.removedActions});

  /// [addedActions] Added suggested actions 
  List<SuggestedAction>? addedActions;

  /// [removedActions] Removed suggested actions
  List<SuggestedAction>? removedActions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateSuggestedActions.fromJson(Map<String, dynamic> json)  {
    addedActions = json['added_actions'] == null ? null : List<SuggestedAction>.from((json['added_actions'] ?? [])!.map((item) => SuggestedAction.fromJson(item ?? <String, dynamic>{})).toList());
    removedActions = json['removed_actions'] == null ? null : List<SuggestedAction>.from((json['removed_actions'] ?? [])!.map((item) => SuggestedAction.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "added_actions": addedActions?.map((i) => i.toJson()).toList(),
      "removed_actions": removedActions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updateSuggestedActions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewInlineQuery extends Update {

  /// A new incoming inline query; for bots only
  UpdateNewInlineQuery({this.id,
    this.senderUserId,
    this.userLocation,
    this.chatType,
    this.query,
    this.offset});

  /// [id] Unique query identifier 
  int? id;

  /// [senderUserId] Identifier of the user who sent the query 
  int? senderUserId;

  /// [userLocation] User location; may be null
  Location? userLocation;

  /// [chatType] The type of the chat, from which the query originated; may be null if unknown
  ChatType? chatType;

  /// [query] Text of the query 
  String? query;

  /// [offset] Offset of the first entry to return
  String? offset;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewInlineQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    userLocation = json['user_location'] == null ? null : Location.fromJson(json['user_location'] ?? <String, dynamic>{});
    chatType = json['chat_type'] == null ? null : ChatType.fromJson(json['chat_type'] ?? <String, dynamic>{});
    query = json['query'] == null ? null : json['query'];
    offset = json['offset'] == null ? null : json['offset'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender_user_id": senderUserId,
      "user_location": userLocation == null ? null : userLocation?.toJson(),
      "chat_type": chatType == null ? null : chatType?.toJson(),
      "query": query,
      "offset": offset,
    };
  }

  static const CONSTRUCTOR = 'updateNewInlineQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewChosenInlineResult extends Update {

  /// The user has chosen a result of an inline query; for bots only
  UpdateNewChosenInlineResult({this.senderUserId,
    this.userLocation,
    this.query,
    this.resultId,
    this.inlineMessageId});

  /// [senderUserId] Identifier of the user who sent the query 
  int? senderUserId;

  /// [userLocation] User location; may be null
  Location? userLocation;

  /// [query] Text of the query
  String? query;

  /// [resultId] Identifier of the chosen result 
  String? resultId;

  /// [inlineMessageId] Identifier of the sent inline message, if known
  String? inlineMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewChosenInlineResult.fromJson(Map<String, dynamic> json)  {
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    userLocation = json['user_location'] == null ? null : Location.fromJson(json['user_location'] ?? <String, dynamic>{});
    query = json['query'] == null ? null : json['query'];
    resultId = json['result_id'] == null ? null : json['result_id'];
    inlineMessageId = json['inline_message_id'] == null ? null : json['inline_message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_user_id": senderUserId,
      "user_location": userLocation == null ? null : userLocation?.toJson(),
      "query": query,
      "result_id": resultId,
      "inline_message_id": inlineMessageId,
    };
  }

  static const CONSTRUCTOR = 'updateNewChosenInlineResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewCallbackQuery extends Update {

  /// A new incoming callback query; for bots only
  UpdateNewCallbackQuery({this.id,
    this.senderUserId,
    this.chatId,
    this.messageId,
    this.chatInstance,
    this.payload});

  /// [id] Unique query identifier 
  int? id;

  /// [senderUserId] Identifier of the user who sent the query
  int? senderUserId;

  /// [chatId] Identifier of the chat where the query was sent
  int? chatId;

  /// [messageId] Identifier of the message, from which the query originated
  int? messageId;

  /// [chatInstance] Identifier that uniquely corresponds to the chat to which the message was sent
  int? chatInstance;

  /// [payload] Query payload
  CallbackQueryPayload? payload;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewCallbackQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageId = json['message_id'] == null ? null : json['message_id'];
    chatInstance = json['chat_instance'] == null ? null : int.tryParse(json['chat_instance'] ?? "");
    payload = json['payload'] == null ? null : CallbackQueryPayload.fromJson(json['payload'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender_user_id": senderUserId,
      "chat_id": chatId,
      "message_id": messageId,
      "chat_instance": chatInstance,
      "payload": payload == null ? null : payload?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewCallbackQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewInlineCallbackQuery extends Update {

  /// A new incoming callback query from a message sent via a bot; for bots only
  UpdateNewInlineCallbackQuery({this.id,
    this.senderUserId,
    this.inlineMessageId,
    this.chatInstance,
    this.payload});

  /// [id] Unique query identifier 
  int? id;

  /// [senderUserId] Identifier of the user who sent the query 
  int? senderUserId;

  /// [inlineMessageId] Identifier of the inline message, from which the query originated
  String? inlineMessageId;

  /// [chatInstance] An identifier uniquely corresponding to the chat a message was sent to
  int? chatInstance;

  /// [payload] Query payload
  CallbackQueryPayload? payload;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewInlineCallbackQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    inlineMessageId = json['inline_message_id'] == null ? null : json['inline_message_id'];
    chatInstance = json['chat_instance'] == null ? null : int.tryParse(json['chat_instance'] ?? "");
    payload = json['payload'] == null ? null : CallbackQueryPayload.fromJson(json['payload'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender_user_id": senderUserId,
      "inline_message_id": inlineMessageId,
      "chat_instance": chatInstance,
      "payload": payload == null ? null : payload?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewInlineCallbackQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewShippingQuery extends Update {

  /// A new incoming shipping query; for bots only. Only for invoices with flexible price
  UpdateNewShippingQuery({this.id,
    this.senderUserId,
    this.invoicePayload,
    this.shippingAddress});

  /// [id] Unique query identifier 
  int? id;

  /// [senderUserId] Identifier of the user who sent the query 
  int? senderUserId;

  /// [invoicePayload] Invoice payload 
  String? invoicePayload;

  /// [shippingAddress] User shipping address
  Address? shippingAddress;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewShippingQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    invoicePayload = json['invoice_payload'] == null ? null : json['invoice_payload'];
    shippingAddress = json['shipping_address'] == null ? null : Address.fromJson(json['shipping_address'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender_user_id": senderUserId,
      "invoice_payload": invoicePayload,
      "shipping_address": shippingAddress == null ? null : shippingAddress?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewShippingQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewPreCheckoutQuery extends Update {

  /// A new incoming pre-checkout query; for bots only. Contains full information about a checkout
  UpdateNewPreCheckoutQuery({this.id,
    this.senderUserId,
    this.currency,
    this.totalAmount,
    this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo});

  /// [id] Unique query identifier 
  int? id;

  /// [senderUserId] Identifier of the user who sent the query 
  int? senderUserId;

  /// [currency] Currency for the product price 
  String? currency;

  /// [totalAmount] Total price for the product, in the smallest units of the currency
  int? totalAmount;

  /// [invoicePayload] Invoice payload
  String? invoicePayload;

  /// [shippingOptionId] Identifier of a shipping option chosen by the user; may be empty if not applicable 
  String? shippingOptionId;

  /// [orderInfo] Information about the order; may be null
  OrderInfo? orderInfo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewPreCheckoutQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    senderUserId = json['sender_user_id'] == null ? null : json['sender_user_id'];
    currency = json['currency'] == null ? null : json['currency'];
    totalAmount = json['total_amount'] == null ? null : json['total_amount'];
    invoicePayload = json['invoice_payload'] == null ? null : json['invoice_payload'];
    shippingOptionId = json['shipping_option_id'] == null ? null : json['shipping_option_id'];
    orderInfo = json['order_info'] == null ? null : OrderInfo.fromJson(json['order_info'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sender_user_id": senderUserId,
      "currency": currency,
      "total_amount": totalAmount,
      "invoice_payload": invoicePayload,
      "shipping_option_id": shippingOptionId,
      "order_info": orderInfo == null ? null : orderInfo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewPreCheckoutQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewCustomEvent extends Update {

  /// A new incoming event; for bots only
  UpdateNewCustomEvent({this.event});

  /// [event] A JSON-serialized event
  String? event;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewCustomEvent.fromJson(Map<String, dynamic> json)  {
    event = json['event'] == null ? null : json['event'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "event": event,
    };
  }

  static const CONSTRUCTOR = 'updateNewCustomEvent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewCustomQuery extends Update {

  /// A new incoming query; for bots only
  UpdateNewCustomQuery({this.id,
    this.data,
    this.timeout});

  /// [id] The query identifier 
  int? id;

  /// [data] JSON-serialized query data 
  String? data;

  /// [timeout] Query timeout
  int? timeout;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewCustomQuery.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    data = json['data'] == null ? null : json['data'];
    timeout = json['timeout'] == null ? null : json['timeout'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "data": data,
      "timeout": timeout,
    };
  }

  static const CONSTRUCTOR = 'updateNewCustomQuery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdatePoll extends Update {

  /// A poll was updated; for bots only
  UpdatePoll({this.poll});

  /// [poll] New data about the poll
  Poll? poll;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdatePoll.fromJson(Map<String, dynamic> json)  {
    poll = json['poll'] == null ? null : Poll.fromJson(json['poll'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "poll": poll == null ? null : poll?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updatePoll';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdatePollAnswer extends Update {

  /// A user changed the answer to a poll; for bots only
  UpdatePollAnswer({this.pollId,
    this.userId,
    this.optionIds});

  /// [pollId] Unique poll identifier 
  int? pollId;

  /// [userId] The user, who changed the answer to the poll 
  int? userId;

  /// [optionIds] 0-based identifiers of answer options, chosen by the user
  List<int>? optionIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdatePollAnswer.fromJson(Map<String, dynamic> json)  {
    pollId = json['poll_id'] == null ? null : int.tryParse(json['poll_id'] ?? "");
    userId = json['user_id'] == null ? null : json['user_id'];
    optionIds = json['option_ids'] == null ? null : List<int>.from((json['option_ids'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "poll_id": pollId,
      "user_id": userId,
      "option_ids": optionIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'updatePollAnswer';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateChatMember extends Update {

  /// User rights changed in a chat; for bots only
  UpdateChatMember({this.chatId,
    this.actorUserId,
    this.date,
    this.inviteLink,
    this.oldChatMember,
    this.newChatMember});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [actorUserId] Identifier of the user, changing the rights
  int? actorUserId;

  /// [date] Point in time (Unix timestamp) when the user rights was changed
  int? date;

  /// [inviteLink] If user has joined the chat using an invite link, the invite link; may be null
  ChatInviteLink? inviteLink;

  /// [oldChatMember] Previous chat member
  ChatMember? oldChatMember;

  /// [newChatMember] New chat member
  ChatMember? newChatMember;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatMember.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    actorUserId = json['actor_user_id'] == null ? null : json['actor_user_id'];
    date = json['date'] == null ? null : json['date'];
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
    oldChatMember = json['old_chat_member'] == null ? null : ChatMember.fromJson(json['old_chat_member'] ?? <String, dynamic>{});
    newChatMember = json['new_chat_member'] == null ? null : ChatMember.fromJson(json['new_chat_member'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "actor_user_id": actorUserId,
      "date": date,
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
      "old_chat_member": oldChatMember == null ? null : oldChatMember?.toJson(),
      "new_chat_member": newChatMember == null ? null : newChatMember?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateChatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class UpdateNewChatJoinRequest extends Update {

  /// A user sent a join request to a chat; for bots only
  UpdateNewChatJoinRequest({this.chatId,
    this.request,
    this.inviteLink});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [request] Join request 
  ChatJoinRequest? request;

  /// [inviteLink] The invite link, which was used to send join request; may be null
  ChatInviteLink? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateNewChatJoinRequest.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    request = json['request'] == null ? null : ChatJoinRequest.fromJson(json['request'] ?? <String, dynamic>{});
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "request": request == null ? null : request?.toJson(),
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateNewChatJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}