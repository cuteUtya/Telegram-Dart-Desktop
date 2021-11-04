part of '../tdapi.dart';

class SetChatPhoto extends TdFunction {

  /// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
  SetChatPhoto({this.chatId,
    this.photo});

  /// [chatId] Chat identifier
  int? chatId;

  /// [photo] New chat photo; pass null to delete the chat photo
  InputChatPhoto? photo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatPhoto.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "photo": photo == null ? null : photo?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}