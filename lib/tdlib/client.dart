import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:myapp/tdlib/tdlibUtils.dart';
import "package:path/path.dart" as path;
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:myapp/constants.dart';
import 'package:myapp/secrets.dart' as secrets;
import 'package:myapp/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:isolate';
import 'package:async/async.dart' show StreamGroup;

import "src/td_json_client.dart" show JsonClient;
import "src/tdapi/tdapi.dart" hide Text;

/// A controller that handles incoming requests asynchronously and exposes
/// [Observable]s that stream data to their listeners.
class TelegramClient {
  final BehaviorSubject<Update> _updates = BehaviorSubject();

  /// All [Update] objects received by the client are put into a
  /// [BehaviorSubject] whose [Stream] is exposed to other parts of the
  /// application. This way updates can be listened to, filtered, mapped, and
  /// Flutter widgets can rebuild in response to them with a StreamBuilder.
  Stream<Update> get updates => _updates.stream;

  /// A convenience getter that streams [AuthorizationState]s. It does this by
  /// filtering for [updates] that are [UpdateAuthorizationState]s and yields
  /// the new authorization state.
  Stream<AuthorizationState> get updateAuthorizationState => updates
      .where((u) => u is UpdateAuthorizationState)
      .map((a) => (a as UpdateAuthorizationState).authorizationState!);

  Stream<UpdateActiveNotifications> get updateActiveNotifications => updates
      .where((u) => u is UpdateActiveNotifications)
      .map((a) => (a as UpdateActiveNotifications));

  Stream<UpdateAnimatedEmojiMessageClicked>
      get updateAnimatedEmojiMessageClicked => updates
          .where((u) => u is UpdateAnimatedEmojiMessageClicked)
          .map((a) => (a as UpdateAnimatedEmojiMessageClicked));

  Stream<UpdateAnimationSearchParameters> get updateAnimationSearchParameters =>
      updates
          .where((u) => u is UpdateAnimationSearchParameters)
          .map((a) => (a as UpdateAnimationSearchParameters));

  Stream<UpdateBasicGroup> get updateBasicGroup => updates
      .where((u) => u is UpdateBasicGroup)
      .map((a) => (a as UpdateBasicGroup));

  Stream<UpdateBasicGroupFullInfo> get updateBasicGroupFullInfo => updates
      .where((u) => u is UpdateBasicGroupFullInfo)
      .map((a) => (a as UpdateBasicGroupFullInfo));

  Stream<Call> get call =>
      updates.where((u) => u is UpdateCall).map((a) => (a as UpdateCall).call!);

  Stream<UpdateChatActionBar> get updateChatActionBar => updates
      .where((u) => u is UpdateChatActionBar)
      .map((a) => (a as UpdateChatActionBar));

  Stream<UpdateChatDefaultDisableNotification>
      get updateChatDefaultDisableNotification => updates
          .where((u) => u is UpdateChatDefaultDisableNotification)
          .map((a) => (a as UpdateChatDefaultDisableNotification));

  Stream<UpdateChatDraftMessage> get updateChatDraftMessage => updates
      .where((u) => u is UpdateChatDraftMessage)
      .map((a) => (a as UpdateChatDraftMessage));

  Stream<UpdateChatHasScheduledMessages> get updateChatHasScheduledMessages =>
      updates
          .where((u) => u is UpdateChatHasScheduledMessages)
          .map((a) => (a as UpdateChatHasScheduledMessages));

  Stream<UpdateChatIsBlocked> get updateChatIsBlocked => updates
      .where((u) => u is UpdateChatIsBlocked)
      .map((a) => (a as UpdateChatIsBlocked));

  Stream<UpdateChatIsMarkedAsUnread> get updateChatisMarkedAsUnread => updates
      .where((u) => u is UpdateChatIsMarkedAsUnread)
      .map((a) => (a as UpdateChatIsMarkedAsUnread));

  Stream<UpdateChatLastMessage> get updateChatLastMessage => updates
      .where((u) => u is UpdateChatLastMessage)
      .map((a) => (a as UpdateChatLastMessage));

  Stream<UpdateChatMember> get updateChatMember => updates
      .where((u) => u is UpdateChatMember)
      .map((a) => (a as UpdateChatMember));

