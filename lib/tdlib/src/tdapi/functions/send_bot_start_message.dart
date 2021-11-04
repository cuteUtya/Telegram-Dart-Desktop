part of '../tdapi.dart';

class SendBotStartMessage extends TdFunction {

  /// Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
  SendBotStartMessage({this.botUserId,
    this.chatId,
    this.parameter});

  /// [botUserId] Identifier of the bot
  int? botUserId;

  /// [chatId] Identifier of the target chat 
  int? chatId;

  /// [parameter] A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
  String? parameter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendBotStartMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "chat_id": chatId,
      "parameter": parameter,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendBotStartMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}