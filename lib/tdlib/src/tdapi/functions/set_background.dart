part of '../tdapi.dart';

class SetBackground extends TdFunction {

  /// Changes the background selected by the user; adds background to the list of installed backgrounds
  SetBackground({this.background,
    this.type,
    this.forDarkTheme});

  /// [background] The input background to use; pass null to create a new filled backgrounds or to remove the current background
  InputBackground? background;

  /// [type] Background type; pass null to use the default type of the remote background or to remove the current background
  BackgroundType? type;

  /// [forDarkTheme] True, if the background is chosen for dark theme
  bool? forDarkTheme;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetBackground.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background": background == null ? null : background?.toJson(),
      "type": type == null ? null : type?.toJson(),
      "for_dark_theme": forDarkTheme,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setBackground';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}