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
    String? pre_fileName;
    try{
      pre_fileName=json['file_name'];
   }catch(_){}
    fileName = pre_fileName;
    String? pre_mimeType;
    try{
      pre_mimeType=json['mime_type'];
   }catch(_){}
    mimeType = pre_mimeType;
    Minithumbnail? pre_minithumbnail;
    try{
      pre_minithumbnail=Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    minithumbnail = pre_minithumbnail;
    Thumbnail? pre_thumbnail;
    try{
      pre_thumbnail=Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    File? pre_document;
    try{
      pre_document=File.fromJson(json['document'] ?? <String, dynamic>{});
   }catch(_){}
    document = pre_document;
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