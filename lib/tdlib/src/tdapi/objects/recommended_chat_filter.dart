part of '../tdapi.dart';

class RecommendedChatFilter extends TdObject {

  /// Describes a recommended chat filter
  RecommendedChatFilter({this.filter,
    this.description});

  /// [filter] The chat filter 
  ChatFilter? filter;

  /// [description] Chat filter description
  String? description;

  /// Parse from a json
  RecommendedChatFilter.fromJson(Map<String, dynamic> json)  {
    filter = ChatFilter.fromJson(json['filter'] ?? <String, dynamic>{});
    description = json['description'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "filter": filter == null ? null : filter?.toJson(),
      "description": description,
    };
  }

  static const CONSTRUCTOR = 'recommendedChatFilter';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}