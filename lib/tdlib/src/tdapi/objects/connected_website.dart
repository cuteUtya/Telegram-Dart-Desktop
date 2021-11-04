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
    id = int.tryParse(json['id'] ?? "");
    domainName = json['domain_name'];
    botUserId = json['bot_user_id'];
    browser = json['browser'];
    platform = json['platform'];
    logInDate = json['log_in_date'];
    lastActiveDate = json['last_active_date'];
    ip = json['ip'];
    location = json['location'];
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