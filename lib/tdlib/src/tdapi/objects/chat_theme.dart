part of '../tdapi.dart';

class ChatTheme extends TdObject {

  /// Describes a chat theme
  ChatTheme({this.name,
    this.lightSettings,
    this.darkSettings});

  /// [name] Theme name
  String? name;

  /// [lightSettings] Theme settings for a light chat theme
  ThemeSettings? lightSettings;

  /// [darkSettings] Theme settings for a dark chat theme
  ThemeSettings? darkSettings;

  /// Parse from a json
  ChatTheme.fromJson(Map<String, dynamic> json)  {
    name = json['name'];
    lightSettings = ThemeSettings.fromJson(json['light_settings'] ?? <String, dynamic>{});
    darkSettings = ThemeSettings.fromJson(json['dark_settings'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "light_settings": lightSettings == null ? null : lightSettings?.toJson(),
      "dark_settings": darkSettings == null ? null : darkSettings?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}