part of '../tdapi.dart';

class DatabaseStatistics extends TdObject {

  /// Contains database statistics
  DatabaseStatistics({this.statistics});

  /// [statistics] Database statistics in an unspecified human-readable format
  String? statistics;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DatabaseStatistics.fromJson(Map<String, dynamic> json)  {
    statistics = json['statistics'] == null ? null : json['statistics'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "statistics": statistics,
    };
  }

  static const CONSTRUCTOR = 'databaseStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}