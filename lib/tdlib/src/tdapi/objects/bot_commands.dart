part of '../tdapi.dart';

class BotCommands extends TdObject {

  /// Contains a list of bot commands
  BotCommands({this.botUserId,
    this.commands});

  /// [botUserId] Bot's user identifier 
  int? botUserId;

  /// [commands] List of bot commands
  List<BotCommand>? commands;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  BotCommands.fromJson(Map<String, dynamic> json)  {
    int? pre_botUserId;
    try{
      pre_botUserId=json['bot_user_id'];
   }catch(_){}
    botUserId = pre_botUserId;
    List<BotCommand>? pre_commands;
    try{
      pre_commands=List<BotCommand>.from((json['commands'] ?? [])!.map((item) => BotCommand.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    commands = pre_commands;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "commands": commands?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'botCommands';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}