  Stream<UpdateNewChatJoinRequest> get updateNewChatJoinRequest => updates
      .where((u) => u is UpdateNewChatJoinRequest)
      .map((a) => (a as UpdateNewChatJoinRequest));

  Stream<UpdateChatNotificationSettings> get updateChatNotificationSettings =>
      updates
          .where((u) => u is UpdateChatNotificationSettings)
          .map((a) => (a as UpdateChatNotificationSettings));

  Stream<UpdateChatOnlineMemberCount> get updateChatOnlineMemberCount => updates
      .where((u) => u is UpdateChatOnlineMemberCount)
      .map((a) => (a as UpdateChatOnlineMemberCount));

  Stream<UpdateChatPermissions> get updateChatPermissions => updates
      .where((u) => u is UpdateChatPermissions)
      .map((a) => (a as UpdateChatPermissions));

  Stream<UpdateChatPhoto> get _updateChatPhoto => updates
      .where((u) => u is UpdateChatPhoto)
      .map((a) => (a as UpdateChatPhoto));

  Stream<UpdateChatPosition> get updateChatPosition => updates
      .where((u) => u is UpdateChatPosition)
      .map((a) => (a as UpdateChatPosition));

  Stream<UpdateChatReadInbox> get _updateChatReadInbox => updates
      .where((u) => u is UpdateChatReadInbox)
      .map((a) => (a as UpdateChatReadInbox));

  Stream<UpdateChatReadOutbox> get _updateChatReadOutbox => updates
      .where((u) => u is UpdateChatReadOutbox)
      .map((a) => (a as UpdateChatReadOutbox));

  Stream<UpdateChatReplyMarkup> get updateChatReplyMarkup => updates
      .where((u) => u is UpdateChatReplyMarkup)
      .map((a) => (a as UpdateChatReplyMarkup));

  Stream<UpdateChatTheme> get updateChatTheme => updates
      .where((u) => u is UpdateChatTheme)
      .map((a) => (a as UpdateChatTheme));

  Stream<UpdateChatThemes> get updateChatThemes => updates
      .where((u) => u is UpdateChatThemes)
      .map((a) => (a as UpdateChatThemes));

  Stream<UpdateChatPendingJoinRequests> get updateChatPendingJoinRequests =>
      updates
          .where((u) => u is UpdateChatPendingJoinRequests)
          .map((a) => (a as UpdateChatPendingJoinRequests));

  Stream<UpdateChatTitle> get _updateChatTitle => updates
      .where((u) => u is UpdateChatTitle)
      .map((a) => (a as UpdateChatTitle));

  Stream<UpdateChatUnreadMentionCount> get _updateChatUnreadMentionCount =>
      updates
          .where((u) => u is UpdateChatUnreadMentionCount)
          .map((a) => (a as UpdateChatUnreadMentionCount));

  Stream<UpdateChatVideoChat> get updateChatVideoChat => updates
      .where((u) => u is UpdateChatVideoChat)
      .map((a) => (a as UpdateChatVideoChat));

  Stream<ConnectionState> get updateConnectionState => updates
      .where((u) => u is UpdateConnectionState)
      .map((a) => (a as UpdateConnectionState).state!);

  Stream<UpdateDeleteMessages> get updateDeleteMessages => updates
      .where((u) => u is UpdateDeleteMessages)
      .map((a) => (a as UpdateDeleteMessages));

  Stream<List<String>> get updateDiceEmojis => updates
      .where((u) => u is UpdateDiceEmojis)
      .map((a) => (a as UpdateDiceEmojis).emojis!);

  Stream<List<int>> get updateFavoriteStickers => updates
      .where((u) => u is UpdateFavoriteStickers)
      .map((a) => (a as UpdateFavoriteStickers).stickerIds!);

  Stream<File> get updateFile =>
      updates.where((u) => u is UpdateFile).map((a) => (a as UpdateFile).file!);

  Stream<UpdateFileGenerationStart> get updateFileGenerationStart => updates
      .where((u) => u is UpdateFileGenerationStart)
      .map((a) => (a as UpdateFileGenerationStart));

  Stream<UpdateFileGenerationStop> get updateFileGenerationStop => updates
      .where((u) => u is UpdateFileGenerationStop)
      .map((a) => (a as UpdateFileGenerationStop));

