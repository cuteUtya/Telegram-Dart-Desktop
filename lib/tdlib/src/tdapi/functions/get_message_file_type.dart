part of '../tdapi.dart';

class GetMessageFileType extends TdFunction {

  /// Returns information about a file with messages exported from another app
  GetMessageFileType({this.messageFileHead});

  /// [messageFileHead] Beginning of the message file; up to 100 first lines
  String? messageFileHead;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageFileType.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_file_head": messageFileHead,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageFileType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}