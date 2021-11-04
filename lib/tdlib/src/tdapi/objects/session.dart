part of '../tdapi.dart';

class Session extends TdObject {

  /// Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order
  Session({this.id,
    this.isCurrent,
    this.isPasswordPending,
    this.apiId,
    this.applicationName,
    this.applicationVersion,
    this.isOfficialApplication,
    this.deviceModel,
    this.platform,
    this.systemVersion,
    this.logInDate,
    this.lastActiveDate,
    this.ip,
    this.country,
    this.region});

  /// [id] Session identifier
  int? id;

  /// [isCurrent] True, if this session is the current session
  bool? isCurrent;

  /// [isPasswordPending] True, if a password is needed to complete authorization of the session
  bool? isPasswordPending;

  /// [apiId] Telegram API identifier, as provided by the application
  int? apiId;

  /// [applicationName] Name of the application, as provided by the application
  String? applicationName;

  /// [applicationVersion] The version of the application, as provided by the application
  String? applicationVersion;

  /// [isOfficialApplication] True, if the application is an official application or uses the api_id of an official application
  bool? isOfficialApplication;

  /// [deviceModel] Model of the device the application has been run or is running on, as provided by the application
  String? deviceModel;

  /// [platform] Operating system the application has been run or is running on, as provided by the application
  String? platform;

  /// [systemVersion] Version of the operating system the application has been run or is running on, as provided by the application
  String? systemVersion;

  /// [logInDate] Point in time (Unix timestamp) when the user has logged in
  int? logInDate;

  /// [lastActiveDate] Point in time (Unix timestamp) when the session was last used
  int? lastActiveDate;

  /// [ip] IP address from which the session was created, in human-readable format
  String? ip;

  /// [country] A two-letter country code for the country from which the session was created, based on the IP address
  String? country;

  /// [region] Region code from which the session was created, based on the IP address
  String? region;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Session.fromJson(Map<String, dynamic> json)  {
    id = int.tryParse(json['id'] ?? "");
    isCurrent = json['is_current'];
    isPasswordPending = json['is_password_pending'];
    apiId = json['api_id'];
    applicationName = json['application_name'];
    applicationVersion = json['application_version'];
    isOfficialApplication = json['is_official_application'];
    deviceModel = json['device_model'];
    platform = json['platform'];
    systemVersion = json['system_version'];
    logInDate = json['log_in_date'];
    lastActiveDate = json['last_active_date'];
    ip = json['ip'];
    country = json['country'];
    region = json['region'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "is_current": isCurrent,
      "is_password_pending": isPasswordPending,
      "api_id": apiId,
      "application_name": applicationName,
      "application_version": applicationVersion,
      "is_official_application": isOfficialApplication,
      "device_model": deviceModel,
      "platform": platform,
      "system_version": systemVersion,
      "log_in_date": logInDate,
      "last_active_date": lastActiveDate,
      "ip": ip,
      "country": country,
      "region": region,
    };
  }

  static const CONSTRUCTOR = 'session';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}