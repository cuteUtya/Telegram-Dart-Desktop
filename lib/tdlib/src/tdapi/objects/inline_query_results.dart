part of '../tdapi.dart';

class InlineQueryResults extends TdObject {

  /// Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
  InlineQueryResults({this.inlineQueryId,
    this.nextOffset,
    this.results,
    this.switchPmText,
    this.switchPmParameter});

  /// [inlineQueryId] Unique identifier of the inline query 
  int? inlineQueryId;

  /// [nextOffset] The offset for the next request. If empty, there are no more results 
  String? nextOffset;

  /// [results] Results of the query
  List<InlineQueryResult>? results;

  /// [switchPmText] If non-empty, this text must be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter
  String? switchPmText;

  /// [switchPmParameter] Parameter for the bot start message
  String? switchPmParameter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InlineQueryResults.fromJson(Map<String, dynamic> json)  {
    inlineQueryId = int.tryParse(json['inline_query_id'] ?? "");
    nextOffset = json['next_offset'];
    results = List<InlineQueryResult>.from((json['results'] ?? [])!.map((item) => InlineQueryResult.fromJson(item ?? <String, dynamic>{})).toList());
    switchPmText = json['switch_pm_text'];
    switchPmParameter = json['switch_pm_parameter'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "inline_query_id": inlineQueryId,
      "next_offset": nextOffset,
      "results": results?.map((i) => i.toJson()).toList(),
      "switch_pm_text": switchPmText,
      "switch_pm_parameter": switchPmParameter,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResults';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}