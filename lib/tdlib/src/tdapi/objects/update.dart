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
  /// * UpdateChatIsMarkedAsUnread
  /// * UpdateChatIsBlocked
  /// * UpdateChatHasScheduledMessages
  /// * UpdateChatVideoChat
  /// * UpdateChatDefaultDisableNotification
  /// * UpdateChatReadInbox
  /// * UpdateChatReadOutbox
  /// * UpdateChatUnreadMentionCount
  /// * UpdateChatNotificationSettings
  /// * UpdateScopeNotificationSettings
  /// * UpdateChatMessageTtlSetting
  /// * UpdateChatActionBar
  /// * UpdateChatTheme
  /// * UpdateChatPendingJoinRequests
  /// * UpdateChatReplyMarkup
  /// * UpdateChatDraftMessage
  /// * UpdateChatFilters
  /// * UpdateChatOnlineMemberCount
  /// * UpdateNotification
  /// * UpdateNotificationGroup
  /// * UpdateActiveNotifications
  /// * UpdateHavePendingNotifications
  /// * UpdateDeleteMessages
  /// * UpdateUserChatAction
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
      case UpdateChatIsMarkedAsUnread.CONSTRUCTOR:
        return UpdateChatIsMarkedAsUnread.fromJson(json);
      case UpdateChatIsBlocked.CONSTRUCTOR:
        return UpdateChatIsBlocked.fromJson(json);
      case UpdateChatHasScheduledMessages.CONSTRUCTOR:
        return UpdateChatHasScheduledMessages.fromJson(json);
      case UpdateChatVideoChat.CONSTRUCTOR:
        return UpdateChatVideoChat.fromJson(json);
      case UpdateChatDefaultDisableNotification.CONSTRUCTOR:
        return UpdateChatDefaultDisableNotification.fromJson(json);
      case UpdateChatReadInbox.CONSTRUCTOR:
        return UpdateChatReadInbox.fromJson(json);
      case UpdateChatReadOutbox.CONSTRUCTOR:
        return UpdateChatReadOutbox.fromJson(json);
      case UpdateChatUnreadMentionCount.CONSTRUCTOR:
        return UpdateChatUnreadMentionCount.fromJson(json);
      case UpdateChatNotificationSettings.CONSTRUCTOR:
        return UpdateChatNotificationSettings.fromJson(json);
      case UpdateScopeNotificationSettings.CONSTRUCTOR:
        return UpdateScopeNotificationSettings.fromJson(json);
      case UpdateChatMessageTtlSetting.CONSTRUCTOR:
        return UpdateChatMessageTtlSetting.fromJson(json);
      case UpdateChatActionBar.CONSTRUCTOR:
        return UpdateChatActionBar.fromJson(json);
      case UpdateChatTheme.CONSTRUCTOR:
        return UpdateChatTheme.fromJson(json);
      case UpdateChatPendingJoinRequests.CONSTRUCTOR:
        return UpdateChatPendingJoinRequests.fromJson(json);
      case UpdateChatReplyMarkup.CONSTRUCTOR:
        return UpdateChatReplyMarkup.fromJson(json);
      case UpdateChatDraftMessage.CONSTRUCTOR:
        return UpdateChatDraftMessage.fromJson(json);
      case UpdateChatFilters.CONSTRUCTOR:
        return UpdateChatFilters.fromJson(json);
      case UpdateChatOnlineMemberCount.CONSTRUCTOR:
        return UpdateChatOnlineMemberCount.fromJson(json);
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
      case UpdateUserChatAction.CONSTRUCTOR:
        return UpdateUserChatAction.fromJson(json);
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
    AuthorizationState? pre_authorizationState;
    try{
      pre_authorizationState=AuthorizationState.fromJson(json['authorization_state'] ?? <String, dynamic>{});
   }catch(_){}
    authorizationState = pre_authorizationState;
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
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
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
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
    int? pre_oldMessageId;
    try{
      pre_oldMessageId=json['old_message_id'];
   }catch(_){}
    oldMessageId = pre_oldMessageId;
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
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
    int? pre_oldMessageId;
    try{
      pre_oldMessageId=json['old_message_id'];
   }catch(_){}
    oldMessageId = pre_oldMessageId;
    int? pre_errorCode;
    try{
      pre_errorCode=json['error_code'];
   }catch(_){}
    errorCode = pre_errorCode;
    String? pre_errorMessage;
    try{
      pre_errorMessage=json['error_message'];
   }catch(_){}
    errorMessage = pre_errorMessage;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    MessageContent? pre_newContent;
    try{
      pre_newContent=MessageContent.fromJson(json['new_content'] ?? <String, dynamic>{});
   }catch(_){}
    newContent = pre_newContent;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    int? pre_editDate;
    try{
      pre_editDate=json['edit_date'];
   }catch(_){}
    editDate = pre_editDate;
    ReplyMarkup? pre_replyMarkup;
    try{
      pre_replyMarkup=ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
   }catch(_){}
    replyMarkup = pre_replyMarkup;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    bool? pre_isPinned;
    try{
      pre_isPinned=json['is_pinned'];
   }catch(_){}
    isPinned = pre_isPinned;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    MessageInteractionInfo? pre_interactionInfo;
    try{
      pre_interactionInfo=MessageInteractionInfo.fromJson(json['interaction_info'] ?? <String, dynamic>{});
   }catch(_){}
    interactionInfo = pre_interactionInfo;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    int? pre_unreadMentionCount;
    try{
      pre_unreadMentionCount=json['unread_mention_count'];
   }catch(_){}
    unreadMentionCount = pre_unreadMentionCount;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
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
    Chat? pre_chat;
    try{
      pre_chat=Chat.fromJson(json['chat'] ?? <String, dynamic>{});
   }catch(_){}
    chat = pre_chat;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatPhotoInfo? pre_photo;
    try{
      pre_photo=ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatPermissions? pre_permissions;
    try{
      pre_permissions=ChatPermissions.fromJson(json['permissions'] ?? <String, dynamic>{});
   }catch(_){}
    permissions = pre_permissions;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatPosition? pre_position;
    try{
      pre_position=ChatPosition.fromJson(json['position'] ?? <String, dynamic>{});
   }catch(_){}
    position = pre_position;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    bool? pre_isMarkedAsUnread;
    try{
      pre_isMarkedAsUnread=json['is_marked_as_unread'];
   }catch(_){}
    isMarkedAsUnread = pre_isMarkedAsUnread;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    bool? pre_isBlocked;
    try{
      pre_isBlocked=json['is_blocked'];
   }catch(_){}
    isBlocked = pre_isBlocked;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    bool? pre_hasScheduledMessages;
    try{
      pre_hasScheduledMessages=json['has_scheduled_messages'];
   }catch(_){}
    hasScheduledMessages = pre_hasScheduledMessages;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    VideoChat? pre_videoChat;
    try{
      pre_videoChat=VideoChat.fromJson(json['video_chat'] ?? <String, dynamic>{});
   }catch(_){}
    videoChat = pre_videoChat;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    bool? pre_defaultDisableNotification;
    try{
      pre_defaultDisableNotification=json['default_disable_notification'];
   }catch(_){}
    defaultDisableNotification = pre_defaultDisableNotification;
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

class UpdateChatReadInbox extends Update {

  /// Incoming messages were read or number of unread messages has been changed
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_lastReadInboxMessageId;
    try{
      pre_lastReadInboxMessageId=json['last_read_inbox_message_id'];
   }catch(_){}
    lastReadInboxMessageId = pre_lastReadInboxMessageId;
    int? pre_unreadCount;
    try{
      pre_unreadCount=json['unread_count'];
   }catch(_){}
    unreadCount = pre_unreadCount;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_lastReadOutboxMessageId;
    try{
      pre_lastReadOutboxMessageId=json['last_read_outbox_message_id'];
   }catch(_){}
    lastReadOutboxMessageId = pre_lastReadOutboxMessageId;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_unreadMentionCount;
    try{
      pre_unreadMentionCount=json['unread_mention_count'];
   }catch(_){}
    unreadMentionCount = pre_unreadMentionCount;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatNotificationSettings? pre_notificationSettings;
    try{
      pre_notificationSettings=ChatNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
   }catch(_){}
    notificationSettings = pre_notificationSettings;
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
    NotificationSettingsScope? pre_scope;
    try{
      pre_scope=NotificationSettingsScope.fromJson(json['scope'] ?? <String, dynamic>{});
   }catch(_){}
    scope = pre_scope;
    ScopeNotificationSettings? pre_notificationSettings;
    try{
      pre_notificationSettings=ScopeNotificationSettings.fromJson(json['notification_settings'] ?? <String, dynamic>{});
   }catch(_){}
    notificationSettings = pre_notificationSettings;
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

class UpdateChatMessageTtlSetting extends Update {

  /// The message Time To Live setting for a chat was changed
  UpdateChatMessageTtlSetting({this.chatId,
    this.messageTtlSetting});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageTtlSetting] New value of message_ttl_setting
  int? messageTtlSetting;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatMessageTtlSetting.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageTtlSetting;
    try{
      pre_messageTtlSetting=json['message_ttl_setting'];
   }catch(_){}
    messageTtlSetting = pre_messageTtlSetting;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_ttl_setting": messageTtlSetting,
    };
  }

  static const CONSTRUCTOR = 'updateChatMessageTtlSetting';
  
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatActionBar? pre_actionBar;
    try{
      pre_actionBar=ChatActionBar.fromJson(json['action_bar'] ?? <String, dynamic>{});
   }catch(_){}
    actionBar = pre_actionBar;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    String? pre_themeName;
    try{
      pre_themeName=json['theme_name'];
   }catch(_){}
    themeName = pre_themeName;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatJoinRequestsInfo? pre_pendingJoinRequests;
    try{
      pre_pendingJoinRequests=ChatJoinRequestsInfo.fromJson(json['pending_join_requests'] ?? <String, dynamic>{});
   }catch(_){}
    pendingJoinRequests = pre_pendingJoinRequests;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_replyMarkupMessageId;
    try{
      pre_replyMarkupMessageId=json['reply_markup_message_id'];
   }catch(_){}
    replyMarkupMessageId = pre_replyMarkupMessageId;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    DraftMessage? pre_draftMessage;
    try{
      pre_draftMessage=DraftMessage.fromJson(json['draft_message'] ?? <String, dynamic>{});
   }catch(_){}
    draftMessage = pre_draftMessage;
    List<ChatPosition>? pre_positions;
    try{
      pre_positions=List<ChatPosition>.from((json['positions'] ?? [])!.map((item) => ChatPosition.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    positions = pre_positions;
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

class UpdateChatFilters extends Update {

  /// The list of chat filters or a chat filter has changed
  UpdateChatFilters({this.chatFilters});

  /// [chatFilters] The new list of chat filters
  List<ChatFilterInfo>? chatFilters;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateChatFilters.fromJson(Map<String, dynamic> json)  {
    List<ChatFilterInfo>? pre_chatFilters;
    try{
      pre_chatFilters=List<ChatFilterInfo>.from((json['chat_filters'] ?? [])!.map((item) => ChatFilterInfo.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    chatFilters = pre_chatFilters;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_onlineMemberCount;
    try{
      pre_onlineMemberCount=json['online_member_count'];
   }catch(_){}
    onlineMemberCount = pre_onlineMemberCount;
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
    int? pre_notificationGroupId;
    try{
      pre_notificationGroupId=json['notification_group_id'];
   }catch(_){}
    notificationGroupId = pre_notificationGroupId;
    Notification? pre_notification;
    try{
      pre_notification=Notification.fromJson(json['notification'] ?? <String, dynamic>{});
   }catch(_){}
    notification = pre_notification;
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
    int? pre_notificationGroupId;
    try{
      pre_notificationGroupId=json['notification_group_id'];
   }catch(_){}
    notificationGroupId = pre_notificationGroupId;
    NotificationGroupType? pre_type;
    try{
      pre_type=NotificationGroupType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_notificationSettingsChatId;
    try{
      pre_notificationSettingsChatId=json['notification_settings_chat_id'];
   }catch(_){}
    notificationSettingsChatId = pre_notificationSettingsChatId;
    bool? pre_isSilent;
    try{
      pre_isSilent=json['is_silent'];
   }catch(_){}
    isSilent = pre_isSilent;
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<Notification>? pre_addedNotifications;
    try{
      pre_addedNotifications=List<Notification>.from((json['added_notifications'] ?? [])!.map((item) => Notification.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    addedNotifications = pre_addedNotifications;
    List<int>? pre_removedNotificationIds;
    try{
      pre_removedNotificationIds=List<int>.from((json['removed_notification_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    removedNotificationIds = pre_removedNotificationIds;
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
    List<NotificationGroup>? pre_groups;
    try{
      pre_groups=List<NotificationGroup>.from((json['groups'] ?? [])!.map((item) => NotificationGroup.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    groups = pre_groups;
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
    bool? pre_haveDelayedNotifications;
    try{
      pre_haveDelayedNotifications=json['have_delayed_notifications'];
   }catch(_){}
    haveDelayedNotifications = pre_haveDelayedNotifications;
    bool? pre_haveUnreceivedNotifications;
    try{
      pre_haveUnreceivedNotifications=json['have_unreceived_notifications'];
   }catch(_){}
    haveUnreceivedNotifications = pre_haveUnreceivedNotifications;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    List<int>? pre_messageIds;
    try{
      pre_messageIds=List<int>.from((json['message_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    messageIds = pre_messageIds;
    bool? pre_isPermanent;
    try{
      pre_isPermanent=json['is_permanent'];
   }catch(_){}
    isPermanent = pre_isPermanent;
    bool? pre_fromCache;
    try{
      pre_fromCache=json['from_cache'];
   }catch(_){}
    fromCache = pre_fromCache;
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

class UpdateUserChatAction extends Update {

  /// User activity in the chat has changed
  UpdateUserChatAction({this.chatId,
    this.messageThreadId,
    this.userId,
    this.action});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the action was performed 
  int? messageThreadId;

  /// [userId] Identifier of a user performing an action 
  int? userId;

  /// [action] The action description
  ChatAction? action;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UpdateUserChatAction.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageThreadId;
    try{
      pre_messageThreadId=json['message_thread_id'];
   }catch(_){}
    messageThreadId = pre_messageThreadId;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    ChatAction? pre_action;
    try{
      pre_action=ChatAction.fromJson(json['action'] ?? <String, dynamic>{});
   }catch(_){}
    action = pre_action;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "user_id": userId,
      "action": action == null ? null : action?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'updateUserChatAction';
  
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
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    UserStatus? pre_status;
    try{
      pre_status=UserStatus.fromJson(json['status'] ?? <String, dynamic>{});
   }catch(_){}
    status = pre_status;
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
    User? pre_user;
    try{
      pre_user=User.fromJson(json['user'] ?? <String, dynamic>{});
   }catch(_){}
    user = pre_user;
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
    BasicGroup? pre_basicGroup;
    try{
      pre_basicGroup=BasicGroup.fromJson(json['basic_group'] ?? <String, dynamic>{});
   }catch(_){}
    basicGroup = pre_basicGroup;
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
    Supergroup? pre_supergroup;
    try{
      pre_supergroup=Supergroup.fromJson(json['supergroup'] ?? <String, dynamic>{});
   }catch(_){}
    supergroup = pre_supergroup;
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
    SecretChat? pre_secretChat;
    try{
      pre_secretChat=SecretChat.fromJson(json['secret_chat'] ?? <String, dynamic>{});
   }catch(_){}
    secretChat = pre_secretChat;
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

  /// Some data from userFullInfo has been changed
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
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    UserFullInfo? pre_userFullInfo;
    try{
      pre_userFullInfo=UserFullInfo.fromJson(json['user_full_info'] ?? <String, dynamic>{});
   }catch(_){}
    userFullInfo = pre_userFullInfo;
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

  /// Some data from basicGroupFullInfo has been changed
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
    int? pre_basicGroupId;
    try{
      pre_basicGroupId=json['basic_group_id'];
   }catch(_){}
    basicGroupId = pre_basicGroupId;
    BasicGroupFullInfo? pre_basicGroupFullInfo;
    try{
      pre_basicGroupFullInfo=BasicGroupFullInfo.fromJson(json['basic_group_full_info'] ?? <String, dynamic>{});
   }catch(_){}
    basicGroupFullInfo = pre_basicGroupFullInfo;
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

  /// Some data from supergroupFullInfo has been changed
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
    int? pre_supergroupId;
    try{
      pre_supergroupId=json['supergroup_id'];
   }catch(_){}
    supergroupId = pre_supergroupId;
    SupergroupFullInfo? pre_supergroupFullInfo;
    try{
      pre_supergroupFullInfo=SupergroupFullInfo.fromJson(json['supergroup_full_info'] ?? <String, dynamic>{});
   }catch(_){}
    supergroupFullInfo = pre_supergroupFullInfo;
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

  /// Service notification from the server. Upon receiving this the application must show a popup with the content of the notification
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
    String? pre_type;
    try{
      pre_type=json['type'];
   }catch(_){}
    type = pre_type;
    MessageContent? pre_content;
    try{
      pre_content=MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
   }catch(_){}
    content = pre_content;
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
    File? pre_file;
    try{
      pre_file=File.fromJson(json['file'] ?? <String, dynamic>{});
   }catch(_){}
    file = pre_file;
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
    int? pre_generationId;
    try{
      pre_generationId=int.tryParse(json['generation_id'] ?? "");
   }catch(_){}
    generationId = pre_generationId;
    String? pre_originalPath;
    try{
      pre_originalPath=json['original_path'];
   }catch(_){}
    originalPath = pre_originalPath;
    String? pre_destinationPath;
    try{
      pre_destinationPath=json['destination_path'];
   }catch(_){}
    destinationPath = pre_destinationPath;
    String? pre_conversion;
    try{
      pre_conversion=json['conversion'];
   }catch(_){}
    conversion = pre_conversion;
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
    int? pre_generationId;
    try{
      pre_generationId=int.tryParse(json['generation_id'] ?? "");
   }catch(_){}
    generationId = pre_generationId;
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
    Call? pre_call;
    try{
      pre_call=Call.fromJson(json['call'] ?? <String, dynamic>{});
   }catch(_){}
    call = pre_call;
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
    GroupCall? pre_groupCall;
    try{
      pre_groupCall=GroupCall.fromJson(json['group_call'] ?? <String, dynamic>{});
   }catch(_){}
    groupCall = pre_groupCall;
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
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
    GroupCallParticipant? pre_participant;
    try{
      pre_participant=GroupCallParticipant.fromJson(json['participant'] ?? <String, dynamic>{});
   }catch(_){}
    participant = pre_participant;
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
    int? pre_callId;
    try{
      pre_callId=json['call_id'];
   }catch(_){}
    callId = pre_callId;
    String? pre_data;
    try{
      pre_data=json['data'];
   }catch(_){}
    data = pre_data;
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
    UserPrivacySetting? pre_setting;
    try{
      pre_setting=UserPrivacySetting.fromJson(json['setting'] ?? <String, dynamic>{});
   }catch(_){}
    setting = pre_setting;
    UserPrivacySettingRules? pre_rules;
    try{
      pre_rules=UserPrivacySettingRules.fromJson(json['rules'] ?? <String, dynamic>{});
   }catch(_){}
    rules = pre_rules;
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
    ChatList? pre_chatList;
    try{
      pre_chatList=ChatList.fromJson(json['chat_list'] ?? <String, dynamic>{});
   }catch(_){}
    chatList = pre_chatList;
    int? pre_unreadCount;
    try{
      pre_unreadCount=json['unread_count'];
   }catch(_){}
    unreadCount = pre_unreadCount;
    int? pre_unreadUnmutedCount;
    try{
      pre_unreadUnmutedCount=json['unread_unmuted_count'];
   }catch(_){}
    unreadUnmutedCount = pre_unreadUnmutedCount;
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
    ChatList? pre_chatList;
    try{
      pre_chatList=ChatList.fromJson(json['chat_list'] ?? <String, dynamic>{});
   }catch(_){}
    chatList = pre_chatList;
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    int? pre_unreadCount;
    try{
      pre_unreadCount=json['unread_count'];
   }catch(_){}
    unreadCount = pre_unreadCount;
    int? pre_unreadUnmutedCount;
    try{
      pre_unreadUnmutedCount=json['unread_unmuted_count'];
   }catch(_){}
    unreadUnmutedCount = pre_unreadUnmutedCount;
    int? pre_markedAsUnreadCount;
    try{
      pre_markedAsUnreadCount=json['marked_as_unread_count'];
   }catch(_){}
    markedAsUnreadCount = pre_markedAsUnreadCount;
    int? pre_markedAsUnreadUnmutedCount;
    try{
      pre_markedAsUnreadUnmutedCount=json['marked_as_unread_unmuted_count'];
   }catch(_){}
    markedAsUnreadUnmutedCount = pre_markedAsUnreadUnmutedCount;
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
    String? pre_name;
    try{
      pre_name=json['name'];
   }catch(_){}
    name = pre_name;
    OptionValue? pre_value;
    try{
      pre_value=OptionValue.fromJson(json['value'] ?? <String, dynamic>{});
   }catch(_){}
    value = pre_value;
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
    StickerSet? pre_stickerSet;
    try{
      pre_stickerSet=StickerSet.fromJson(json['sticker_set'] ?? <String, dynamic>{});
   }catch(_){}
    stickerSet = pre_stickerSet;
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
    bool? pre_isMasks;
    try{
      pre_isMasks=json['is_masks'];
   }catch(_){}
    isMasks = pre_isMasks;
    List<int>? pre_stickerSetIds;
    try{
      pre_stickerSetIds=List<int>.from((json['sticker_set_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    stickerSetIds = pre_stickerSetIds;
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
    StickerSets? pre_stickerSets;
    try{
      pre_stickerSets=StickerSets.fromJson(json['sticker_sets'] ?? <String, dynamic>{});
   }catch(_){}
    stickerSets = pre_stickerSets;
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
    bool? pre_isAttached;
    try{
      pre_isAttached=json['is_attached'];
   }catch(_){}
    isAttached = pre_isAttached;
    List<int>? pre_stickerIds;
    try{
      pre_stickerIds=List<int>.from((json['sticker_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    stickerIds = pre_stickerIds;
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
    List<int>? pre_stickerIds;
    try{
      pre_stickerIds=List<int>.from((json['sticker_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    stickerIds = pre_stickerIds;
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
    List<int>? pre_animationIds;
    try{
      pre_animationIds=List<int>.from((json['animation_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    animationIds = pre_animationIds;
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
    bool? pre_forDarkTheme;
    try{
      pre_forDarkTheme=json['for_dark_theme'];
   }catch(_){}
    forDarkTheme = pre_forDarkTheme;
    Background? pre_background;
    try{
      pre_background=Background.fromJson(json['background'] ?? <String, dynamic>{});
   }catch(_){}
    background = pre_background;
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
    List<ChatTheme>? pre_chatThemes;
    try{
      pre_chatThemes=List<ChatTheme>.from((json['chat_themes'] ?? [])!.map((item) => ChatTheme.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    chatThemes = pre_chatThemes;
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
    String? pre_localizationTarget;
    try{
      pre_localizationTarget=json['localization_target'];
   }catch(_){}
    localizationTarget = pre_localizationTarget;
    String? pre_languagePackId;
    try{
      pre_languagePackId=json['language_pack_id'];
   }catch(_){}
    languagePackId = pre_languagePackId;
    List<LanguagePackString>? pre_strings;
    try{
      pre_strings=List<LanguagePackString>.from((json['strings'] ?? [])!.map((item) => LanguagePackString.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    strings = pre_strings;
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
    ConnectionState? pre_state;
    try{
      pre_state=ConnectionState.fromJson(json['state'] ?? <String, dynamic>{});
   }catch(_){}
    state = pre_state;
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
    String? pre_termsOfServiceId;
    try{
      pre_termsOfServiceId=json['terms_of_service_id'];
   }catch(_){}
    termsOfServiceId = pre_termsOfServiceId;
    TermsOfService? pre_termsOfService;
    try{
      pre_termsOfService=TermsOfService.fromJson(json['terms_of_service'] ?? <String, dynamic>{});
   }catch(_){}
    termsOfService = pre_termsOfService;
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
    List<ChatNearby>? pre_usersNearby;
    try{
      pre_usersNearby=List<ChatNearby>.from((json['users_nearby'] ?? [])!.map((item) => ChatNearby.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    usersNearby = pre_usersNearby;
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
    List<String>? pre_emojis;
    try{
      pre_emojis=List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    emojis = pre_emojis;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    Sticker? pre_sticker;
    try{
      pre_sticker=Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
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
    String? pre_provider;
    try{
      pre_provider=json['provider'];
   }catch(_){}
    provider = pre_provider;
    List<String>? pre_emojis;
    try{
      pre_emojis=List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    emojis = pre_emojis;
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
    List<SuggestedAction>? pre_addedActions;
    try{
      pre_addedActions=List<SuggestedAction>.from((json['added_actions'] ?? [])!.map((item) => SuggestedAction.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    addedActions = pre_addedActions;
    List<SuggestedAction>? pre_removedActions;
    try{
      pre_removedActions=List<SuggestedAction>.from((json['removed_actions'] ?? [])!.map((item) => SuggestedAction.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    removedActions = pre_removedActions;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    Location? pre_userLocation;
    try{
      pre_userLocation=Location.fromJson(json['user_location'] ?? <String, dynamic>{});
   }catch(_){}
    userLocation = pre_userLocation;
    ChatType? pre_chatType;
    try{
      pre_chatType=ChatType.fromJson(json['chat_type'] ?? <String, dynamic>{});
   }catch(_){}
    chatType = pre_chatType;
    String? pre_query;
    try{
      pre_query=json['query'];
   }catch(_){}
    query = pre_query;
    String? pre_offset;
    try{
      pre_offset=json['offset'];
   }catch(_){}
    offset = pre_offset;
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
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    Location? pre_userLocation;
    try{
      pre_userLocation=Location.fromJson(json['user_location'] ?? <String, dynamic>{});
   }catch(_){}
    userLocation = pre_userLocation;
    String? pre_query;
    try{
      pre_query=json['query'];
   }catch(_){}
    query = pre_query;
    String? pre_resultId;
    try{
      pre_resultId=json['result_id'];
   }catch(_){}
    resultId = pre_resultId;
    String? pre_inlineMessageId;
    try{
      pre_inlineMessageId=json['inline_message_id'];
   }catch(_){}
    inlineMessageId = pre_inlineMessageId;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    int? pre_chatInstance;
    try{
      pre_chatInstance=int.tryParse(json['chat_instance'] ?? "");
   }catch(_){}
    chatInstance = pre_chatInstance;
    CallbackQueryPayload? pre_payload;
    try{
      pre_payload=CallbackQueryPayload.fromJson(json['payload'] ?? <String, dynamic>{});
   }catch(_){}
    payload = pre_payload;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    String? pre_inlineMessageId;
    try{
      pre_inlineMessageId=json['inline_message_id'];
   }catch(_){}
    inlineMessageId = pre_inlineMessageId;
    int? pre_chatInstance;
    try{
      pre_chatInstance=int.tryParse(json['chat_instance'] ?? "");
   }catch(_){}
    chatInstance = pre_chatInstance;
    CallbackQueryPayload? pre_payload;
    try{
      pre_payload=CallbackQueryPayload.fromJson(json['payload'] ?? <String, dynamic>{});
   }catch(_){}
    payload = pre_payload;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    String? pre_invoicePayload;
    try{
      pre_invoicePayload=json['invoice_payload'];
   }catch(_){}
    invoicePayload = pre_invoicePayload;
    Address? pre_shippingAddress;
    try{
      pre_shippingAddress=Address.fromJson(json['shipping_address'] ?? <String, dynamic>{});
   }catch(_){}
    shippingAddress = pre_shippingAddress;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
    String? pre_currency;
    try{
      pre_currency=json['currency'];
   }catch(_){}
    currency = pre_currency;
    int? pre_totalAmount;
    try{
      pre_totalAmount=json['total_amount'];
   }catch(_){}
    totalAmount = pre_totalAmount;
    String? pre_invoicePayload;
    try{
      pre_invoicePayload=json['invoice_payload'];
   }catch(_){}
    invoicePayload = pre_invoicePayload;
    String? pre_shippingOptionId;
    try{
      pre_shippingOptionId=json['shipping_option_id'];
   }catch(_){}
    shippingOptionId = pre_shippingOptionId;
    OrderInfo? pre_orderInfo;
    try{
      pre_orderInfo=OrderInfo.fromJson(json['order_info'] ?? <String, dynamic>{});
   }catch(_){}
    orderInfo = pre_orderInfo;
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
    String? pre_event;
    try{
      pre_event=json['event'];
   }catch(_){}
    event = pre_event;
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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_data;
    try{
      pre_data=json['data'];
   }catch(_){}
    data = pre_data;
    int? pre_timeout;
    try{
      pre_timeout=json['timeout'];
   }catch(_){}
    timeout = pre_timeout;
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
    Poll? pre_poll;
    try{
      pre_poll=Poll.fromJson(json['poll'] ?? <String, dynamic>{});
   }catch(_){}
    poll = pre_poll;
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
    int? pre_pollId;
    try{
      pre_pollId=int.tryParse(json['poll_id'] ?? "");
   }catch(_){}
    pollId = pre_pollId;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    List<int>? pre_optionIds;
    try{
      pre_optionIds=List<int>.from((json['option_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    optionIds = pre_optionIds;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_actorUserId;
    try{
      pre_actorUserId=json['actor_user_id'];
   }catch(_){}
    actorUserId = pre_actorUserId;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    ChatInviteLink? pre_inviteLink;
    try{
      pre_inviteLink=ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    inviteLink = pre_inviteLink;
    ChatMember? pre_oldChatMember;
    try{
      pre_oldChatMember=ChatMember.fromJson(json['old_chat_member'] ?? <String, dynamic>{});
   }catch(_){}
    oldChatMember = pre_oldChatMember;
    ChatMember? pre_newChatMember;
    try{
      pre_newChatMember=ChatMember.fromJson(json['new_chat_member'] ?? <String, dynamic>{});
   }catch(_){}
    newChatMember = pre_newChatMember;
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
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    ChatJoinRequest? pre_request;
    try{
      pre_request=ChatJoinRequest.fromJson(json['request'] ?? <String, dynamic>{});
   }catch(_){}
    request = pre_request;
    ChatInviteLink? pre_inviteLink;
    try{
      pre_inviteLink=ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
   }catch(_){}
    inviteLink = pre_inviteLink;
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