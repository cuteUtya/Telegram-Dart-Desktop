part of '../tdapi.dart';

class BotCommandScope extends TdObject {

  /// Represents the scope to which bot commands are relevant
  BotCommandScope();

  

  /// a BotCommandScope return type can be :
  /// * BotCommandScopeDefault
  /// * BotCommandScopeAllPrivateChats
  /// * BotCommandScopeAllGroupChats
  /// * BotCommandScopeAllChatAdministrators
  /// * BotCommandScopeChat
  /// * BotCommandScopeChatAdministrators
  /// * BotCommandScopeChatMember
  factory BotCommandScope.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case BotCommandScopeDefault.CONSTRUCTOR:
        return BotCommandScopeDefault.fromJson(json);
      case BotCommandScopeAllPrivateChats.CONSTRUCTOR:
        return BotCommandScopeAllPrivateChats.fromJson(json);
      case BotCommandScopeAllGroupChats.CONSTRUCTOR:
        return BotCommandScopeAllGroupChats.fromJson(json);
      case BotCommandScopeAllChatAdministrators.CONSTRUCTOR:
        return BotCommandScopeAllChatAdministrators.fromJson(json);
      case BotCommandScopeChat.CONSTRUCTOR:
        return BotCommandScopeChat.fromJson(json);
      case BotCommandScopeChatAdministrators.CONSTRUCTOR:
        return BotCommandScopeChatAdministrators.fromJson(json);
      case BotCommandScopeChatMember.CONSTRUCTOR:
        return BotCommandScopeChatMember.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'botCommandScope';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeDefault extends BotCommandScope {

  /// A scope covering all users
  BotCommandScopeDefault();

  

  /// Parse from a json
  BotCommandScopeDefault.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeDefault';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeAllPrivateChats extends BotCommandScope {

  /// A scope covering all private chats
  BotCommandScopeAllPrivateChats();

  

  /// Parse from a json
  BotCommandScopeAllPrivateChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeAllPrivateChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeAllGroupChats extends BotCommandScope {

  /// A scope covering all group and supergroup chats
  BotCommandScopeAllGroupChats();

  

  /// Parse from a json
  BotCommandScopeAllGroupChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeAllGroupChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeAllChatAdministrators extends BotCommandScope {

  /// A scope covering all group and supergroup chat administrators
  BotCommandScopeAllChatAdministrators();

  

  /// Parse from a json
  BotCommandScopeAllChatAdministrators.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeAllChatAdministrators';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeChat extends BotCommandScope {

  /// A scope covering all members of a chat
  BotCommandScopeChat({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// Parse from a json
  BotCommandScopeChat.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeChatAdministrators extends BotCommandScope {

  /// A scope covering all administrators of a chat
  BotCommandScopeChatAdministrators({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// Parse from a json
  BotCommandScopeChatAdministrators.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeChatAdministrators';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BotCommandScopeChatMember extends BotCommandScope {

  /// A scope covering a member of a chat
  BotCommandScopeChatMember({this.chatId,
    this.userId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [userId] User identifier
  int? userId;

  /// Parse from a json
  BotCommandScopeChatMember.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
    };
  }

  static const CONSTRUCTOR = 'botCommandScopeChatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}