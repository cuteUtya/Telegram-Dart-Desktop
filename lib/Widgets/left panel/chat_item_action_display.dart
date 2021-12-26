import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/smooth_number_counter.dart';
import 'package:myapp/Widgets/text_animation.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemActionDisplay extends StatelessWidget {
  const ChatItemActionDisplay(
      {Key? key,
      required this.chatSelected,
      required this.actions,
      required this.client,
      required this.isPrivate,
      required this.chatid})
      : super(key: key);
  final bool chatSelected;
  final Map<String, ChatAction> actions;
  final TelegramClient client;
  final int chatid;
  final bool isPrivate;
  static Map<Type, Map<int, GlobalKey<SmoothNumberCounterState>>> keys = {};
  static Map<Type, String> actionTransitionsChat = {
    ChatActionTyping: "lng_user_typing",
    ChatActionRecordingVideo: "lng_user_action_record_video",
    ChatActionUploadingVideo: "lng_user_action_upload_video",
    ChatActionRecordingVoiceNote: "lng_user_action_record_audio",
    ChatActionUploadingVideoNote: "lng_user_action_upload_audio",
    ChatActionUploadingDocument: "lng_user_action_upload_file",
    ChatActionUploadingPhoto: "lng_user_action_upload_photo",
    ChatActionChoosingSticker: "lng_user_action_choose_sticker",
    ChatActionStartPlayingGame: "lng_user_playing_game",
    ChatActionRecordingVideoNote: "lng_user_action_record_round",
    ChatActionWatchingAnimations: "lng_user_action_watching_animations"
  };
  static Map<Type, String> actionTransitionPrivate = {
    ChatActionTyping: "lng_typing",
    ChatActionRecordingVideo: "lng_send_action_record_video",
    ChatActionUploadingVideo: "lng_send_action_upload_video",
    ChatActionRecordingVoiceNote: "lng_send_action_record_audio",
    ChatActionUploadingVideoNote: "lng_send_action_upload_audio",
    ChatActionUploadingDocument: "lng_send_action_upload_file",
    ChatActionUploadingPhoto: "lng_send_action_upload_photo",
    ChatActionChoosingSticker: "lng_send_action_choose_sticker",
    ChatActionStartPlayingGame: "lng_user_playing_game",
    ChatActionRecordingVideoNote: "lng_send_action_record_round",
    ChatActionWatchingAnimations: "lng_user_action_watching_animations"
  };

  static const List<Type> typesWithProgress = [
    ChatActionUploadingVideo,
    ChatActionUploadingVoiceNote,
    ChatActionUploadingPhoto,
    ChatActionUploadingDocument,
    ChatActionUploadingVideoNote
  ];
  @override
  Widget build(BuildContext context) {
    String? transitionStr;
    Widget? animation;
    String secondUser = "";
    var firstName = actions.keys.elementAt(0);
    var firstAction = actions[firstName];
    if (actions.length <= 1) {
      if (typesWithProgress.contains(firstAction.runtimeType)) {
        animation = createUploadAnimation(
            firstAction.runtimeType, (firstAction as dynamic).progress, chatid);
      }
      transitionStr = (isPrivate
          ? actionTransitionPrivate
          : actionTransitionsChat)[firstAction.runtimeType];
    } else {
      transitionStr =
          actions.length == 2 ? "lng_users_typing" : "lng_many_typing";
      secondUser = actions.keys.elementAt(1);
    }

    var textStyle = chatSelected
        ? TextDisplay.chatItemAccentSelected
        : TextDisplay.chatItemAccent;

    return Row(children: [
      RichText(
          text: TextSpan(
              children: TextDisplay.parseEmojiInString(
                  transitionStr != null
                      ? client.getTranslation(transitionStr,
                          replacing: {
                            "{user}": firstName,
                            "{emoji}":
                                (firstAction is ChatActionWatchingAnimations)
                                    ? firstAction.emoji ?? "🍆"
                                    : "",
                            "{second_user}": secondUser,
                            "{count}": actions.length.toString()
                          },
                          itemsCount: actions.length)
                      : "¯\\_(ツ)_/¯",
                  textStyle))),
      const SizedBox(width: 2),
      animation ?? TextAnimation.fourPoints(textStyle)
    ]);
  }

  Widget createUploadAnimation(Type action, int progress, int chatId) {
    if (keys[action] == null) {
      keys[action] = {};
    }
    if (keys[action]![chatId] == null) {
      keys[action]![chatId] = GlobalKey<SmoothNumberCounterState>();
    }
    keys[action]![chatId]!.currentState?.setNewTarget(progress);

    return SmoothNumberCounter(
        key: keys[action]![chatid],
        mask: "— {value}%",
        initialValue: progress,
        textStyle: TextDisplay.chatItemAccent);
  }
}
