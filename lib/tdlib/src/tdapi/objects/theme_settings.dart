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
    int? pre_accentColor;
    try{
      pre_accentColor=json['accent_color'];
   }catch(_){}
    accentColor = pre_accentColor;
    Background? pre_background;
    try{
      pre_background=Background.fromJson(json['background'] ?? <String, dynamic>{});
   }catch(_){}
    background = pre_background;
    BackgroundFill? pre_outgoingMessageFill;
    try{
      pre_outgoingMessageFill=BackgroundFill.fromJson(json['outgoing_message_fill'] ?? <String, dynamic>{});
   }catch(_){}
    outgoingMessageFill = pre_outgoingMessageFill;
    bool? pre_animateOutgoingMessageFill;
    try{
      pre_animateOutgoingMessageFill=json['animate_outgoing_message_fill'];
   }catch(_){}
    animateOutgoingMessageFill = pre_animateOutgoingMessageFill;
    int? pre_outgoingMessageAccentColor;
    try{
      pre_outgoingMessageAccentColor=json['outgoing_message_accent_color'];
   }catch(_){}
    outgoingMessageAccentColor = pre_outgoingMessageAccentColor;
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