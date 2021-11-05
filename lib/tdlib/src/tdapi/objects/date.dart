part of '../tdapi.dart';

class Date extends TdObject {

  /// Represents a date according to the Gregorian calendar
  Date({this.day,
    this.month,
    this.year});

  /// [day] Day of the month; 1-31 
  int? day;

  /// [month] Month; 1-12 
  int? month;

  /// [year] Year; 1-9999
  int? year;

  /// Parse from a json
  Date.fromJson(Map<String, dynamic> json)  {
    int? pre_day;
    try{
      pre_day=json['day'];
   }catch(_){}
    day = pre_day;
    int? pre_month;
    try{
      pre_month=json['month'];
   }catch(_){}
    month = pre_month;
    int? pre_year;
    try{
      pre_year=json['year'];
   }catch(_){}
    year = pre_year;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "day": day,
      "month": month,
      "year": year,
    };
  }

  static const CONSTRUCTOR = 'date';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}