part of '../tdapi.dart';

class MessageCalendar extends TdObject {

  /// Contains information about found messages, splitted by days according to the option "utc_time_offset"
  MessageCalendar({this.totalCount,
    this.days});

  /// [totalCount] Total number of found messages 
  int? totalCount;

  /// [days] Information about messages sent
  List<MessageCalendarDay>? days;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageCalendar.fromJson(Map<String, dynamic> json)  {
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<MessageCalendarDay>? pre_days;
    try{
      pre_days=List<MessageCalendarDay>.from((json['days'] ?? [])!.map((item) => MessageCalendarDay.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    days = pre_days;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "days": days?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageCalendar';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}