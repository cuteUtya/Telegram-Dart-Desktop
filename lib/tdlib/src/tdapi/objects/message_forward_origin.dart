part of '../tdapi.dart';

class MessageForwardOrigin extends TdObject {

  /// Contains information about the origin of a forwarded message
  MessageForwardOrigin();

  

  /// a MessageForwardOrigin return type can be :
  /// * MessageForwardOriginUser
  /// * MessageForwardOriginChat
  /// * MessageForwardOriginHiddenUser
  /// * MessageForwardOriginChannel
  /// * MessageForwardOriginMessageImport
  factory MessageForwardOrigin.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case MessageForwardOriginUser.CONSTRUCTOR:
        return MessageForwardOriginUser.fromJson(json);
      case MessageForwardOriginChat.CONSTRUCTOR:
        return MessageForwardOriginChat.fromJson(json);
      case MessageForwardOriginHiddenUser.CONSTRUCTOR:
        return MessageForwardOriginHiddenUser.fromJson(json);
      case MessageForwardOriginChannel.CONSTRUCTOR:
        return MessageForwardOriginChannel.fromJson(json);
      case MessageForwardOriginMessageImport.CONSTRUCTOR:
        return MessageForwardOriginMessageImport.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'messageForwardOrigin';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageForwardOriginUser extends MessageForwardOrigin {

  /// The message was originally sent by a known user
  MessageForwardOriginUser({this.senderUserId});

  /// [senderUserId] Identifier of the user that originally sent the message
  int? senderUserId;

  /// Parse from a json
  MessageForwardOriginUser.fromJson(Map<String, dynamic> json)  {
    int? pre_senderUserId;
    try{
      pre_senderUserId=json['sender_user_id'];
   }catch(_){}
    senderUserId = pre_senderUserId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_user_id": senderUserId,
    };
  }

  static const CONSTRUCTOR = 'messageForwardOriginUser';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageForwardOriginChat extends MessageForwardOrigin {

  /// The message was originally sent by an anonymous chat administrator on behalf of the chat
  MessageForwardOriginChat({this.senderChatId,
    this.authorSignature});

  /// [senderChatId] Identifier of the chat that originally sent the message
  int? senderChatId;

  /// [authorSignature] Original message author signature
  String? authorSignature;

  /// Parse from a json
  MessageForwardOriginChat.fromJson(Map<String, dynamic> json)  {
    int? pre_senderChatId;
    try{
      pre_senderChatId=json['sender_chat_id'];
   }catch(_){}
    senderChatId = pre_senderChatId;
    String? pre_authorSignature;
    try{
      pre_authorSignature=json['author_signature'];
   }catch(_){}
    authorSignature = pre_authorSignature;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_chat_id": senderChatId,
      "author_signature": authorSignature,
    };
  }

  static const CONSTRUCTOR = 'messageForwardOriginChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageForwardOriginHiddenUser extends MessageForwardOrigin {

  /// The message was originally sent by a user, which is hidden by their privacy settings
  MessageForwardOriginHiddenUser({this.senderName});

  /// [senderName] Name of the sender
  String? senderName;

  /// Parse from a json
  MessageForwardOriginHiddenUser.fromJson(Map<String, dynamic> json)  {
    String? pre_senderName;
    try{
      pre_senderName=json['sender_name'];
   }catch(_){}
    senderName = pre_senderName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_name": senderName,
    };
  }

  static const CONSTRUCTOR = 'messageForwardOriginHiddenUser';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageForwardOriginChannel extends MessageForwardOrigin {

  /// The message was originally a post in a channel
  MessageForwardOriginChannel({this.chatId,
    this.messageId,
    this.authorSignature});

  /// [chatId] Identifier of the chat from which the message was originally forwarded
  int? chatId;

  /// [messageId] Message identifier of the original message
  int? messageId;

  /// [authorSignature] Original post author signature
  String? authorSignature;

  /// Parse from a json
  MessageForwardOriginChannel.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    String? pre_authorSignature;
    try{
      pre_authorSignature=json['author_signature'];
   }catch(_){}
    authorSignature = pre_authorSignature;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "author_signature": authorSignature,
    };
  }

  static const CONSTRUCTOR = 'messageForwardOriginChannel';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageForwardOriginMessageImport extends MessageForwardOrigin {

  /// The message was imported from an exported message history
  MessageForwardOriginMessageImport({this.senderName});

  /// [senderName] Name of the sender
  String? senderName;

  /// Parse from a json
  MessageForwardOriginMessageImport.fromJson(Map<String, dynamic> json)  {
    String? pre_senderName;
    try{
      pre_senderName=json['sender_name'];
   }catch(_){}
    senderName = pre_senderName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sender_name": senderName,
    };
  }

  static const CONSTRUCTOR = 'messageForwardOriginMessageImport';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}