  Stream<GroupCall> get updateGroupCall => updates
      .where((u) => u is UpdateGroupCall)
      .map((a) => (a as UpdateGroupCall).groupCall!);

  Stream<UpdateGroupCallParticipant> get updateGroupCallParticipant => updates
      .where((u) => u is UpdateGroupCallParticipant)
      .map((a) => (a as UpdateGroupCallParticipant));

  Stream<UpdateHavePendingNotifications> get updateHavePendingNotifications =>
      updates
          .where((u) => u is UpdateHavePendingNotifications)
          .map((a) => (a as UpdateHavePendingNotifications));

  Stream<UpdateInstalledStickerSets> get updateInstalledStickersets => updates
      .where((u) => u is UpdateInstalledStickerSets)
      .map((a) => (a as UpdateInstalledStickerSets));

  Stream<UpdateLanguagePackStrings> get updateLanguagePackStrings => updates
      .where((u) => u is UpdateLanguagePackStrings)
      .map((a) => (a as UpdateLanguagePackStrings));

  Stream<UpdateMessageContent> get updateMessageContent => updates
      .where((u) => u is UpdateMessageContent)
      .map((a) => (a as UpdateMessageContent));

  Stream<UpdateMessageContentOpened> get updateMessageContentOpened => updates
      .where((u) => u is UpdateMessageContentOpened)
      .map((a) => (a as UpdateMessageContentOpened));

  Stream<UpdateMessageEdited> get updateMessageEdited => updates
      .where((u) => u is UpdateMessageEdited)
      .map((a) => (a as UpdateMessageEdited));

  Stream<UpdateMessageInteractionInfo> get updateMessageInteractionInfo =>
      updates
          .where((u) => u is UpdateMessageInteractionInfo)
          .map((a) => (a as UpdateMessageInteractionInfo));

  Stream<UpdateMessageIsPinned> get updateMessageIsPinned => updates
      .where((u) => u is UpdateMessageIsPinned)
      .map((a) => (a as UpdateMessageIsPinned));

  Stream<UpdateMessageLiveLocationViewed> get updateMessageLiveLocationViewed =>
      updates
          .where((u) => u is UpdateMessageLiveLocationViewed)
          .map((a) => (a as UpdateMessageLiveLocationViewed));

  Stream<UpdateMessageMentionRead> get _updateMessageMentionRead => updates
      .where((u) => u is UpdateMessageMentionRead)
      .map((a) => (a as UpdateMessageMentionRead));

  Stream<UpdateMessageSendAcknowledged> get updateMessageSendAcknowledged =>
      updates
          .where((u) => u is UpdateMessageSendAcknowledged)
          .map((a) => (a as UpdateMessageSendAcknowledged));

  Stream<UpdateMessageSendFailed> get updateMessageSendFailed => updates
      .where((u) => u is UpdateMessageSendFailed)
      .map((a) => (a as UpdateMessageSendFailed));

  Stream<UpdateMessageSendSucceeded> get updateMessageSendSucceeded => updates
      .where((u) => u is UpdateMessageSendSucceeded)
      .map((a) => (a as UpdateMessageSendSucceeded));

  Stream<UpdateNewCallbackQuery> get updateNewCallackQuery => updates
      .where((u) => u is UpdateNewCallbackQuery)
      .map((a) => (a as UpdateNewCallbackQuery));

  Stream<UpdateNewCallSignalingData> get updateNewCallSignalingData => updates
      .where((u) => u is UpdateNewCallSignalingData)
      .map((a) => (a as UpdateNewCallSignalingData));

  Stream<Chat> get updateNewChat => updates
      .where((u) => u is UpdateNewChat)
      .map((a) => (a as UpdateNewChat).chat!);

  Stream<UpdateNewChosenInlineResult> get updateNewChosenInlineResult => updates
      .where((u) => u is UpdateNewChosenInlineResult)
      .map((a) => (a as UpdateNewChosenInlineResult));

  Stream<UpdateNewCustomEvent> get updateNewCustomEvent => updates
      .where((u) => u is UpdateNewCustomEvent)
      .map((a) => (a as UpdateNewCustomEvent));

  Stream<UpdateNewCustomQuery> get updateNewCustomQuery => updates
      .where((u) => u is UpdateNewCustomQuery)
      .map((a) => (a as UpdateNewCustomQuery));

