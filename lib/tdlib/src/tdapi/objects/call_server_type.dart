part of '../tdapi.dart';

class CallServerType extends TdObject {

  /// Describes the type of a call server
  CallServerType();

  

  /// a CallServerType return type can be :
  /// * CallServerTypeTelegramReflector
  /// * CallServerTypeWebrtc
  factory CallServerType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case CallServerTypeTelegramReflector.CONSTRUCTOR:
        return CallServerTypeTelegramReflector.fromJson(json);
      case CallServerTypeWebrtc.CONSTRUCTOR:
        return CallServerTypeWebrtc.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'callServerType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallServerTypeTelegramReflector extends CallServerType {

  /// A Telegram call reflector
  CallServerTypeTelegramReflector({this.peerTag});

  /// [peerTag] A peer tag to be used with the reflector
  String? peerTag;

  /// Parse from a json
  CallServerTypeTelegramReflector.fromJson(Map<String, dynamic> json)  {
    peerTag = json['peer_tag'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "peer_tag": peerTag,
    };
  }

  static const CONSTRUCTOR = 'callServerTypeTelegramReflector';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallServerTypeWebrtc extends CallServerType {

  /// A WebRTC server
  CallServerTypeWebrtc({this.username,
    this.password,
    this.supportsTurn,
    this.supportsStun});

  /// [username] Username to be used for authentication 
  String? username;

  /// [password] Authentication password 
  String? password;

  /// [supportsTurn] True, if the server supports TURN 
  bool? supportsTurn;

  /// [supportsStun] True, if the server supports STUN
  bool? supportsStun;

  /// Parse from a json
  CallServerTypeWebrtc.fromJson(Map<String, dynamic> json)  {
    username = json['username'];
    password = json['password'];
    supportsTurn = json['supports_turn'];
    supportsStun = json['supports_stun'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "username": username,
      "password": password,
      "supports_turn": supportsTurn,
      "supports_stun": supportsStun,
    };
  }

  static const CONSTRUCTOR = 'callServerTypeWebrtc';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}