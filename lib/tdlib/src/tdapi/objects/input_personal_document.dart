part of '../tdapi.dart';

class InputPersonalDocument extends TdObject {

  /// A personal document to be saved to Telegram Passport
  InputPersonalDocument({this.files,
    this.translation});

  /// [files] List of files containing the pages of the document 
  List<InputFile>? files;

  /// [translation] List of files containing a certified English translation of the document
  List<InputFile>? translation;

  /// Parse from a json
  InputPersonalDocument.fromJson(Map<String, dynamic> json)  {
    files = json['files'] == null ? null : List<InputFile>.from((json['files'] ?? [])!.map((item) => InputFile.fromJson(item ?? <String, dynamic>{})).toList());
    translation = json['translation'] == null ? null : List<InputFile>.from((json['translation'] ?? [])!.map((item) => InputFile.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "files": files?.map((i) => i.toJson()).toList(),
      "translation": translation?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'inputPersonalDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}