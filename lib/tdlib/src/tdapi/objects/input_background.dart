part of '../tdapi.dart';

class InputBackground extends TdObject {

  /// Contains information about background to set
  InputBackground();

  

  /// a InputBackground return type can be :
  /// * InputBackgroundLocal
  /// * InputBackgroundRemote
  factory InputBackground.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputBackgroundLocal.CONSTRUCTOR:
        return InputBackgroundLocal.fromJson(json);
      case InputBackgroundRemote.CONSTRUCTOR:
        return InputBackgroundRemote.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputBackground';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputBackgroundLocal extends InputBackground {

  /// A background from a local file
  InputBackgroundLocal({this.background});

  /// [background] Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
  InputFile? background;

  /// Parse from a json
  InputBackgroundLocal.fromJson(Map<String, dynamic> json)  {
    background = json['background'] == null ? null : InputFile.fromJson(json['background'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background": background == null ? null : background?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputBackgroundLocal';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputBackgroundRemote extends InputBackground {

  /// A background from the server
  InputBackgroundRemote({this.backgroundId});

  /// [backgroundId] The background identifier
  int? backgroundId;

  /// Parse from a json
  InputBackgroundRemote.fromJson(Map<String, dynamic> json)  {
    backgroundId = json['background_id'] == null ? null : int.tryParse(json['background_id'] ?? "");
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background_id": backgroundId,
    };
  }

  static const CONSTRUCTOR = 'inputBackgroundRemote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}