part of '../tdapi.dart';

class DateRange extends TdObject {

  /// Represents a date range
  DateRange({this.startDate,
    this.endDate});

  /// [startDate] Point in time (Unix timestamp) at which the date range begins 
  int? startDate;

  /// [endDate] Point in time (Unix timestamp) at which the date range ends
  int? endDate;

  /// Parse from a json
  DateRange.fromJson(Map<String, dynamic> json)  {
    int? pre_startDate;
    try{
      pre_startDate=json['start_date'];
   }catch(_){}
    startDate = pre_startDate;
    int? pre_endDate;
    try{
      pre_endDate=json['end_date'];
   }catch(_){}
    endDate = pre_endDate;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "start_date": startDate,
      "end_date": endDate,
    };
  }

  static const CONSTRUCTOR = 'dateRange';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}