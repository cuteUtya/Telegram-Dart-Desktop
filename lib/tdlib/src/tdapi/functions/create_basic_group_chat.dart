part of '../tdapi.dart';

class CreateBasicGroupChat extends TdFunction {

  /// Returns an existing chat corresponding to a known basic group
  CreateBasicGroupChat({this.basicGroupId,
    this.force});

  /// [basicGroupId] Basic group identifier 
  int? basicGroupId;

  /// [force] If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
  bool? force;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateBasicGroupChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "basic_group_id": basicGroupId,
      "force": force,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'createBasicGroupChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}