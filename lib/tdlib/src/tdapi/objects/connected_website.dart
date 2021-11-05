part of '../tdapi.dart';

class ConnectedWebsite extends TdObject {

  /// Contains information about one website the current user is logged in with Telegram
  ConnectedWebsite({this.id,
    this.domainName,
    this.botUserId,
    this.browser,
    this.platform,
    this.logInDate,
    this.lastActiveDate,
    this.ip,
    this.location});

  /// [id] Website identifier
  int? id;

  /// [domainName] The domain name of the website
  String? domainName;

  /// [botUserId] User identifier of a bot linked with the website
  int? botUserId;

  /// [browser] The version of a browser used to log in
  String? browser;

  /// [platform] Operating system the browser is running on
  String? platform;

  /// [logInDate] Point in time (Unix timestamp) when the user was logged in
  int? logInDate;

  /// [lastActiveDate] Point in time (Unix timestamp) when obtained authorization was last used
  int? lastActiveDate;

  /// [ip] IP address from which the user was logged in, in human-readable format
  String? ip;

  /// [location] Human-readable description of a country and a region, from which the user was logged in, based on the IP address
  String? location;

  /// Parse from a json
  ConnectedWebsite.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_domainName;
    try{
      pre_domainName=json['domain_name'];
   }catch(_){}
    domainName = pre_domainName;
    int? pre_botUserId;
    try{
      pre_botUserId=json['bot_user_id'];
   }catch(_){}
    botUserId = pre_botUserId;
    String? pre_browser;
    try{
      pre_browser=json['browser'];
   }catch(_){}
    browser = pre_browser;
    String? pre_platform;
    try{
      pre_platform=json['platform'];
   }catch(_){}
    platform = pre_platform;
    int? pre_logInDate;
    try{
      pre_logInDate=json['log_in_date'];
   }catch(_){}
    logInDate = pre_logInDate;
    int? pre_lastActiveDate;
    try{
      pre_lastActiveDate=json['last_active_date'];
   }catch(_){}
    lastActiveDate = pre_lastActiveDate;
    String? pre_ip;
    try{
      pre_ip=json['ip'];
   }catch(_){}
    ip = pre_ip;
    String? pre_location;
    try{
      pre_location=json['location'];
   }catch(_){}
    location = pre_location;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "domain_name": domainName,
      "bot_user_id": botUserId,
      "browser": browser,
      "platform": platform,
      "log_in_date": logInDate,
      "last_active_date": lastActiveDate,
      "ip": ip,
      "location": location,
    };
  }

  static const CONSTRUCTOR = 'connectedWebsite';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}