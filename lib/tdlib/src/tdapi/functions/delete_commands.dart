part of '../tdapi.dart';

class DeleteCommands extends TdFunction {

  /// Deletes commands supported by the bot for the given user scope and language; for bots only
  DeleteCommands({this.scope,
    this.languageCode});

  /// [scope] The scope to which the commands are relevant; pass null to delete commands in the default bot command scope
  BotCommandScope? scope;

  /// [languageCode] A two-letter ISO 639-1 language code or an empty string
  String? languageCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteCommands.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "scope": scope == null ? null : scope?.toJson(),
      "language_code": languageCode,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteCommands';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}