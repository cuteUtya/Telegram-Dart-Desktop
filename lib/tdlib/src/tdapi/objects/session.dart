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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    bool? pre_isCurrent;
    try{
      pre_isCurrent=json['is_current'];
   }catch(_){}
    isCurrent = pre_isCurrent;
    bool? pre_isPasswordPending;
    try{
      pre_isPasswordPending=json['is_password_pending'];
   }catch(_){}
    isPasswordPending = pre_isPasswordPending;
    int? pre_apiId;
    try{
      pre_apiId=json['api_id'];
   }catch(_){}
    apiId = pre_apiId;
    String? pre_applicationName;
    try{
      pre_applicationName=json['application_name'];
   }catch(_){}
    applicationName = pre_applicationName;
    String? pre_applicationVersion;
    try{
      pre_applicationVersion=json['application_version'];
   }catch(_){}
    applicationVersion = pre_applicationVersion;
    bool? pre_isOfficialApplication;
    try{
      pre_isOfficialApplication=json['is_official_application'];
   }catch(_){}
    isOfficialApplication = pre_isOfficialApplication;
    String? pre_deviceModel;
    try{
      pre_deviceModel=json['device_model'];
   }catch(_){}
    deviceModel = pre_deviceModel;
    String? pre_platform;
    try{
      pre_platform=json['platform'];
   }catch(_){}
    platform = pre_platform;
    String? pre_systemVersion;
    try{
      pre_systemVersion=json['system_version'];
   }catch(_){}
    systemVersion = pre_systemVersion;
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
    String? pre_country;
    try{
      pre_country=json['country'];
   }catch(_){}
    country = pre_country;
    String? pre_region;
    try{
      pre_region=json['region'];
   }catch(_){}
    region = pre_region;
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