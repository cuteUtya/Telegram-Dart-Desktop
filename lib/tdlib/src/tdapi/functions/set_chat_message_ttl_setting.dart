part of '../tdapi.dart';

class SetChatMessageTtlSetting extends TdFunction {

  /// Changes the message TTL setting (sets a new self-destruct timer) in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels. Message TTL setting of a chat with the current user (Saved Messages) and the chat 777000 (Telegram) can't be changed
  SetChatMessageTtlSetting({this.chatId,
    this.ttl});

  /// [chatId] Chat identifier
  int? chatId;

  /// [ttl] New TTL value, in seconds; must be one of 0, 86400, 7 * 86400, or 31 * 86400 unless the chat is secret
  int? ttl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatMessageTtlSetting.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "ttl": ttl,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatMessageTtlSetting';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}