part of '../tdapi.dart';

class MessageCalendarDay extends TdObject {

  /// Contains information about found messages sent in a specific day
  MessageCalendarDay({this.totalCount,
    this.message});

  /// [totalCount] Total number of found messages sent in the day 
  int? totalCount;

  /// [message] First message sent in the day
  Message? message;

  /// Parse from a json
  MessageCalendarDay.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'] == null ? null : json['total_count'];
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "message": message == null ? null : message?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageCalendarDay';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}