  Stream<UpdateNewInlineCallbackQuery> get updateNewInlineCallbackQuery =>
      updates
          .where((u) => u is UpdateNewInlineCallbackQuery)
          .map((a) => (a as UpdateNewInlineCallbackQuery));

  Stream<UpdateNewInlineQuery> get updateNewInlinequery => updates
      .where((u) => u is UpdateNewInlineQuery)
      .map((a) => (a as UpdateNewInlineQuery));

  Stream<Message> get updateNewMessage => updates
      .where((u) => u is UpdateNewMessage)
      .map((a) => (a as UpdateNewMessage).message!);

  Stream<UpdateNewPreCheckoutQuery> get updateNewPreCheckoutQuery => updates
      .where((u) => u is UpdateNewPreCheckoutQuery)
      .map((a) => (a as UpdateNewPreCheckoutQuery));

  Stream<UpdateNewShippingQuery> get updatenewshippingquery => updates
      .where((u) => u is UpdateNewShippingQuery)
      .map((a) => (a as UpdateNewShippingQuery));

  Stream<UpdateNotification> get updateNotification => updates
      .where((u) => u is UpdateNotification)
      .map((a) => (a as UpdateNotification));

  Stream<UpdateNotificationGroup> get updateNotificationGroup => updates
      .where((u) => u is UpdateNotificationGroup)
      .map((a) => (a as UpdateNotificationGroup));

  Stream<UpdateOption> get updateOption =>
      updates.where((u) => u is UpdateOption).map((a) => (a as UpdateOption));

  Stream<Poll> get updatePoll =>
      updates.where((u) => u is UpdatePoll).map((a) => (a as UpdatePoll).poll!);

  Stream<UpdatePollAnswer> get updatePollAnswer => updates
      .where((u) => u is UpdatePollAnswer)
      .map((a) => (a as UpdatePollAnswer));

  Stream<UpdateRecentStickers> get updateRecentStickers => updates
      .where((u) => u is UpdateRecentStickers)
      .map((a) => (a as UpdateRecentStickers));

  Stream<List<int>> get updateSavedAnimations => updates
      .where((u) => u is UpdateSavedAnimations)
      .map((a) => (a as UpdateSavedAnimations).animationIds!);

  Stream<UpdateScopeNotificationSettings> get updateScopeNotificationSettings =>
      updates
          .where((u) => u is UpdateScopeNotificationSettings)
          .map((a) => (a as UpdateScopeNotificationSettings));

  Stream<UpdateSecretChat> get updateSecretChat => updates
      .where((u) => u is UpdateSecretChat)
      .map((a) => (a as UpdateSecretChat));

  Stream<UpdateSelectedBackground> get selectedBackground => updates
      .where((u) => u is UpdateSelectedBackground)
      .map((a) => (a as UpdateSelectedBackground));

  Stream<UpdateServiceNotification> get updateServiceNotification => updates
      .where((u) => u is UpdateServiceNotification)
      .map((a) => (a as UpdateServiceNotification));

  Stream<UpdateStickerSet> get updateStickerSet => updates
      .where((u) => u is UpdateStickerSet)
      .map((a) => (a as UpdateStickerSet));

  Stream<UpdateSuggestedActions> get updateSuggestedActions => updates
      .where((u) => u is UpdateSuggestedActions)
      .map((a) => (a as UpdateSuggestedActions));

  Stream<UpdateSupergroup> get updateSupergroup => updates
      .where((u) => u is UpdateSupergroup)
      .map((a) => (a as UpdateSupergroup));

  Stream<UpdateSupergroupFullInfo> get updateSupergroupFullInfo => updates
      .where((u) => u is UpdateSupergroupFullInfo)
      .map((a) => (a as UpdateSupergroupFullInfo));

  Stream<UpdateTermsOfService> get updateTermsOfService => updates
      .where((u) => u is UpdateTermsOfService)
      .map((a) => (a as UpdateTermsOfService));

  Stream<UpdateTrendingStickerSets> get updateTrendingStickerSets => updates
      .where((u) => u is UpdateTrendingStickerSets)
      .map((a) => (a as UpdateTrendingStickerSets));

