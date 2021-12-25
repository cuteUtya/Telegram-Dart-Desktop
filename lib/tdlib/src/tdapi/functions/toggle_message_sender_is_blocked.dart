part of '../tdapi.dart';

class ToggleMessageSenderIsBlocked extends TdFunction {

  /// Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked
  ToggleMessageSenderIsBlocked({this.senderId,
    this.isBlocked});

  /// [senderId] Identifier of a message sender to block/unblock 
  MessageSender? senderId;

  /// [isBlocked] New value of is_blocked
  bool? isBlocked;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleMessageSenderIsBlocked.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_id": senderId == null ? null : senderId?.toJson(),
      "is_blocked": isBlocked,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleMessageSenderIsBlocked';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}