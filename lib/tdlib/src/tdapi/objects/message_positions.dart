part of '../tdapi.dart';

class MessagePositions extends TdObject {

  /// Contains a list of message positions
  MessagePositions({this.totalCount,
    this.positions});

  /// [totalCount] Total count of messages found 
  int? totalCount;

  /// [positions] List of message positions
  List<MessagePosition>? positions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessagePositions.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'] == null ? null : json['total_count'];
    positions = json['positions'] == null ? null : List<MessagePosition>.from((json['positions'] ?? [])!.map((item) => MessagePosition.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "positions": positions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messagePositions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}