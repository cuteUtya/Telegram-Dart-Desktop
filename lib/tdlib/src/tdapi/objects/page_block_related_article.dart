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
    url = json['url'];
    title = json['title'];
    description = json['description'];
    photo = Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    author = json['author'];
    publishDate = json['publish_date'];
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