  Stream<UpdateUnreadChatCount> get updateUnreadChatCount => updates
      .where((u) => u is UpdateUnreadChatCount)
      .map((a) => (a as UpdateUnreadChatCount));

  Stream<UpdateUnreadMessageCount> get updateUnreadMessageCount => updates
      .where((u) => u is UpdateUnreadMessageCount)
      .map((a) => (a as UpdateUnreadMessageCount));

  Stream<UpdateUser> get updateuser =>
      updates.where((u) => u is UpdateUser).map((a) => (a as UpdateUser));

  Stream<UpdateChatAction> get _updateChatAction => updates
      .where((u) => u is UpdateChatAction)
      .map((a) => (a as UpdateChatAction));

  Stream<UpdateUserFullInfo> get updateUserFulIinfo => updates
      .where((u) => u is UpdateUserFullInfo)
      .map((a) => (a as UpdateUserFullInfo));

  Stream<UpdateUserPrivacySettingRules> get updateUserPrivacySettingRules =>
      updates
          .where((u) => u is UpdateUserPrivacySettingRules)
          .map((a) => (a as UpdateUserPrivacySettingRules));

  Stream<List<ChatNearby>> get updateUsersNearby => updates
      .where((u) => u is UpdateUsersNearby)
      .map((a) => (a as UpdateUsersNearby).usersNearby!);

  Stream<UpdateUserStatus> get _updateUserStatus => updates
      .where((u) => u is UpdateUserStatus)
      .map((a) => (a as UpdateUserStatus));

  Stream<UpdateChatHasProtectedContent> get updateChatHasProtectedContent =>
      updates
          .where((u) => u is UpdateChatHasProtectedContent)
          .map((a) => a as UpdateChatHasProtectedContent);

  Stream<UpdateChatMessageTtl> get updateChatMessageTtl => updates
      .where((u) => u is UpdateChatMessageTtl)
      .map((a) => a as UpdateChatMessageTtl);

  Stream<UpdateChatMessageSender> get updateChatMessageSender => updates
      .where((u) => u is UpdateChatMessageSender)
      .map((a) => a as UpdateChatMessageSender);

  late TdlibParameters tdlibParameters;
  int me = 0;
  String userLocale = "en";
  String userLangPackId = "en";
  static const String localizationTarget = "tdesktop";

  Widget buildTextByKey(String key, TextStyle style,
      {Map<String, String>? replacing, String? languagePackId}) {
    languagePackId ??= userLangPackId;

    String text = getTranslation(key, replacing: replacing);

    return Text(text, style: style);
  }

  String? _dbPath;
  String? _filesPath;

  Future setTdlibParameters(
      {bool? useTestDc,
      String? databaseDirectory,
      String? filesDirectory,
      bool useFileDatabase = true,
      bool useMessageDatabase = true,
      bool useChatInfoDatabase = true,
      bool useSecretChats = false,
      String? apiHash,
      int? apiId,
      String? systemLanguageCode,
      String? deviceModel,
      String? systemVersion}) async {
    useTestDc ??= false;
    databaseDirectory ??= getDatabaseDirectory();
    filesDirectory ??= getFilesDirectory();
    apiHash ??= secrets.appHash;
    apiId ??= secrets.appId;
    systemLanguageCode ??= getUserLocale();
    deviceModel ??= getDeviceName();

    if (deviceModel.isEmpty) {
      deviceModel = getSystemVersion();
    }
    systemVersion ??= getSystemVersion();

    _dbPath = databaseDirectory;
    _filesPath = filesDirectory;

    send(SetOption(
        name: "localization_target",
        value: OptionValueString(value: "tdesktop")));
    send(SetOption(
        name: "language_pack_database_path",
        value: OptionValueString(value: getLanguagePackDatabasePath())));
    send(SetOption(
        name: "language_pack_id",
        value: OptionValueString(value: userLangPackId)));

    tdlibParameters = TdlibParameters(
        useTestDc: useTestDc,
        databaseDirectory: databaseDirectory,
        filesDirectory: filesDirectory,
        applicationVersion: appVersion,
        useFileDatabase: useFileDatabase,
        useMessageDatabase: useMessageDatabase,
        useChatInfoDatabase: useChatInfoDatabase,
        useSecretChats: useSecretChats,
        apiHash: apiHash,
        apiId: apiId,
        systemLanguageCode: systemLanguageCode,
        deviceModel: deviceModel,
        systemVersion: systemVersion);

    await send(SetTdlibParameters(parameters: tdlibParameters));
    updateOption.listen((UpdateOption event) {
      if (event.name! == "my_id" && event.value is OptionValueInteger) {
        me = (event.value as OptionValueInteger).value!;
      }
    });

    updateNewChat.listen((event) {
      _chats[event.id!] = event;
      _subscribeChatOnUpdates(event.id!, (event) => _chats[event.id!] = event);
    });
    updateuser.listen((event) => _users[event.user!.id!] = event.user!);
    updateBasicGroup.listen(
        (event) => _basicGroups[event.basicGroup!.id!] = event.basicGroup!);
    updateSupergroup.listen(
        (event) => _supergroups[event.supergroup!.id!] = event.supergroup!);
    updateSecretChat.listen(
        (event) => _secretChats[event.secretChat!.id!] = event.secretChat!);
  }

