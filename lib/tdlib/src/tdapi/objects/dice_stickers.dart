part of '../tdapi.dart';

class DiceStickers extends TdObject {

  /// Contains animated stickers which must be used for dice animation rendering
  DiceStickers();

  

  /// a DiceStickers return type can be :
  /// * DiceStickersRegular
  /// * DiceStickersSlotMachine
  factory DiceStickers.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case DiceStickersRegular.CONSTRUCTOR:
        return DiceStickersRegular.fromJson(json);
      case DiceStickersSlotMachine.CONSTRUCTOR:
        return DiceStickersSlotMachine.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'diceStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DiceStickersRegular extends DiceStickers {

  /// A regular animated sticker
  DiceStickersRegular({this.sticker});

  /// [sticker] The animated sticker with the dice animation
  Sticker? sticker;

  /// Parse from a json
  DiceStickersRegular.fromJson(Map<String, dynamic> json)  {
    sticker = json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'diceStickersRegular';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class DiceStickersSlotMachine extends DiceStickers {

  /// Animated stickers to be combined into a slot machine
  DiceStickersSlotMachine({this.background,
    this.lever,
    this.leftReel,
    this.centerReel,
    this.rightReel});

  /// [background] The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
  Sticker? background;

  /// [lever] The animated sticker with the lever animation. The lever animation must play once in the initial dice state
  Sticker? lever;

  /// [leftReel] The animated sticker with the left reel
  Sticker? leftReel;

  /// [centerReel] The animated sticker with the center reel
  Sticker? centerReel;

  /// [rightReel] The animated sticker with the right reel
  Sticker? rightReel;

  /// Parse from a json
  DiceStickersSlotMachine.fromJson(Map<String, dynamic> json)  {
    background = json['background'] == null ? null : Sticker.fromJson(json['background'] ?? <String, dynamic>{});
    lever = json['lever'] == null ? null : Sticker.fromJson(json['lever'] ?? <String, dynamic>{});
    leftReel = json['left_reel'] == null ? null : Sticker.fromJson(json['left_reel'] ?? <String, dynamic>{});
    centerReel = json['center_reel'] == null ? null : Sticker.fromJson(json['center_reel'] ?? <String, dynamic>{});
    rightReel = json['right_reel'] == null ? null : Sticker.fromJson(json['right_reel'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background": background == null ? null : background?.toJson(),
      "lever": lever == null ? null : lever?.toJson(),
      "left_reel": leftReel == null ? null : leftReel?.toJson(),
      "center_reel": centerReel == null ? null : centerReel?.toJson(),
      "right_reel": rightReel == null ? null : rightReel?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'diceStickersSlotMachine';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}