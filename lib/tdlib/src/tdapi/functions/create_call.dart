part of '../tdapi.dart';

class CreateCall extends TdFunction {

  /// Creates a new call
  CreateCall({this.userId,
    this.protocol,
    this.isVideo});

  /// [userId] Identifier of the user to be called 
  int? userId;

  /// [protocol] Description of the call protocols supported by the application 
  CallProtocol? protocol;

  /// [isVideo] True, if a video call needs to be created
  bool? isVideo;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateCall.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "protocol": protocol == null ? null : protocol?.toJson(),
      "is_video": isVideo,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'createCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}