  Map<int, Chat> getChats() => _chats;

  final Map<int, SecretChat> _secretChats = {};
  SecretChat getSecretChat(int id) => _secretChats[id]!;

  final Map<int, Supergroup> _supergroups = {};
  Supergroup getSupergroup(int id) => _supergroups[id]!;

  final Map<int, BasicGroup> _basicGroups = {};
  BasicGroup getBasicGroup(int id) => _basicGroups[id]!;

  final Map<int, User> _users = {};
  User getUser(int id) => _users[id]!;

  final Map<int, Chat> _chats = {};
  Chat getChat(int id) => _chats[id]!;

  static final Map<String, String> _400errorMessages = {
    "PHONE_NUMBER_INVALID": "lng_bad_phone",
    "PHONE_CODE_HASH_EMPTY": "lng_bad_phone",
    "PHONE_CODE_INVALID": "lng_bad_code",
    "PHONE_CODE_EMPTY": "lng_bad_code",
    "PHONE_CODE_EXPIRED": "lng_bad_code",
    "FIRSTNAME_INVALID": "lng_bad_name",
    "LASTNAME_INVALID": "lng_bad_name",
  };

  String? getLocalizedErrorMessage(TdError error) {
    String? key;
    if (error.code == 400 && error.code != 406) {
      key = _400errorMessages[error.message];
    } else if (error.code == 420) {
      key = "lng_flood_error";
    } else if (error.code == 429) {
      return error.message;
    }
    if (key != null) return getTranslation(key);
  }

  Stream<Map<MessageSender, ChatAction>?> actionsOf(int chatId) async* {
    int senderId(MessageSender s) {
      return s is MessageSenderChat
          ? s.chatId!
          : (s as MessageSenderUser).userId!;
    }

    Map<MessageSender, ChatAction> actions = {};
    await for (var a in _updateChatAction) {
      if (a.chatId == chatId) {
        actions[a.senderId!] = a.action!;
        if (a.action is ChatActionCancel) {
          var keyList = actions.keys.toList();
          for (int i = 0; i < actions.length; i++) {
            if (senderId(keyList[i]) == senderId(a.senderId!)) {
              actions.remove(keyList[i]);
            }
          }
        }
        yield actions;
      }
    }
  }

  Stream<List<ChatFilterInfo>> filters() async* {
    await for (final update in _updates) {
      if (update is UpdateChatFilters) {
        yield update.chatFilters!;
      }
    }
  }

  Stream<String> titleOf(int chatId) async* {
    await for (final title in _updateChatTitle) {
      if (title.chatId == chatId) yield title.title!;
    }
  }

  Stream<int> unreadMentionCountOf(int chatId) async* {
    await for (final mentionUpdate in StreamGroup.merge(
        [_updateChatUnreadMentionCount, _updateMessageMentionRead])) {
      var d = mentionUpdate as dynamic;
      if (d.chatId == chatId) {
        yield (d.unreadMentionCount as int);
      }
    }
  }

  Stream<ChatPhotoInfo?> photoOf(int chatId) async* {
    await for (final photo in _updateChatPhoto) {
      if (photo.chatId == chatId) yield photo.photo;
    }
  }

