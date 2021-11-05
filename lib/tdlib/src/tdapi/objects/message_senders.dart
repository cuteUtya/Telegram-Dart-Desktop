part of '../tdapi.dart';

class MessageSenders extends TdObject {

  /// Represents a list of message senders
  MessageSenders({this.totalCount,
    this.senders});

  /// [totalCount] Approximate total count of messages senders found 
  int? totalCount;

  /// [senders] List of message senders
  List<MessageSender>? senders;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageSenders.fromJson(Map<String, dynamic> json)  {
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<MessageSender>? pre_senders;
    try{
      pre_senders=List<MessageSender>.from((json['senders'] ?? [])!.map((item) => MessageSender.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    senders = pre_senders;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "senders": senders?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageSenders';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}