part of '../tdapi.dart';

class MessageFileType extends TdObject {

  /// Contains information about a file with messages exported from another app
  MessageFileType();

  

  /// a MessageFileType return type can be :
  /// * MessageFileTypePrivate
  /// * MessageFileTypeGroup
  /// * MessageFileTypeUnknown
  factory MessageFileType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case MessageFileTypePrivate.CONSTRUCTOR:
        return MessageFileTypePrivate.fromJson(json);
      case MessageFileTypeGroup.CONSTRUCTOR:
        return MessageFileTypeGroup.fromJson(json);
      case MessageFileTypeUnknown.CONSTRUCTOR:
        return MessageFileTypeUnknown.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'messageFileType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageFileTypePrivate extends MessageFileType {

  /// The messages was exported from a private chat
  MessageFileTypePrivate({this.name});

  /// [name] Name of the other party; may be empty if unrecognized
  String? name;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageFileTypePrivate.fromJson(Map<String, dynamic> json)  {
    name = json['name'] == null ? null : json['name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
    };
  }

  static const CONSTRUCTOR = 'messageFileTypePrivate';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageFileTypeGroup extends MessageFileType {

  /// The messages was exported from a group chat
  MessageFileTypeGroup({this.title});

  /// [title] Title of the group chat; may be empty if unrecognized
  String? title;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageFileTypeGroup.fromJson(Map<String, dynamic> json)  {
    title = json['title'] == null ? null : json['title'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'messageFileTypeGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageFileTypeUnknown extends MessageFileType {

  /// The messages was exported from a chat of unknown type
  MessageFileTypeUnknown();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageFileTypeUnknown.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageFileTypeUnknown';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}