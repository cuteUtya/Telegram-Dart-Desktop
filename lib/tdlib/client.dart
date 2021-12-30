import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:meta/meta.dart';
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

  Stream<Message?> lastMessageIn(int chatId) async* {
    await for (final update in updateChatLastMessage) {
      if (update.chatId == chatId) yield update.lastMessage;
    }
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
        var extra = (tdobject as dynamic).extra;
        if (tdobject is Update) {
          switch (tdobject.runtimeType) {
            case UpdateChatActionBar:
              tdobject as UpdateChatActionBar;
              _chats[tdobject.chatId!]!.actionBar = tdobject.actionBar;
              break;
            case UpdateChatDefaultDisableNotification:
              tdobject as UpdateChatDefaultDisableNotification;
              _chats[tdobject.chatId]!.defaultDisableNotification =
                  tdobject.defaultDisableNotification;
              break;
            case UpdateChatDraftMessage:
              tdobject as UpdateChatDraftMessage;
              _chats[tdobject.chatId!]!.draftMessage = tdobject.draftMessage;
              _chats[tdobject.chatId!]!.positions = tdobject.positions;
              break;
            case UpdateChatHasProtectedContent:
              tdobject as UpdateChatHasProtectedContent;
              _chats[tdobject.chatId!]!.hasProtectedContent =
                  tdobject.hasProtectedContent;
              break;
            case UpdateChatHasScheduledMessages:
              tdobject as UpdateChatHasScheduledMessages;
              _chats[tdobject.chatId!]!.hasScheduledMessages =
                  tdobject.hasScheduledMessages;
              break;
            case UpdateChatIsBlocked:
              tdobject as UpdateChatIsBlocked;
              _chats[tdobject.chatId!]!.isBlocked = tdobject.isBlocked;
              break;
            case UpdateChatIsMarkedAsUnread:
              tdobject as UpdateChatIsMarkedAsUnread;
              _chats[tdobject.chatId!]!.isMarkedAsUnread =
                  tdobject.isMarkedAsUnread;
              break;
            case UpdateChatLastMessage:
              tdobject as UpdateChatLastMessage;
              _chats[tdobject.chatId!]!.positions = tdobject.positions;
              _chats[tdobject.chatId!]!.lastMessage = tdobject.lastMessage;
              break;
            case UpdateChatMessageSender:
              tdobject as UpdateChatMessageSender;
              _chats[tdobject.chatId!]!.messageSenderId =
                  tdobject.messageSenderId;
              break;
            case UpdateChatMessageTtl:
              tdobject as UpdateChatMessageTtl;
              _chats[tdobject.chatId!]!.messageTtl = tdobject.messageTtl;
              break;
            case UpdateChatNotificationSettings:
              tdobject as UpdateChatNotificationSettings;
              _chats[tdobject.chatId!]!.notificationSettings =
                  tdobject.notificationSettings;
              break;
            case UpdateChatPendingJoinRequests:
              tdobject as UpdateChatPendingJoinRequests;
              _chats[tdobject.chatId!]!.pendingJoinRequests =
                  tdobject.pendingJoinRequests;
              break;
            case UpdateChatPermissions:
              tdobject as UpdateChatPermissions;
              _chats[tdobject.chatId!]!.permissions = tdobject.permissions;
              break;
            case UpdateChatPhoto:
              tdobject as UpdateChatPhoto;
              _chats[tdobject.chatId!]!.photo = tdobject.photo;
              break;
            case UpdateChatReadInbox:
              tdobject as UpdateChatReadInbox;
              _chats[tdobject.chatId!]!.lastReadInboxMessageId =
                  tdobject.lastReadInboxMessageId;
              break;
            case UpdateChatReadOutbox:
              tdobject as UpdateChatReadOutbox;
              _chats[tdobject.chatId!]!.lastReadOutboxMessageId =
                  tdobject.lastReadOutboxMessageId;
              break;
            case UpdateChatReplyMarkup:
              tdobject as UpdateChatReplyMarkup;
              _chats[tdobject.chatId!]!.replyMarkupMessageId =
                  tdobject.replyMarkupMessageId;
              break;
            case UpdateChatTheme:
              tdobject as UpdateChatTheme;
              _chats[tdobject.chatId!]!.themeName = tdobject.themeName;
              break;
            case UpdateChatTitle:
              tdobject as UpdateChatTitle;
              _chats[tdobject.chatId!]!.title = tdobject.title;
              break;
            case UpdateChatUnreadMentionCount:
              tdobject as UpdateChatUnreadMentionCount;
              _chats[tdobject.chatId!]!.unreadMentionCount =
                  tdobject.unreadMentionCount;
              break;
            case UpdateChatVideoChat:
              tdobject as UpdateChatVideoChat;
              _chats[tdobject.chatId!]!.videoChat = tdobject.videoChat;
              break;
            case UpdateChatPosition:
              tdobject as UpdateChatPosition;
              bool finded = false;
              var base = _chats[tdobject.chatId]!;
              for (int i = 0; i < base.positions!.length; i++) {
                if (base.positions![i].list == tdobject.position!.list) {
                  finded = true;
                  base.positions![i] = tdobject.position!;
                }
              }
              if (!finded) base.positions!.add(tdobject.position!);
              break;
            case UpdateUser:
              tdobject as UpdateUser;
              _users[tdobject.user!.id!] = tdobject.user!;
              break;
            case UpdateNewChat:
              tdobject as UpdateNewChat;
              _chats[tdobject.chat!.id!] = tdobject.chat!;
              break;
            case UpdateBasicGroup:
              tdobject as UpdateBasicGroup;
              _basicGroups[tdobject.basicGroup!.id!] = tdobject.basicGroup!;
              break;
            case UpdateSupergroup:
              tdobject as UpdateSupergroup;
              _supergroups[tdobject.supergroup!.id!] = tdobject.supergroup!;
              break;
            case UpdateSecretChat:
              tdobject as UpdateSecretChat;
              _secretChats[tdobject.secretChat!.id!] = tdobject.secretChat!;
              break;
          }
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
