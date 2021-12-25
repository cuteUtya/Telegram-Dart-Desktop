part of '../tdapi.dart';

class GetVideoChatAvailableParticipants extends TdFunction {

  /// Returns list of participant identifiers, on whose behalf a video chat in the chat can be joined
  GetVideoChatAvailableParticipants({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetVideoChatAvailableParticipants.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getVideoChatAvailableParticipants';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}