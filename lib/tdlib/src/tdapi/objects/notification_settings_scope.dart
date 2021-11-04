part of '../tdapi.dart';

class NotificationSettingsScope extends TdObject {

  /// Describes the types of chats to which notification settings are relevant
  NotificationSettingsScope();

  

  /// a NotificationSettingsScope return type can be :
  /// * NotificationSettingsScopePrivateChats
  /// * NotificationSettingsScopeGroupChats
  /// * NotificationSettingsScopeChannelChats
  factory NotificationSettingsScope.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case NotificationSettingsScopePrivateChats.CONSTRUCTOR:
        return NotificationSettingsScopePrivateChats.fromJson(json);
      case NotificationSettingsScopeGroupChats.CONSTRUCTOR:
        return NotificationSettingsScopeGroupChats.fromJson(json);
      case NotificationSettingsScopeChannelChats.CONSTRUCTOR:
        return NotificationSettingsScopeChannelChats.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'notificationSettingsScope';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class NotificationSettingsScopePrivateChats extends NotificationSettingsScope {

  /// Notification settings applied to all private and secret chats when the corresponding chat setting has a default value
  NotificationSettingsScopePrivateChats();

  

  /// Parse from a json
  NotificationSettingsScopePrivateChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'notificationSettingsScopePrivateChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class NotificationSettingsScopeGroupChats extends NotificationSettingsScope {

  /// Notification settings applied to all basic groups and supergroups when the corresponding chat setting has a default value
  NotificationSettingsScopeGroupChats();

  

  /// Parse from a json
  NotificationSettingsScopeGroupChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'notificationSettingsScopeGroupChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class NotificationSettingsScopeChannelChats extends NotificationSettingsScope {

  /// Notification settings applied to all channels when the corresponding chat setting has a default value
  NotificationSettingsScopeChannelChats();

  

  /// Parse from a json
  NotificationSettingsScopeChannelChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'notificationSettingsScopeChannelChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}