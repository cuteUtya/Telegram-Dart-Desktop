part of '../tdapi.dart';

class MessageStatistics extends TdObject {

  /// A detailed statistics about a message
  MessageStatistics({this.messageInteractionGraph});

  /// [messageInteractionGraph] A graph containing number of message views and shares
  StatisticalGraph? messageInteractionGraph;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageStatistics.fromJson(Map<String, dynamic> json)  {
    messageInteractionGraph = StatisticalGraph.fromJson(json['message_interaction_graph'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_interaction_graph": messageInteractionGraph == null ? null : messageInteractionGraph?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}