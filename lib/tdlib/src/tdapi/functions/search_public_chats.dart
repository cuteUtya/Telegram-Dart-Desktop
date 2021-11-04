part of '../tdapi.dart';

class SearchPublicChats extends TdFunction {

  /// Searches public chats by looking for specified query in their username and title. Currently only private chats, supergroups and channels can be public. Returns a meaningful number of results.. Excludes private chats with contacts and chats from the chat list from the results
  SearchPublicChats({this.query});

  /// [query] Query to search for
  String? query;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchPublicChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "query": query,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchPublicChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}