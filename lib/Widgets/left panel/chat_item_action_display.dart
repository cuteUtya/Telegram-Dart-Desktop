import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/smooth_number_counter.dart';
import 'package:myapp/Widgets/text_animation.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemActionDisplay extends StatelessWidget {
  const ChatItemActionDisplay(
      {Key? key,
      required this.action,
      required this.client,
      required this.isPrivate,
      required this.chatid})
      : super(key: key);
  final ChatActionInfo action;
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
    Widget? animation;

    if (typesWithProgress.contains(action.action.runtimeType)) {
      animation = createUploadAnimation(action.action.runtimeType,
          (action.action as dynamic).progress, chatid);
    }

    var emoji = (action.action is ChatActionWatchingAnimations)
        ? (action.action as ChatActionWatchingAnimations).emoji
        : null;

    String? transitionStr = (isPrivate
        ? actionTransitionPrivate
        : actionTransitionsChat)[action.action.runtimeType];

    return Row(children: [
      RichText(
          text: TextSpan(
              children: TextDisplay.parseEmojiInString(
                  transitionStr != null
                      ? client.getTranslation(transitionStr, replacing: {
                          "{user}": action.who.firstName!,
                          "{emoji}": emoji ?? "🍆"
                        })
                      : "¯\\_(ツ)_/¯",
                  TextDisplay.chatItemAccent))),
      const SizedBox(width: 2),
      animation ?? TextAnimation.fourPoints()
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
