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
  final List<UpdateChatAction> actions;
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
    return StreamBuilder(
      stream: client.senderName(actions[0].senderId!),
      builder: (_, fSenderName) {
        String? transitionStr;
        Widget? animation;
        MessageSender? secondUser;
        var firstName = fSenderName.data.toString();
        var firstAction = actions[0].action;
        if (actions.length <= 1) {
          if (typesWithProgress.contains(firstAction.runtimeType)) {
            animation = createUploadAnimation(firstAction.runtimeType, (firstAction as dynamic).progress, chatid);
          }
          transitionStr = (isPrivate ? actionTransitionPrivate : actionTransitionsChat)[firstAction.runtimeType];
        } else {
          transitionStr = actions.length == 2 ? "lng_users_typing" : "lng_many_typing";
          secondUser = actions[1].senderId!;
        }

        var textStyle = chatSelected ? TextDisplay.chatItemAccentSelected : TextDisplay.chatItemAccent;

        return StreamBuilder(
            stream: secondUser == null ? null : client.senderName(secondUser),
            builder: (_, sSenderName) {
              return RichText(
                text: TextSpan(
                  children: TextDisplay.parseEmojiInString(
                          transitionStr != null
                              ? client.getTranslation(transitionStr,
                                  replacing: {
                                    "{user}": firstName,
                                    "{emoji}": (firstAction is ChatActionWatchingAnimations) ? firstAction.emoji ?? "🍆" : "",
                                    "{second_user}": sSenderName.data.toString(),
                                    "{count}": actions.length.toString()
                                  },
                                  itemsCount: actions.length)
                              : "¯\\_(ツ)_/¯",
                          textStyle) +
                      [
                        const WidgetSpan(child: SizedBox(width: 2)),
                        WidgetSpan(
                          child: animation ?? TextAnimation.fourPoints(textStyle),
                        ),
                      ],
                ),
              );
            });
      },
    );
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
      textStyle: TextDisplay.chatItemAccent,
    );
  }
}
