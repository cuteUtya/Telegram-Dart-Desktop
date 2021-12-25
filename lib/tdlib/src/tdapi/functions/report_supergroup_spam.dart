part of '../tdapi.dart';

class ReportSupergroupSpam extends TdFunction {

  /// Reports messages in a supergroup as spam; requires administrator rights in the supergroup
  ReportSupergroupSpam({this.supergroupId,
    this.messageIds});

  /// [supergroupId] Supergroup identifier 
  int? supergroupId;

  /// [messageIds] Identifiers of messages to report
  List<int>? messageIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReportSupergroupSpam.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "message_ids": messageIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'reportSupergroupSpam';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}