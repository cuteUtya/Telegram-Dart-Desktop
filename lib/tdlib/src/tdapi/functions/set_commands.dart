part of '../tdapi.dart';

class SetCommands extends TdFunction {

  /// Sets the list of commands supported by the bot for the given user scope and language; for bots only
  SetCommands({this.scope,
    this.languageCode,
    this.commands});

  /// [scope] The scope to which the commands are relevant; pass null to change commands in the default bot command scope
  BotCommandScope? scope;

  /// [languageCode] A two-letter ISO 639-1 country code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
  String? languageCode;

  /// [commands] List of the bot's commands
  List<BotCommand>? commands;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetCommands.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "scope": scope == null ? null : scope?.toJson(),
      "language_code": languageCode,
      "commands": commands?.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setCommands';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}