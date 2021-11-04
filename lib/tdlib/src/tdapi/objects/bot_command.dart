part of '../tdapi.dart';

class BotCommand extends TdObject {

  /// Represents a command supported by a bot
  BotCommand({this.command,
    this.description});

  /// [command] Text of the bot command 
  String? command;

  /// [description] Description of the bot command
  String? description;

  /// Parse from a json
  BotCommand.fromJson(Map<String, dynamic> json)  {
    command = json['command'];
    description = json['description'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "command": command,
      "description": description,
    };
  }

  static const CONSTRUCTOR = 'botCommand';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}