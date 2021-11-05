part of '../tdapi.dart';

class ConnectedWebsites extends TdObject {

  /// Contains a list of websites the current user is logged in with Telegram
  ConnectedWebsites({this.websites});

  /// [websites] List of connected websites
  List<ConnectedWebsite>? websites;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ConnectedWebsites.fromJson(Map<String, dynamic> json)  {
    List<ConnectedWebsite>? pre_websites;
    try{
      pre_websites=List<ConnectedWebsite>.from((json['websites'] ?? [])!.map((item) => ConnectedWebsite.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    websites = pre_websites;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "websites": websites?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'connectedWebsites';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}