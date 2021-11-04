part of '../tdapi.dart';

class GetApplicationDownloadLink extends TdFunction {

  /// Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
  GetApplicationDownloadLink();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetApplicationDownloadLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getApplicationDownloadLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}