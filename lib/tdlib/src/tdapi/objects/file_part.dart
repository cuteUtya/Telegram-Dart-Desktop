part of '../tdapi.dart';

class FilePart extends TdObject {

  /// Contains a part of a file
  FilePart({this.data});

  /// [data] File bytes
  String? data;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  FilePart.fromJson(Map<String, dynamic> json)  {
    String? pre_data;
    try{
      pre_data=json['data'];
   }catch(_){}
    data = pre_data;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "data": data,
    };
  }

  static const CONSTRUCTOR = 'filePart';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}