part of '../tdapi.dart';

class ThemeSettings extends TdObject {

  /// Describes theme settings
  ThemeSettings({this.accentColor,
    this.background,
    this.outgoingMessageFill,
    this.animateOutgoingMessageFill,
    this.outgoingMessageAccentColor});

  /// [accentColor] Theme accent color in ARGB format
  int? accentColor;

  /// [background] The background to be used in chats; may be null
  Background? background;

  /// [outgoingMessageFill] The fill to be used as a background for outgoing messages
  BackgroundFill? outgoingMessageFill;

  /// [animateOutgoingMessageFill] If true, the freeform gradient fill needs to be animated on every sent message
  bool? animateOutgoingMessageFill;

  /// [outgoingMessageAccentColor] Accent color of outgoing messages in ARGB format
  int? outgoingMessageAccentColor;

  /// Parse from a json
  ThemeSettings.fromJson(Map<String, dynamic> json)  {
    accentColor = json['accent_color'];
    background = Background.fromJson(json['background'] ?? <String, dynamic>{});
    outgoingMessageFill = BackgroundFill.fromJson(json['outgoing_message_fill'] ?? <String, dynamic>{});
    animateOutgoingMessageFill = json['animate_outgoing_message_fill'];
    outgoingMessageAccentColor = json['outgoing_message_accent_color'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "accent_color": accentColor,
      "background": background == null ? null : background?.toJson(),
      "outgoing_message_fill": outgoingMessageFill == null ? null : outgoingMessageFill?.toJson(),
      "animate_outgoing_message_fill": animateOutgoingMessageFill,
      "outgoing_message_accent_color": outgoingMessageAccentColor,
    };
  }

  static const CONSTRUCTOR = 'themeSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}