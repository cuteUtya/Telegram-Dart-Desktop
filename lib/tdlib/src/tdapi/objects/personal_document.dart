part of '../tdapi.dart';

class PersonalDocument extends TdObject {

  /// A personal document, containing some information about a user
  PersonalDocument({this.files,
    this.translation});

  /// [files] List of files containing the pages of the document 
  List<DatedFile>? files;

  /// [translation] List of files containing a certified English translation of the document
  List<DatedFile>? translation;

  /// Parse from a json
  PersonalDocument.fromJson(Map<String, dynamic> json)  {
    files = json['files'] == null ? null : List<DatedFile>.from((json['files'] ?? [])!.map((item) => DatedFile.fromJson(item ?? <String, dynamic>{})).toList());
    translation = json['translation'] == null ? null : List<DatedFile>.from((json['translation'] ?? [])!.map((item) => DatedFile.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "files": files?.map((i) => i.toJson()).toList(),
      "translation": translation?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'personalDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}