  Stream<int> unreadCountOf(int chatId) async* {
    await for (final inbox in _updateChatReadInbox) {
      if (inbox.chatId == chatId) yield inbox.unreadCount!;
    }
  }

  Stream<int> chatReadOutboxOf(int chatId) async* {
    await for (final outb in _updateChatReadOutbox) {
      if (outb.chatId == chatId) yield outb.lastReadOutboxMessageId!;
    }
  }

  Stream<UserStatus> statusOf(int userId) async* {
    await for (final status in _updateUserStatus) {
      if (status.userId == userId) yield status.status!;
    }
  }

  Stream<int> onlineMemebersIn(int chatId) async* {
    await for (final update in updateChatOnlineMemberCount) {
      if (update.chatId == chatId) yield update.onlineMemberCount!;
    }
  }

  Stream<UpdateUnreadChatCount> unreadIn(ChatList chatList) async* {
    int getChatListId(ChatList list) =>
        list is ChatListFilter ? list.chatFilterId! : 0;
    var listId = getChatListId(chatList);

    await for (final update in updateUnreadChatCount) {
      if (update.chatList.runtimeType == chatList.runtimeType) {
        if (listId == getChatListId(update.chatList!)) {
          yield update;
        }
      }
    }
  }

  void _subscribeChatOnUpdates(int id, Function(Chat c) callback) {
    var base = getChat(id);
    void updateChat(Update u, Function() f) {
      if ((u as dynamic).chatId == id) {
        f();
        callback(base);
      }
    }

    updateChatActionBar.listen(
        (event) => updateChat(event, () => base.actionBar = event.actionBar));
    updateChatDefaultDisableNotification.listen((event) => updateChat(
        event,
        () => base.defaultDisableNotification =
            event.defaultDisableNotification));
    updateChatDraftMessage.listen((event) => updateChat(event, () {
          base.positions = event.positions;
          base.draftMessage = event.draftMessage;
        }));
    updateChatHasProtectedContent.listen((event) => updateChat(
        event, () => base.hasProtectedContent = event.hasProtectedContent));
    updateChatHasScheduledMessages.listen((event) => updateChat(
        event, () => base.hasScheduledMessages = event.hasScheduledMessages));
    updateChatIsBlocked.listen(
        (event) => updateChat(event, () => base.isBlocked = event.isBlocked));
    updateChatisMarkedAsUnread.listen((event) => updateChat(
        event, () => base.isMarkedAsUnread = event.isMarkedAsUnread));
    updateChatLastMessage.listen((event) => updateChat(event, () {
          base.positions = event.positions;
          base.lastMessage = event.lastMessage;
        }));
    updateChatMessageSender.listen((event) =>
        updateChat(event, () => base.messageSenderId = event.messageSenderId));
    updateChatMessageTtl.listen(
        (event) => updateChat(event, () => base.messageTtl = event.messageTtl));
    updateChatNotificationSettings.listen((event) => updateChat(
        event, () => base.notificationSettings = event.notificationSettings));
    updateChatPendingJoinRequests.listen((event) => updateChat(
        event, () => base.pendingJoinRequests = event.pendingJoinRequests));
    updateChatPermissions.listen((event) =>
        updateChat(event, () => base.permissions = event.permissions));
    _updateChatPhoto
        .listen((event) => updateChat(event, () => base.photo = event.photo));
    _updateChatReadInbox.listen((event) => updateChat(event,
        () => base.lastReadInboxMessageId = event.lastReadInboxMessageId));
    _updateChatReadOutbox.listen((event) => updateChat(event,
        () => base.lastReadOutboxMessageId = event.lastReadOutboxMessageId));
    updateChatReplyMarkup.listen((event) => updateChat(
        event, () => base.replyMarkupMessageId = event.replyMarkupMessageId));
    updateChatTheme.listen(
        (event) => updateChat(event, () => base.themeName = event.themeName));
    _updateChatTitle
        .listen((event) => updateChat(event, () => base.title = event.title));
    _updateChatUnreadMentionCount.listen((event) => updateChat(
        event, () => base.unreadMentionCount = event.unreadMentionCount));
    updateChatVideoChat.listen(
        (event) => updateChat(event, () => base.videoChat = event.videoChat));
    updateChatPosition.listen((event) => updateChat(event, () {
          bool finded = false;
          for (int i = 0; i < base.positions!.length; i++) {
            if (base.positions![i].list == event.position!.list) {
              finded = true;
              base.positions![i] = event.position!;
            }
          }
          if (!finded) base.positions!.add(event.position!);
        }));
  }

