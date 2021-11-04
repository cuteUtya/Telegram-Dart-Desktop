part of '../tdapi.dart';

class CheckCreatedPublicChatsLimit extends TdFunction {

  /// Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached
  CheckCreatedPublicChatsLimit({this.type});

  /// [type] Type of the public chats, for which to check the limit
  PublicChatType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckCreatedPublicChatsLimit.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkCreatedPublicChatsLimit';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}