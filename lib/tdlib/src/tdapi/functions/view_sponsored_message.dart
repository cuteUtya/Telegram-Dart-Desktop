part of '../tdapi.dart';

class ViewSponsoredMessage extends TdFunction {

  /// Informs TDLib that a sponsored message was viewed by the user
  ViewSponsoredMessage({this.chatId,
    this.sponsoredMessageId});

  /// [chatId] Identifier of the chat with the sponsored message 
  int? chatId;

  /// [sponsoredMessageId] The identifier of the sponsored message being viewed
  int? sponsoredMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ViewSponsoredMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "sponsored_message_id": sponsoredMessageId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'viewSponsoredMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}