  String getTranslation(String key,
      {String? languagePackDatabasePath,
      String? languagePackId,
      String? localizationTarget,
      Map<String, String>? replacing,
      int? itemsCount}) {
    languagePackDatabasePath ??= getLanguagePackDatabasePath();
    languagePackId ??= userLangPackId;
    localizationTarget ??= TelegramClient.localizationTarget;

    var result = _sendClient!.execute(GetLanguagePackString(
        key: key,
        localizationTarget: localizationTarget,
        languagePackId: languagePackId,
        languagePackDatabasePath: languagePackDatabasePath));

    String translate = "";

    if (result is LanguagePackStringValueDeleted) {
      translate = getTranslation(key, languagePackId: "en");
    }
    if (result is LanguagePackStringValueOrdinary) {
      translate = result.value!;
    }
    if (result is LanguagePackStringValuePluralized) {
      assert(result is LanguagePackStringValuePluralized && itemsCount != null);
      if (itemsCount == 0) {
        translate = result.zeroValue!;
      } else if (itemsCount == 1) {
        translate = result.oneValue!;
      } else if (itemsCount == 2) {
        translate = result.twoValue!;
      } else if (itemsCount! <= 3) {
        translate = result.fewValue!;
      } else if (itemsCount <= 10) {
        translate = result.manyValue!;
      }
      if (translate.isEmpty) translate = result.otherValue!;
    }

    if (replacing != null) {
      replacing.forEach((key, value) {
        translate = translate.replaceAll(key, value);
      });
    }

    return translate;
  }

  final List<Update> _cachedUpdates = [];
  bool _shouldSendUpdates = false;

  void startReceiveUpdates() {
    _shouldSendUpdates = true;
    for (var element in _cachedUpdates) {
      _updates.add(element);
    }
  }

  Future<void> init() async {
    Completer completer = Completer<void>();
    var receive = await initIsolate();
    receive.listen((message) {
      if (message is int) {
        Pointer<Void> pointer = Pointer.fromAddress(message);
        _sendClient = JsonClient.create(path.join("Assets", "bin", "tdlib"),
            clientPointer: pointer);
        completer.complete();
      }

      if (message is String) {
        var tdobject = convertToObject(message);
        var extra = json.decode(message)["@extra"];
        if (extra == null) {
          tdobject as Update;
          if (!_shouldSendUpdates && tdobject is! UpdateAuthorizationState) {
            _cachedUpdates.add(tdobject);
          } else {
            _updates.add(tdobject);
          }
        } else {
          _requestsQueue[extra as int]!(tdobject);
          _requestsQueue.remove(extra);
        }
      }
    });
    return completer.future;
  }

  JsonClient? _sendClient;
  final Map<int, Function(TdObject)> _requestsQueue = {};
  Isolate? _isolate;

  Future<ReceivePort> initIsolate() async {
    ReceivePort isolateToMainStream = ReceivePort();
    _isolate = await Isolate.spawn(_tdlib_listen, isolateToMainStream.sendPort,
        errorsAreFatal: false);
    return isolateToMainStream;
  }

  /// Synchronously performs any necessary cleanup before [destroy]ing this
  /// client.
  void destroy() {
    _isolate!.kill(priority: Isolate.immediate);
    var destoryPort = ReceivePort();
    destoryPort.doOnData((_) => _sendClient!.destroy());
    _isolate!.addOnExitListener(destoryPort.sendPort);
  }

  int _extra = 1;
  Future<TdObject> send(dynamic function) async {
    final Completer<TdObject> _completer = Completer<TdObject>();
    function.extra = _extra;
    _sendClient!.send(function);
    _requestsQueue[_extra] = _completer.complete;
    _extra++;
    return _completer.future;
  }
}

void _tdlib_listen(SendPort isolateToMainStream) {
  ReceivePort mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);
  var client = JsonClient.create(path.join("Assets", "bin", "tdlib"));
  isolateToMainStream.send(client.client.address);
  client.incomingString().listen((update) {
    isolateToMainStream.send(update);
  });
}
