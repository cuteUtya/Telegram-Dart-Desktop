part of '../tdapi.dart';

class SavedCredentials extends TdObject {

  /// Contains information about saved card credentials
  SavedCredentials({this.id,
    this.title});

  /// [id] Unique identifier of the saved credentials 
  String? id;

  /// [title] Title of the saved credentials
  String? title;

  /// Parse from a json
  SavedCredentials.fromJson(Map<String, dynamic> json)  {
    String? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'savedCredentials';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}