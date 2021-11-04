part of '../tdapi.dart';

class DeleteAllCallMessages extends TdFunction {

  /// Deletes all call messages
  DeleteAllCallMessages({this.revoke});

  /// [revoke] Pass true to delete the messages for all users
  bool? revoke;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteAllCallMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteAllCallMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}