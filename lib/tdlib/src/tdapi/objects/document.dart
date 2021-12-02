part of '../tdapi.dart';

class Document extends TdObject {

  /// Describes a document of any type
  Document({this.fileName,
    this.mimeType,
    this.minithumbnail,
    this.thumbnail,
    this.document});

  /// [fileName] Original name of the file; as defined by the sender 
  String? fileName;

  /// [mimeType] MIME type of the file; as defined by the sender
  String? mimeType;

  /// [minithumbnail] Document minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [thumbnail] Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null 
  Thumbnail? thumbnail;

  /// [document] File containing the document
  File? document;

  /// Parse from a json
  Document.fromJson(Map<String, dynamic> json)  {
    fileName = json['file_name'] == null ? null : json['file_name'];
    mimeType = json['mime_type'] == null ? null : json['mime_type'];
    minithumbnail = json['minithumbnail'] == null ? null : Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    thumbnail = json['thumbnail'] == null ? null : Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
    document = json['document'] == null ? null : File.fromJson(json['document'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_name": fileName,
      "mime_type": mimeType,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "document": document == null ? null : document?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'document';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}