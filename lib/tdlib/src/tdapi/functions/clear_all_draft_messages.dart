part of '../tdapi.dart';

class ClearAllDraftMessages extends TdFunction {

  /// Clears draft messages in all chats
  ClearAllDraftMessages({this.excludeSecretChats});

  /// [excludeSecretChats] If true, local draft messages in secret chats will not be cleared
  bool? excludeSecretChats;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ClearAllDraftMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "exclude_secret_chats": excludeSecretChats,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'clearAllDraftMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}