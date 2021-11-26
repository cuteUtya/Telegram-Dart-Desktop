import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:myapp/constants.dart';
import 'package:myapp/secrets.dart' as secrets;
import 'package:myapp/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:isolate';

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

  Stream<List<ChatFilterInfo>> get updateChatFilters => updates
      .where((u) => u is UpdateChatFilters)
      .map((a) => (a as UpdateChatFilters).chatFilters!);

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

  Stream<UpdateChatMessageTtlSetting> get updateChatMessageTTlSetting => updates
      .where((u) => u is UpdateChatMessageTtlSetting)
      .map((a) => (a as UpdateChatMessageTtlSetting));

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

  Stream<UpdateChatPhoto> get updateChatPhoto => updates
      .where((u) => u is UpdateChatPhoto)
      .map((a) => (a as UpdateChatPhoto));

  Stream<UpdateChatPosition> get updateChatPosition => updates
      .where((u) => u is UpdateChatPosition)
      .map((a) => (a as UpdateChatPosition));

  Stream<UpdateChatReadInbox> get updateChatReadinbox => updates
      .where((u) => u is UpdateChatReadInbox)
      .map((a) => (a as UpdateChatReadInbox));

  Stream<UpdateChatReadOutbox> get updateChatReadOutbox => updates
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

  Stream<UpdateChatTitle> get updateChatTitle => updates
      .where((u) => u is UpdateChatTitle)
      .map((a) => (a as UpdateChatTitle));

  Stream<UpdateChatUnreadMentionCount> get updateChatUnreaMentionCount =>
      updates
          .where((u) => u is UpdateChatUnreadMentionCount)
          .map((a) => (a as UpdateChatUnreadMentionCount));

  Stream<UpdateChatVideoChat> get updateChatVoiceChat => updates
      .where((u) => u is UpdateChatVideoChat)
      .map((a) => (a as UpdateChatVideoChat));

  Stream<ConnectionState> get updateConnectionState => updates
      .where((u) => u is UpdateConnectionState)
      .map((a) => (a as UpdateConnectionState).state!);

  Stream<UpdateDeleteMessages> get updateDeleteDessages => updates
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

  Stream<UpdateMessageMentionRead> get updateMessageMentionRead => updates
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

  Stream<UpdateSelectedBackground> get updateSelectedBackground => updates
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

  Stream<UpdateUserChatAction> get updateUserChatAction => updates
      .where((u) => u is UpdateUserChatAction)
      .map((a) => (a as UpdateUserChatAction));

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

  Stream<UserStatus> get updateUserStatus => updates
      .where((u) => u is UpdateUserStatus)
      .map((a) => (a as UpdateUserStatus).status!);

  late TdlibParameters tdlibParameters;
  String userLocale = "en";
  String userLangPackId = "en";
  static const String localizationTarget = "tdesktop";

  Widget buildTextByKey(String key, TextStyle style) {
    if (_cachedLanguagePackString.containsKey(key)) {
      return Text(
          (_cachedLanguagePackString[key] as LanguagePackStringValueOrdinary)
              .value!,
          style: style);
    }

    return FutureBuilder(
        builder: (context, data) {
          return Text(
            data.hasData
                ? (data.data as LanguagePackStringValueOrdinary).value ?? ""
                : "",
            style: style,
          );
        },
        future: getLanguagePackString(key));
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
      bool useSecretChats = true,
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
        useTestDc: false,
        databaseDirectory: databaseDirectory,
        filesDirectory: filesDirectory,
        applicationVersion: appVersion,
        useFileDatabase: true,
        useMessageDatabase: true,
        useChatInfoDatabase: true,
        useSecretChats: false,
        apiHash: apiHash,
        apiId: apiId,
        systemLanguageCode: systemLanguageCode,
        deviceModel: deviceModel,
        systemVersion: systemVersion);

    send(SetTdlibParameters(parameters: tdlibParameters));
  }

  final Map<String, TdObject> _cachedLanguagePackString = {};
  Future<TdObject> getLanguagePackString(String key,
      {String? languagePackDatabasePath,
      String? languagePackId,
      String? localizationTarget,
      bool throwExcepetions = false}) async {
    languagePackDatabasePath ??= getLanguagePackDatabasePath();
    languagePackId ??= userLangPackId;
    localizationTarget ??= TelegramClient.localizationTarget;

    var cachedResult = _cachedLanguagePackString[languagePackId + key];
    if (cachedResult != null) return cachedResult;

    var result = await send(GetLanguagePackString(
        key: key,
        languagePackDatabasePath: languagePackDatabasePath,
        languagePackId: languagePackId,
        localizationTarget: localizationTarget));

    //download string if we dont have it in database
    if (result is TdError) {
      if (throwExcepetions) return result;
      result = (await send(GetLanguagePackStrings(
              keys: [key],
              languagePackId: languagePackId)) as LanguagePackStrings)
          .strings![0]
          .value!;
    }

    if (result is! TdError) {
      _cachedLanguagePackString[languagePackId + key] = result;
    }
    return result;
  }

  Future<void> init() async {
    Completer completer = Completer<void>();
    _receivePort = await initIsolate();
    //not null, promise
    _receivePort!.listen((message) {
      if (message is String) {
        if (message == "\$goodbye!\$") {
          _isolate!.kill();
          io.Directory(_dbPath!).deleteSync(recursive: true);
          io.Directory(_filesPath!).deleteSync(recursive: true);
          return;
        }
        var tdobject = convertToObject(message);
        var extra = json.decode(message)["@extra"];
        if (extra == null) {
          _updates.add(tdobject as Update);
        } else {
          _requestsQueue[extra as int]!(tdobject);
          _requestsQueue.remove(extra);
        }
      } else if (message is SendPort) {
        _sendPort = message;
        completer.complete();
      }
    });
    return completer.future;
  }

  ReceivePort? _receivePort;
  SendPort? _sendPort;
  final Map<int, Function(TdObject)> _requestsQueue = {};
  Isolate? _isolate;

  Future<ReceivePort> initIsolate() async {
    ReceivePort isolateToMainStream = ReceivePort();
    _isolate = await Isolate.spawn(_start, isolateToMainStream.sendPort);
    return isolateToMainStream;
  }

  /// Asynchronously performs any necessary cleanup before [destroy]ing this
  /// client.
  Future<void> destroy() async {
    if (_isolate == null) {
      throw Exception("Instance can't be destroy, because it doesnt open");
    }
    _sendPort!.send("\$killme\$");
  }

  int _extra = 1;

  Future<TdObject> send(dynamic function) async {
    function.extra = _extra;
    if (_sendPort == null) throw Exception("firstly init client using init()");
    _sendPort!.send(json.encode(function));
    final Completer<TdObject> _completer = Completer<TdObject>();
    _requestsQueue[_extra] = _completer.complete;
    _extra++;
    return _completer.future;
  }
}

void _start(SendPort isolateToMainStream) {
  //create a new port and send it to the main
  ReceivePort mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  //listen Stream
  var client = JsonClient.create("Assets/bin/tdlib");
  //About this timeouts: Dart, as a language, has a problem - it is single-threaded,
  //and td_json_client_receive blocks the thread for the timeout period, so I run tdlib in isolate.
  //But these are not all problems, while td_json_client_receive is running I cannot listen for messages from SendPort.
  //Therefore, I wait for updates from tdlib 100ms and wait for messages from SendPort, also 100ms.
  //
  //Who will solve this problem - cool dude.
  client.incomingString(0.1).listen((update) {
    isolateToMainStream.send(update);
  });

  mainToIsolateStream.listen((data) {
    if (data is String) {
      if (data == "\$killme\$") {
        client.destroy();
        isolateToMainStream.send("\$goodbye!\$");
      } else {
        client.send(json.decode(data));
      }
    }
  });
}
