part of '../tdapi.dart';

class RecommendedChatFilters extends TdObject {

  /// Contains a list of recommended chat filters
  RecommendedChatFilters({this.chatFilters});

  /// [chatFilters] List of recommended chat filters
  List<RecommendedChatFilter>? chatFilters;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RecommendedChatFilters.fromJson(Map<String, dynamic> json)  {
    chatFilters = json['chat_filters'] == null ? null : List<RecommendedChatFilter>.from((json['chat_filters'] ?? [])!.map((item) => RecommendedChatFilter.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_filters": chatFilters?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'recommendedChatFilters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}