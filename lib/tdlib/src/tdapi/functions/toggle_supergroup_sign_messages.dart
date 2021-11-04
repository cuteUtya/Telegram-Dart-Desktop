part of '../tdapi.dart';

class ToggleSupergroupSignMessages extends TdFunction {

  /// Toggles sender signatures messages sent in a channel; requires can_change_info administrator right
  ToggleSupergroupSignMessages({this.supergroupId,
    this.signMessages});

  /// [supergroupId] Identifier of the channel 
  int? supergroupId;

  /// [signMessages] New value of sign_messages
  bool? signMessages;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleSupergroupSignMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "sign_messages": signMessages,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleSupergroupSignMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}