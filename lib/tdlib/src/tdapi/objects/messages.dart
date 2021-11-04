part of '../tdapi.dart';

class Messages extends TdObject {

  /// Contains a list of messages
  Messages({this.totalCount,
    this.messages});

  /// [totalCount] Approximate total count of messages found 
  int? totalCount;

  /// [messages] List of messages; messages may be null
  List<Message>? messages;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Messages.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'];
    messages = List<Message>.from((json['messages'] ?? [])!.map((item) => Message.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "messages": messages?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}