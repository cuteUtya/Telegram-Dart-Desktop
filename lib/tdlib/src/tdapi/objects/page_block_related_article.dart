part of '../tdapi.dart';

class PageBlockRelatedArticle extends TdObject {

  /// Contains information about a related article
  PageBlockRelatedArticle({this.url,
    this.title,
    this.description,
    this.photo,
    this.author,
    this.publishDate});

  /// [url] Related article URL 
  String? url;

  /// [title] Article title; may be empty 
  String? title;

  /// [description] Article description; may be empty
  String? description;

  /// [photo] Article photo; may be null
  Photo? photo;

  /// [author] Article author; may be empty 
  String? author;

  /// [publishDate] Point in time (Unix timestamp) when the article was published; 0 if unknown
  int? publishDate;

  /// Parse from a json
  PageBlockRelatedArticle.fromJson(Map<String, dynamic> json)  {
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_description;
    try{
      pre_description=json['description'];
   }catch(_){}
    description = pre_description;
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    String? pre_author;
    try{
      pre_author=json['author'];
   }catch(_){}
    author = pre_author;
    int? pre_publishDate;
    try{
      pre_publishDate=json['publish_date'];
   }catch(_){}
    publishDate = pre_publishDate;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "title": title,
      "description": description,
      "photo": photo == null ? null : photo?.toJson(),
      "author": author,
      "publish_date": publishDate,
    };
  }

  static const CONSTRUCTOR = 'pageBlockRelatedArticle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}