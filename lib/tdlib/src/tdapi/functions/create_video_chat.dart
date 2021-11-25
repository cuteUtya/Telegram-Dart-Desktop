part of '../tdapi.dart';

class CreateVideoChat extends TdFunction {

  /// Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_video_chats rights
  CreateVideoChat({this.chatId,
    this.title,
    this.startDate});

  /// [chatId] Chat identifier, in which the video chat will be created
  int? chatId;

  /// [title] Group call title; if empty, chat title will be used
  String? title;

  /// [startDate] Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the video chat immediately. The date must be at least 10 seconds and at most 8 days in the future
  int? startDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateVideoChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "title": title,
      "start_date": startDate,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'createVideoChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}