part of '../tdapi.dart';

class Reaction extends TdObject {

  /// Contains stickers which must be used for reaction animation rendering
  Reaction({this.reaction,
    this.title,
    this.isActive,
    this.staticIcon,
    this.appearAnimation,
    this.selectAnimation,
    this.activateAnimation,
    this.effectAnimation,
    this.aroundAnimation,
    this.centerAnimation});

  /// [reaction] Text representation of the reaction
  String? reaction;

  /// [title] Reaction title
  String? title;

  /// [isActive] True, if the reaction can be added to new messages and enabled in chats
  bool? isActive;

  /// [staticIcon] Static icon for the reaction
  Sticker? staticIcon;

  /// [appearAnimation] Appear animation for the reaction
  Sticker? appearAnimation;

  /// [selectAnimation] Select animation for the reaction
  Sticker? selectAnimation;

  /// [activateAnimation] Activate animation for the reaction
  Sticker? activateAnimation;

  /// [effectAnimation] Effect animation for the reaction
  Sticker? effectAnimation;

  /// [aroundAnimation] Around animation for the reaction; may be null
  Sticker? aroundAnimation;

  /// [centerAnimation] Center animation for the reaction; may be null
  Sticker? centerAnimation;

  /// Parse from a json
  Reaction.fromJson(Map<String, dynamic> json)  {
    reaction = json['reaction'] == null ? null : json['reaction'];
    title = json['title'] == null ? null : json['title'];
    isActive = json['is_active'] == null ? null : json['is_active'];
    staticIcon = json['static_icon'] == null ? null : Sticker.fromJson(json['static_icon'] ?? <String, dynamic>{});
    appearAnimation = json['appear_animation'] == null ? null : Sticker.fromJson(json['appear_animation'] ?? <String, dynamic>{});
    selectAnimation = json['select_animation'] == null ? null : Sticker.fromJson(json['select_animation'] ?? <String, dynamic>{});
    activateAnimation = json['activate_animation'] == null ? null : Sticker.fromJson(json['activate_animation'] ?? <String, dynamic>{});
    effectAnimation = json['effect_animation'] == null ? null : Sticker.fromJson(json['effect_animation'] ?? <String, dynamic>{});
    aroundAnimation = json['around_animation'] == null ? null : Sticker.fromJson(json['around_animation'] ?? <String, dynamic>{});
    centerAnimation = json['center_animation'] == null ? null : Sticker.fromJson(json['center_animation'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reaction": reaction,
      "title": title,
      "is_active": isActive,
      "static_icon": staticIcon == null ? null : staticIcon?.toJson(),
      "appear_animation": appearAnimation == null ? null : appearAnimation?.toJson(),
      "select_animation": selectAnimation == null ? null : selectAnimation?.toJson(),
      "activate_animation": activateAnimation == null ? null : activateAnimation?.toJson(),
      "effect_animation": effectAnimation == null ? null : effectAnimation?.toJson(),
      "around_animation": aroundAnimation == null ? null : aroundAnimation?.toJson(),
      "center_animation": centerAnimation == null ? null : centerAnimation?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'reaction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}