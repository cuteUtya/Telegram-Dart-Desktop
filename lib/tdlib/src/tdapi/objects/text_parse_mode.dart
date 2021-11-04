part of '../tdapi.dart';

class TextParseMode extends TdObject {

  /// Describes the way the text needs to be parsed for TextEntities
  TextParseMode();

  

  /// a TextParseMode return type can be :
  /// * TextParseModeMarkdown
  /// * TextParseModeHTML
  factory TextParseMode.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case TextParseModeMarkdown.CONSTRUCTOR:
        return TextParseModeMarkdown.fromJson(json);
      case TextParseModeHTML.CONSTRUCTOR:
        return TextParseModeHTML.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'textParseMode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class TextParseModeMarkdown extends TextParseMode {

  /// The text uses Markdown-style formatting
  TextParseModeMarkdown({this.version});

  /// [version] Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
  int? version;

  /// Parse from a json
  TextParseModeMarkdown.fromJson(Map<String, dynamic> json)  {
    version = json['version'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "version": version,
    };
  }

  static const CONSTRUCTOR = 'textParseModeMarkdown';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class TextParseModeHTML extends TextParseMode {

  /// The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
  TextParseModeHTML();

  

  /// Parse from a json
  TextParseModeHTML.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'textParseModeHTML';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}