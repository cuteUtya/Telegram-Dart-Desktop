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
    day = json['day'] == null ? null : json['day'];
    month = json['month'] == null ? null : json['month'];
    year = json['year'] == null ? null : json['year'];
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