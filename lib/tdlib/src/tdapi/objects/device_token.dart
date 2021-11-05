part of '../tdapi.dart';

class DeviceToken extends TdObject {

  /// Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org
  DeviceToken();

  

  /// a DeviceToken return type can be :
  /// * DeviceTokenFirebaseCloudMessaging
  /// * DeviceTokenApplePush
  /// * DeviceTokenApplePushVoIP
  /// * DeviceTokenWindowsPush
  /// * DeviceTokenMicrosoftPush
  /// * DeviceTokenMicrosoftPushVoIP
  /// * DeviceTokenWebPush
  /// * DeviceTokenSimplePush
  /// * DeviceTokenUbuntuPush
  /// * DeviceTokenBlackBerryPush
  /// * DeviceTokenTizenPush
  factory DeviceToken.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case DeviceTokenFirebaseCloudMessaging.CONSTRUCTOR:
        return DeviceTokenFirebaseCloudMessaging.fromJson(json);
      case DeviceTokenApplePush.CONSTRUCTOR:
        return DeviceTokenApplePush.fromJson(json);
      case DeviceTokenApplePushVoIP.CONSTRUCTOR:
        return DeviceTokenApplePushVoIP.fromJson(json);
      case DeviceTokenWindowsPush.CONSTRUCTOR:
        return DeviceTokenWindowsPush.fromJson(json);
      case DeviceTokenMicrosoftPush.CONSTRUCTOR:
        return DeviceTokenMicrosoftPush.fromJson(json);
      case DeviceTokenMicrosoftPushVoIP.CONSTRUCTOR:
        return DeviceTokenMicrosoftPushVoIP.fromJson(json);
      case DeviceTokenWebPush.CONSTRUCTOR:
        return DeviceTokenWebPush.fromJson(json);
      case DeviceTokenSimplePush.CONSTRUCTOR:
        return DeviceTokenSimplePush.fromJson(json);
      case DeviceTokenUbuntuPush.CONSTRUCTOR:
        return DeviceTokenUbuntuPush.fromJson(json);
      case DeviceTokenBlackBerryPush.CONSTRUCTOR:
        return DeviceTokenBlackBerryPush.fromJson(json);
      case DeviceTokenTizenPush.CONSTRUCTOR:
        return DeviceTokenTizenPush.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'deviceToken';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenFirebaseCloudMessaging extends DeviceToken {

  /// A token for Firebase Cloud Messaging
  DeviceTokenFirebaseCloudMessaging({this.token,
    this.encrypt});

  /// [token] Device registration token; may be empty to de-register a device 
  String? token;

  /// [encrypt] True, if push notifications must be additionally encrypted
  bool? encrypt;

  /// Parse from a json
  DeviceTokenFirebaseCloudMessaging.fromJson(Map<String, dynamic> json)  {
    String? pre_token;
    try{
      pre_token=json['token'];
   }catch(_){}
    token = pre_token;
    bool? pre_encrypt;
    try{
      pre_encrypt=json['encrypt'];
   }catch(_){}
    encrypt = pre_encrypt;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "token": token,
      "encrypt": encrypt,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenFirebaseCloudMessaging';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenApplePush extends DeviceToken {

  /// A token for Apple Push Notification service
  DeviceTokenApplePush({this.deviceToken,
    this.isAppSandbox});

  /// [deviceToken] Device token; may be empty to de-register a device 
  String? deviceToken;

  /// [isAppSandbox] True, if App Sandbox is enabled
  bool? isAppSandbox;

  /// Parse from a json
  DeviceTokenApplePush.fromJson(Map<String, dynamic> json)  {
    String? pre_deviceToken;
    try{
      pre_deviceToken=json['device_token'];
   }catch(_){}
    deviceToken = pre_deviceToken;
    bool? pre_isAppSandbox;
    try{
      pre_isAppSandbox=json['is_app_sandbox'];
   }catch(_){}
    isAppSandbox = pre_isAppSandbox;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "device_token": deviceToken,
      "is_app_sandbox": isAppSandbox,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenApplePush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenApplePushVoIP extends DeviceToken {

  /// A token for Apple Push Notification service VoIP notifications
  DeviceTokenApplePushVoIP({this.deviceToken,
    this.isAppSandbox,
    this.encrypt});

  /// [deviceToken] Device token; may be empty to de-register a device 
  String? deviceToken;

  /// [isAppSandbox] True, if App Sandbox is enabled 
  bool? isAppSandbox;

  /// [encrypt] True, if push notifications must be additionally encrypted
  bool? encrypt;

  /// Parse from a json
  DeviceTokenApplePushVoIP.fromJson(Map<String, dynamic> json)  {
    String? pre_deviceToken;
    try{
      pre_deviceToken=json['device_token'];
   }catch(_){}
    deviceToken = pre_deviceToken;
    bool? pre_isAppSandbox;
    try{
      pre_isAppSandbox=json['is_app_sandbox'];
   }catch(_){}
    isAppSandbox = pre_isAppSandbox;
    bool? pre_encrypt;
    try{
      pre_encrypt=json['encrypt'];
   }catch(_){}
    encrypt = pre_encrypt;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "device_token": deviceToken,
      "is_app_sandbox": isAppSandbox,
      "encrypt": encrypt,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenApplePushVoIP';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenWindowsPush extends DeviceToken {

  /// A token for Windows Push Notification Services
  DeviceTokenWindowsPush({this.accessToken});

  /// [accessToken] The access token that will be used to send notifications; may be empty to de-register a device
  String? accessToken;

  /// Parse from a json
  DeviceTokenWindowsPush.fromJson(Map<String, dynamic> json)  {
    String? pre_accessToken;
    try{
      pre_accessToken=json['access_token'];
   }catch(_){}
    accessToken = pre_accessToken;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "access_token": accessToken,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenWindowsPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenMicrosoftPush extends DeviceToken {

  /// A token for Microsoft Push Notification Service
  DeviceTokenMicrosoftPush({this.channelUri});

  /// [channelUri] Push notification channel URI; may be empty to de-register a device
  String? channelUri;

  /// Parse from a json
  DeviceTokenMicrosoftPush.fromJson(Map<String, dynamic> json)  {
    String? pre_channelUri;
    try{
      pre_channelUri=json['channel_uri'];
   }catch(_){}
    channelUri = pre_channelUri;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "channel_uri": channelUri,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenMicrosoftPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenMicrosoftPushVoIP extends DeviceToken {

  /// A token for Microsoft Push Notification Service VoIP channel
  DeviceTokenMicrosoftPushVoIP({this.channelUri});

  /// [channelUri] Push notification channel URI; may be empty to de-register a device
  String? channelUri;

  /// Parse from a json
  DeviceTokenMicrosoftPushVoIP.fromJson(Map<String, dynamic> json)  {
    String? pre_channelUri;
    try{
      pre_channelUri=json['channel_uri'];
   }catch(_){}
    channelUri = pre_channelUri;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "channel_uri": channelUri,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenMicrosoftPushVoIP';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenWebPush extends DeviceToken {

  /// A token for web Push API
  DeviceTokenWebPush({this.endpoint,
    this.p256dhBase64url,
    this.authBase64url});

  /// [endpoint] Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
  String? endpoint;

  /// [p256dhBase64url] Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
  String? p256dhBase64url;

  /// [authBase64url] Base64url-encoded authentication secret
  String? authBase64url;

  /// Parse from a json
  DeviceTokenWebPush.fromJson(Map<String, dynamic> json)  {
    String? pre_endpoint;
    try{
      pre_endpoint=json['endpoint'];
   }catch(_){}
    endpoint = pre_endpoint;
    String? pre_p256dhBase64url;
    try{
      pre_p256dhBase64url=json['p256dh_base64url'];
   }catch(_){}
    p256dhBase64url = pre_p256dhBase64url;
    String? pre_authBase64url;
    try{
      pre_authBase64url=json['auth_base64url'];
   }catch(_){}
    authBase64url = pre_authBase64url;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "endpoint": endpoint,
      "p256dh_base64url": p256dhBase64url,
      "auth_base64url": authBase64url,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenWebPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenSimplePush extends DeviceToken {

  /// A token for Simple Push API for Firefox OS
  DeviceTokenSimplePush({this.endpoint});

  /// [endpoint] Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
  String? endpoint;

  /// Parse from a json
  DeviceTokenSimplePush.fromJson(Map<String, dynamic> json)  {
    String? pre_endpoint;
    try{
      pre_endpoint=json['endpoint'];
   }catch(_){}
    endpoint = pre_endpoint;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "endpoint": endpoint,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenSimplePush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenUbuntuPush extends DeviceToken {

  /// A token for Ubuntu Push Client service
  DeviceTokenUbuntuPush({this.token});

  /// [token] Token; may be empty to de-register a device
  String? token;

  /// Parse from a json
  DeviceTokenUbuntuPush.fromJson(Map<String, dynamic> json)  {
    String? pre_token;
    try{
      pre_token=json['token'];
   }catch(_){}
    token = pre_token;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "token": token,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenUbuntuPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenBlackBerryPush extends DeviceToken {

  /// A token for BlackBerry Push Service
  DeviceTokenBlackBerryPush({this.token});

  /// [token] Token; may be empty to de-register a device
  String? token;

  /// Parse from a json
  DeviceTokenBlackBerryPush.fromJson(Map<String, dynamic> json)  {
    String? pre_token;
    try{
      pre_token=json['token'];
   }catch(_){}
    token = pre_token;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "token": token,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenBlackBerryPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DeviceTokenTizenPush extends DeviceToken {

  /// A token for Tizen Push Service
  DeviceTokenTizenPush({this.regId});

  /// [regId] Push service registration identifier; may be empty to de-register a device
  String? regId;

  /// Parse from a json
  DeviceTokenTizenPush.fromJson(Map<String, dynamic> json)  {
    String? pre_regId;
    try{
      pre_regId=json['reg_id'];
   }catch(_){}
    regId = pre_regId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reg_id": regId,
    };
  }

  static const CONSTRUCTOR = 'deviceTokenTizenPush';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}