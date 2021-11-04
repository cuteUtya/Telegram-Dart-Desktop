part of '../tdapi.dart';

class EditChatFilter extends TdFunction {

  /// Edits existing chat filter. Returns information about the edited chat filter
  EditChatFilter({this.chatFilterId,
    this.filter});

  /// [chatFilterId] Chat filter identifier 
  int? chatFilterId;

  /// [filter] The edited chat filter
  ChatFilter? filter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditChatFilter.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_filter_id": chatFilterId,
      "filter": filter == null ? null : filter?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editChatFilter';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}