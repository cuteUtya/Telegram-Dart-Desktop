import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import "package:path/path.dart" as path;
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:myapp/constants.dart';
import 'package:myapp/secrets.dart' as secrets;
import 'package:myapp/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:isolate';
import 'package:async/async.dart' show StreamGroup;

import "src/td_json_client.dart" show JsonClient;

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
      get _updateAnimatedEmojiMessageClicked => updates
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

  Stream<UpdateChatTheme> get _updateChatTheme => updates
      .where((u) => u is UpdateChatTheme)
      .map((a) => (a as UpdateChatTheme));

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

  Stream<UpdateDeleteMessages> get _updateDeleteMessages => updates
      .where((u) => u is UpdateDeleteMessages)
      .map((a) => (a as UpdateDeleteMessages));

  Stream<List<String>> get updateDiceEmojis => updates
      .where((u) => u is UpdateDiceEmojis)
      .map((a) => (a as UpdateDiceEmojis).emojis!);

  Stream<List<int>> get updateFavoriteStickers => updates
      .where((u) => u is UpdateFavoriteStickers)
      .map((a) => (a as UpdateFavoriteStickers).stickerIds!);

  Stream<File> get _updateFile =>
      updates.where((u) => u is UpdateFile).map((a) => (a as UpdateFile).file!);

  Stream<UpdateFileGenerationStart> get updateFileGenerationStart => updates
      .where((u) => u is UpdateFileGenerationStart)
      .map((a) => (a as UpdateFileGenerationStart));

  Stream<UpdateChatUnreadReactionCount> get _updateChatUnreadReactionCount =>
      updates
          .where((u) => u is UpdateChatUnreadReactionCount)
          .map((a) => (a as UpdateChatUnreadReactionCount));

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

  Stream<UpdateMessageContent> get _updateMessageContent => updates
      .where((u) => u is UpdateMessageContent)
      .map((a) => (a as UpdateMessageContent));

  Stream<UpdateMessageContentOpened> get updateMessageContentOpened => updates
      .where((u) => u is UpdateMessageContentOpened)
      .map((a) => (a as UpdateMessageContentOpened));

  Stream<UpdateMessageEdited> get _updateMessageEdited => updates
      .where((u) => u is UpdateMessageEdited)
      .map((a) => (a as UpdateMessageEdited));

  Stream<UpdateMessageInteractionInfo> get updateMessageInteractionInfo =>
      updates
          .where((u) => u is UpdateMessageInteractionInfo)
          .map((a) => (a as UpdateMessageInteractionInfo));

  Stream<UpdateMessageIsPinned> get _updateMessageIsPinned => updates
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

  Stream<UpdateNewMessage> get _updateNewMessage => updates
      .where((u) => u is UpdateNewMessage)
      .map((a) => (a as UpdateNewMessage));

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

  Stream<UpdateUser> get updateUser =>
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
  String userLocale = "en";
  String userLangPackId = "en";
  static const String localizationTarget = "tdesktop";
  late String languagePackDatabasePath;

  Widget buildTextByKey(String key, TextStyle style,
      {Map<String, String>? replacing,
      String? languagePackId,
      int? itemsCount}) {
    languagePackId ??= userLangPackId;

    String text = getTranslation(
      key,
      replacing: replacing,
      itemsCount: itemsCount,
    );

    return Text(text, style: style);
  }

  final Map<String, OptionValue> _optionsValue = {};
  T? getOptionValue<T>(String name) {
    assert(_optionsValue[name] != null);
    var option = _optionsValue[name];
    if (option is OptionValueEmpty) return null;
    assert(option.runtimeType == T);
    return option as T;
  }

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
    databaseDirectory ??= await getDatabaseDirectory();
    filesDirectory ??= await getFilesDirectory();
    apiHash ??= secrets.appHash;
    apiId ??= secrets.appId;
    systemLanguageCode ??= getUserLocale();
    deviceModel ??= getDeviceName();

    if (deviceModel.isEmpty) {
      deviceModel = getSystemVersion();
    }
    systemVersion ??= getSystemVersion();

    send(SetOption(
        name: "localization_target",
        value: OptionValueString(value: "tdesktop")));
    send(SetOption(
        name: "language_pack_database_path",
        value: OptionValueString(value: await getLanguagePackDatabasePath())));
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
    updateOption.listen(
        (UpdateOption event) => _optionsValue[event.name!] = event.value!);
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

  String _getMsgId(int chatid, int msgId) => "$chatid||$msgId";
  final Map<String, Message> _messages = {};
  Message? getMessage(int chatId, int messageId) =>
      _messages[_getMsgId(chatId, messageId)];

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

  Stream<List<UpdateChatAction>?> actionsOf(int chatId) async* {
    List<UpdateChatAction> actions = [];
    await for (var a in _updateChatAction) {
      if (a.chatId == chatId) {
        var previus = actions.firstWhereOrNull((element) =>
            getSenderId(element.senderId) == getSenderId(a.senderId));
        if (previus == null) {
          if (a.action.runtimeType != ChatActionCancel) {
            actions.add(a);
          }
        } else {
          if (a.action is ChatActionCancel) {
            actions.remove(previus);
          } else {
            actions[actions.indexOf(previus)] = a;
          }
        }
        yield actions;
      }
    }
  }

  String buildUsername(String fname, String? lname) {
    var result = fname;
    if ((lname?.isNotEmpty) ?? false) {
      result += " $lname";
    }
    return result;
  }

  String getChatTitleSync(int chatId) {
    return getChat(chatId).title!;
  }

  String getSenderNameSync(MessageSender sender) {
    if (sender is MessageSenderUser) {
      var user = getUser(sender.userId!);
      return buildUsername(user.firstName!, user.lastName);
    }
    return getChatTitleSync((sender as MessageSenderChat).chatId!);
  }

  void deleteMessageEvent(
      int chatId, int messageId, Function(bool fromCache) callback) {
    late StreamSubscription subscription;
    subscription = _updateDeleteMessages.listen(
      (event) {
        if (event.chatId == chatId && event.messageIds!.contains(messageId)) {
          callback(event.fromCache!);
          subscription.cancel();
        }
      },
    );
  }

  Stream<String> chatThemeIn(int chatId) async* {
    await for (final upd in _updateChatTheme) {
      if (upd.chatId == chatId) yield upd.themeName!;
    }
  }

  Stream<String> senderName(MessageSender senderId) async* {
    if (senderId is MessageSenderChat) {
      await for (var update in _updateChatTitle) {
        if (update.chatId == senderId.chatId) {
          yield update.title!;
        }
      }
    } else if (senderId is MessageSenderUser) {
      await for (var update in updateUser) {
        if (update.user!.id == senderId.userId) {
          var newName =
              buildUsername(update.user!.firstName!, update.user!.lastName);
          yield newName;
        }
      }
    }
  }

  Stream<Message> newMessagesIn(int chatId) async* {
    await for (final update in _updateNewMessage) {
      if (update.message?.chatId == chatId) {
        yield update.message!;
      }
    }
  }

  Map<int, List<ChatPosition>> _allChats = {};

  void _sortChatsOrder(List<ChatOrder> chats) {
    for (int i = chats.length - 1; i > 0; i--) {
      if (chats[i].position.order == 0) {
        chats.remove(chats[i]);
      }
    }
    chats.sort((b, a) => a.position.order!.compareTo(b.position.order!));
  }

  List<ChatOrder> getChatsInChatListSync(ChatList chatList) {
    List<ChatOrder> result = [];

    _chats.forEach(
      (key, value) {
        if (_allChats[key] == null) {
          _allChats[key] = value.positions!;
        }
      },
    );

    var l = _allChats.values.toList();
    var v = _allChats.keys.toList();

    for (int i = 0; i < _allChats.length; i++) {
      var ch = l[i].firstWhereOrNull((b) => chatListsEqual(chatList, b.list!));
      if (ch != null) result.add(ChatOrder(v[i], ch));
    }
    _sortChatsOrder(result);
    return result;
  }

  Stream<List<ChatOrder>> chatsInChatList(
      ChatList chatList, List<ChatOrder> initialChats) async* {
    List<ChatOrder> result = initialChats;

    ChatOrder? tryFindChatInResult(int chatId) =>
        result.firstWhereOrNull((l) => chatId == l.chatId);
    void sort() => _sortChatsOrder(result);

    sort();
    yield result;

    await for (final update in _updates.stream) {
      if (update is UpdateChatPosition) {
        var cache = _allChats[update.chatId!];
        if (cache == null) {
          _allChats[update.chatId!] = [update.position!];
        } else {
          var cachedList = cache.firstWhereOrNull(
              (e) => chatListsEqual(e.list!, update.position!.list!));
          if (cachedList == null) {
            cache.add(update.position!);
          } else {
            cache.removeAt(cache.indexOf(cachedList));
            cache.add(update.position!);
          }
        }
        if (chatListsEqual(update.position!.list!, chatList)) {
          var element = tryFindChatInResult(update.chatId!);

          if (element != null) {
            element.position = update.position!;
          } else {
            result.add(ChatOrder(update.chatId!, update.position!));
          }
          sort();
          yield result;
        }
      } else if (update is UpdateChatDraftMessage) {
        _allChats[update.chatId!] = update.positions!;

        var finded = update.positions!
            .firstWhereOrNull((e) => chatListsEqual(e.list!, chatList));
        if (finded != null) {
          var element = tryFindChatInResult(update.chatId!);
          if (element != null) {
            element.position.order = finded.order!;
          } else {
            result.add(ChatOrder(update.chatId!, finded));
          }

          sort();
          yield result;
        }
      } else if (update is UpdateChatLastMessage) {
        _allChats[update.chatId!] = update.positions!;

        var finded = update.positions!
            .firstWhereOrNull((e) => chatListsEqual(e.list!, chatList));
        if (finded != null) {
          var element = tryFindChatInResult(update.chatId!);
          if (element != null) {
            element.position.order = finded.order!;
          } else {
            result.add(ChatOrder(update.chatId!, finded));
          }
          sort();
          yield result;
        }
      }
    }
  }

  Stream<UpdateMessageContent> messageContentChanges(
          int chatId, int messageId) =>
      _updateMessageContent
          .where((upd) => upd.chatId == chatId && upd.messageId == messageId);

  Stream<UpdateMessageEdited> messageEdits(int chatId, int messageId) =>
      _updateMessageEdited
          .where((upd) => upd.chatId == chatId && upd.messageId == messageId);

  Stream<UpdateMessageIsPinned> messagePinState(int chatId, int messageId) =>
      _updateMessageIsPinned
          .where((e) => e.chatId == chatId && e.messageId == messageId);

  Stream<List<ChatFilterInfo>> filters() async* {
    await for (final update in _updates) {
      if (update is UpdateChatFilters) {
        yield update.chatFilters!;
      }
    }
  }

  Stream<UpdateAnimatedEmojiMessageClicked> animatedEmojiClick(
      int chatId, int messageId) async* {
    await for (final update in _updateAnimatedEmojiMessageClicked) {
      if (update.chatId == chatId && update.messageId == messageId) {
        yield update;
      }
    }
  }

  Stream<int> unreadReactionsIn(int chatId) async* {
    await for (final update in _updateChatUnreadReactionCount) {
      if (update.chatId == chatId) {
        yield update.unreadReactionCount!;
      }
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

  static const List<Type> chatUpdates = [
    UpdateChatActionBar,
    UpdateChatDefaultDisableNotification,
    UpdateChatDraftMessage,
    UpdateChatHasProtectedContent,
    UpdateChatHasScheduledMessages,
    UpdateChatIsBlocked,
    UpdateChatIsMarkedAsUnread,
    UpdateChatLastMessage,
    UpdateChatMessageSender,
    UpdateChatMessageTtl,
    UpdateChatNotificationSettings,
    UpdateChatPendingJoinRequests,
    UpdateChatPermissions,
    UpdateChatPhoto,
    UpdateChatReadInbox,
    UpdateChatReadOutbox,
    UpdateChatReplyMarkup,
    UpdateChatTheme,
    UpdateChatTitle,
    UpdateChatUnreadMentionCount,
    UpdateChatVideoChat,
    UpdateChatPosition,
    UpdateMessageMentionRead,
  ];

  Stream<Chat> chatAnyUpdates(int chatId) async* {
    await for (final upd in updates) {
      if (chatUpdates.contains(upd.runtimeType)) {
        bool chatIdMatch = upd.toJson()["chat_id"] == chatId;
        if (chatIdMatch) yield getChat(chatId);
      }
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

  Stream<File> fileUpdates(int fileId) async* {
    await for (final update in _updateFile) {
      if (update.id == fileId) yield update;
    }
  }

  String getTranslation(String key,
      {String? languagePackId,
      String? localizationTarget,
      Map<String, String>? replacing,
      int? itemsCount}) {
    languagePackId ??= userLangPackId;
    localizationTarget ??= TelegramClient.localizationTarget;

    var result = execute(GetLanguagePackString(
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
      assert(itemsCount != null);
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

  ClientData getClientData(int chatId) {
    var j = getChat(chatId);
    if (j.clientData!.isEmpty) {
      return ClientData();
    }
    return ClientData.fromJson(json.decode(j.clientData!));
  }

  void startReceiveUpdates() {
    _shouldSendUpdates = true;
    for (var element in _cachedUpdates) {
      _updates.add(element);
    }
  }

  Background? _cacheDarkBackground;
  Background? _cacheLightBackground;

  Background? getCachedBackground(bool forDark) {
    if (forDark) return _cacheDarkBackground;
    return _cacheLightBackground;
  }

  List<ChatTheme> _cacheThemes = [];
  List<ChatTheme> getCachedThemes() => _cacheThemes;

  void _applyChatUpdateToCache(Update update) {
    switch (update.runtimeType) {
      case UpdateChatActionBar:
        update as UpdateChatActionBar;
        _chats[update.chatId!]!.actionBar = update.actionBar;
        break;
      case UpdateChatDefaultDisableNotification:
        update as UpdateChatDefaultDisableNotification;
        _chats[update.chatId]!.defaultDisableNotification =
            update.defaultDisableNotification;
        break;
      case UpdateChatDraftMessage:
        update as UpdateChatDraftMessage;
        _chats[update.chatId!]!.draftMessage = update.draftMessage;
        _chats[update.chatId!]!.positions = update.positions;
        break;
      case UpdateChatHasProtectedContent:
        update as UpdateChatHasProtectedContent;
        _chats[update.chatId!]!.hasProtectedContent =
            update.hasProtectedContent;
        break;
      case UpdateChatHasScheduledMessages:
        update as UpdateChatHasScheduledMessages;
        _chats[update.chatId!]!.hasScheduledMessages =
            update.hasScheduledMessages;
        break;
      case UpdateChatIsBlocked:
        update as UpdateChatIsBlocked;
        _chats[update.chatId!]!.isBlocked = update.isBlocked;
        break;
      case UpdateChatIsMarkedAsUnread:
        update as UpdateChatIsMarkedAsUnread;
        _chats[update.chatId!]!.isMarkedAsUnread = update.isMarkedAsUnread;
        break;
      case UpdateChatLastMessage:
        update as UpdateChatLastMessage;
        _chats[update.chatId!]!.positions = update.positions;
        _chats[update.chatId!]!.lastMessage = update.lastMessage;
        break;
      case UpdateChatMessageSender:
        update as UpdateChatMessageSender;
        _chats[update.chatId!]!.messageSenderId = update.messageSenderId;
        break;
      case UpdateChatMessageTtl:
        update as UpdateChatMessageTtl;
        _chats[update.chatId!]!.messageTtl = update.messageTtl;
        break;
      case UpdateChatNotificationSettings:
        update as UpdateChatNotificationSettings;
        _chats[update.chatId!]!.notificationSettings =
            update.notificationSettings;
        break;
      case UpdateChatPendingJoinRequests:
        update as UpdateChatPendingJoinRequests;
        _chats[update.chatId!]!.pendingJoinRequests =
            update.pendingJoinRequests;
        break;
      case UpdateChatPermissions:
        update as UpdateChatPermissions;
        _chats[update.chatId!]!.permissions = update.permissions;
        break;
      case UpdateChatPhoto:
        update as UpdateChatPhoto;
        _chats[update.chatId!]!.photo = update.photo;
        break;
      case UpdateChatReadInbox:
        update as UpdateChatReadInbox;
        _chats[update.chatId!]!.lastReadInboxMessageId =
            update.lastReadInboxMessageId;
        _chats[update.chatId!]!.unreadCount = update.unreadCount;
        break;
      case UpdateChatReadOutbox:
        update as UpdateChatReadOutbox;
        _chats[update.chatId!]!.lastReadOutboxMessageId =
            update.lastReadOutboxMessageId;
        break;
      case UpdateChatReplyMarkup:
        update as UpdateChatReplyMarkup;
        _chats[update.chatId!]!.replyMarkupMessageId =
            update.replyMarkupMessageId;
        break;
      case UpdateChatTheme:
        update as UpdateChatTheme;
        _chats[update.chatId!]!.themeName = update.themeName;
        break;
      case UpdateChatTitle:
        update as UpdateChatTitle;
        _chats[update.chatId!]!.title = update.title;
        break;
      case UpdateChatUnreadMentionCount:
        update as UpdateChatUnreadMentionCount;
        _chats[update.chatId!]!.unreadMentionCount = update.unreadMentionCount;
        break;
      case UpdateChatVideoChat:
        update as UpdateChatVideoChat;
        _chats[update.chatId!]!.videoChat = update.videoChat;
        break;
      case UpdateChatPosition:
        update as UpdateChatPosition;
        bool finded = false;
        var base = _chats[update.chatId]!;
        for (int i = 0; i < base.positions!.length; i++) {
          if (chatListsEqual(
              base.positions![i].list!, update.position!.list!)) {
            finded = true;
            base.positions![i] = update.position!;
          }
        }
        if (!finded) base.positions!.add(update.position!);
        break;
      case UpdateMessageMentionRead:
        update as UpdateMessageMentionRead;
        _chats[update.chatId!]!.unreadMentionCount = update.unreadMentionCount;
        break;
    }
  }

  /// returns cached info about File with entered [id] which was obtained as a result of past requests
  /// method guarantees that [file.local.path].isNotEmpty and [file.local.isDownloadingComplete] == true
  File? getFileSync(int id) => _cachedFiles[id];

  final Map<int, File> _cachedFiles = {};

  Future<void> init() async {
    languagePackDatabasePath = await getLanguagePackDatabasePath();
    Completer completer = Completer<void>();
    var receive = await initIsolate();
    receive.listen((message) {
      if (message is int) {
        Pointer<Void> pointer = Pointer.fromAddress(message);
        _sendClient = JsonClient.create(clientPointer: pointer);
        completer.complete();
      }

      if (message is String) {
        var tdobject = convertToObject(message);
        var extra = (tdobject as dynamic).extra;
        if (tdobject is File) {
          var file = tdobject as File;
          if ((file.local?.path ?? '').isNotEmpty &&
              (file.local?.isDownloadingCompleted ?? false)) {
            _cachedFiles[file.id!] = file;
          }
        }

        if (tdobject is Message) {
          _messages["${tdobject.chatId}||${tdobject.id}"] = tdobject;
        }

        if (tdobject is Messages) {
          for (final msg in tdobject.messages!) {
            _messages[_getMsgId(msg.chatId!, msg.id!)] = msg;
          }
        }

        if (tdobject is Update) {
          if (chatUpdates.contains(tdobject.runtimeType)) {
            _applyChatUpdateToCache(tdobject);
          }
          switch (tdobject.runtimeType) {
            case UpdateMessageContent:
              var msg = tdobject as UpdateMessageContent;
              getMessage(msg.chatId!, msg.messageId!)?.content = msg.newContent;
              break;
            case UpdateMessageEdited:
              var upd = tdobject as UpdateMessageEdited;
              var message = getMessage(upd.chatId!, upd.messageId!);
              message?.editDate = upd.editDate;
              message?.replyMarkup = upd.replyMarkup;
              break;
            case UpdateMessageInteractionInfo:
              var upd = tdobject as UpdateMessageInteractionInfo;
              getMessage(upd.chatId!, upd.messageId!)?.interactionInfo =
                  upd.interactionInfo;
              break;
            case UpdateMessageIsPinned:
              var upd = tdobject as UpdateMessageIsPinned;
              getMessage(upd.chatId!, upd.messageId!)?.isPinned = upd.isPinned;
              break;
            case UpdateNewMessage:
              var msg = tdobject as UpdateNewMessage;
              _messages[_getMsgId(msg.message!.chatId!, msg.message!.id!)] =
                  msg.message!;
              break;
            case UpdateSelectedBackground:
              tdobject as UpdateSelectedBackground;
              if (tdobject.forDarkTheme!) {
                _cacheDarkBackground = tdobject.background;
              } else {
                _cacheLightBackground = tdobject.background;
              }
              break;
            case UpdateChatThemes:
              tdobject as UpdateChatThemes;
              _cacheThemes = tdobject.chatThemes!;
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
            case UpdateUserStatus:
              tdobject as UpdateUserStatus;
              _users[tdobject.userId!]!.status = tdobject.status;
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

  TdObject execute(dynamic function) {
    return _sendClient!.execute(function);
  }

  int _extra = 1;
  Future<TdObject> send(dynamic function) async {
    final Completer<TdObject> _completer = Completer<TdObject>();
    function.extra = _extra;
    _sendClient!.send(function);
    _requestsQueue[_extra] = _completer.complete;
    _extra++;

    //why tdlib don't sents updates about changed client data?
    if (function is SetChatClientData) {
      _chats[function.chatId]?.clientData = function.clientData;
    }

    return _completer.future;
  }
}

void _tdlib_listen(SendPort isolateToMainStream) {
  ReceivePort mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);
  var client = JsonClient.create();
  isolateToMainStream.send(client.client.address);
  client.incomingString().listen((update) {
    isolateToMainStream.send(update);
  });
}

class ClientData {
  ClientData({this.unsentAttachments = const []});
  List<String> unsentAttachments;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'unsentAttachments': unsentAttachments,
    };
  }

  static ClientData fromJson(Map<String, dynamic> json) {
    return ClientData(
      unsentAttachments: (json['unsentAttachments'] as List)
          .map((item) => item as String)
          .toList(),
    );
  }
}

class ChatOrder {
  ChatOrder(this.chatId, this.position);
  int chatId;
  ChatPosition position;
}
