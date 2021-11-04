part of '../tdapi.dart';

class GetRecentlyOpenedChats extends TdFunction {

  /// Returns recently opened chats, this is an offline request. Returns chats in the order of last opening
  GetRecentlyOpenedChats({this.limit});

  /// [limit] The maximum number of chats to be returned
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetRecentlyOpenedChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getRecentlyOpenedChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}