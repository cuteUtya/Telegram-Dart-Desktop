part of '../tdapi.dart';

class CreateVoiceChat extends TdFunction {

  /// Creates a voice chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_voice_chats rights
  CreateVoiceChat({this.chatId,
    this.title,
    this.startDate});

  /// [chatId] Chat identifier, in which the voice chat will be created
  int? chatId;

  /// [title] Group call title; if empty, chat title will be used
  String? title;

  /// [startDate] Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the voice chat immediately. The date must be at least 10 seconds and at most 8 days in the future
  int? startDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateVoiceChat.fromJson(Map<String, dynamic> json) ;

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

  static const CONSTRUCTOR = 'createVoiceChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}