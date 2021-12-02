part of '../tdapi.dart';

class NetworkStatistics extends TdObject {

  /// A full list of available network statistic entries
  NetworkStatistics({this.sinceDate,
    this.entries});

  /// [sinceDate] Point in time (Unix timestamp) from which the statistics are collected 
  int? sinceDate;

  /// [entries] Network statistics entries
  List<NetworkStatisticsEntry>? entries;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  NetworkStatistics.fromJson(Map<String, dynamic> json)  {
    sinceDate = json['since_date'] == null ? null : json['since_date'];
    entries = json['entries'] == null ? null : List<NetworkStatisticsEntry>.from((json['entries'] ?? [])!.map((item) => NetworkStatisticsEntry.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "since_date": sinceDate,
      "entries": entries?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'networkStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}