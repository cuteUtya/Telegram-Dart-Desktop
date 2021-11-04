part of '../tdapi.dart';

class GetChatFilterDefaultIconName extends TdFunction {

  /// Returns default icon name for a filter. Can be called synchronously
  GetChatFilterDefaultIconName({this.filter});

  /// [filter] Chat filter
  ChatFilter? filter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatFilterDefaultIconName.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "filter": filter == null ? null : filter?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatFilterDefaultIconName';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}