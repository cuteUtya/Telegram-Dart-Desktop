part of '../tdapi.dart';

class ChatPhoto extends TdObject {

  /// Describes a chat or user profile photo
  ChatPhoto({this.id,
    this.addedDate,
    this.minithumbnail,
    this.sizes,
    this.animation});

  /// [id] Unique photo identifier
  int? id;

  /// [addedDate] Point in time (Unix timestamp) when the photo has been added
  int? addedDate;

  /// [minithumbnail] Photo minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [sizes] Available variants of the photo in JPEG format, in different size
  List<PhotoSize>? sizes;

  /// [animation] Animated variant of the photo in MPEG4 format; may be null
  AnimatedChatPhoto? animation;

  /// Parse from a json
  ChatPhoto.fromJson(Map<String, dynamic> json)  {
    id = int.tryParse(json['id'] ?? "");
    addedDate = json['added_date'];
    minithumbnail = Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    sizes = List<PhotoSize>.from((json['sizes'] ?? [])!.map((item) => PhotoSize.fromJson(item ?? <String, dynamic>{})).toList());
    animation = AnimatedChatPhoto.fromJson(json['animation'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "added_date": addedDate,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "sizes": sizes?.map((i) => i.toJson()).toList(),
      "animation": animation == null ? null : animation?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}