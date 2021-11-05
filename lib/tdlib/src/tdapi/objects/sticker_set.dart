part of '../tdapi.dart';

class StickerSet extends TdObject {

  /// Represents a sticker set
  StickerSet({this.id,
    this.title,
    this.name,
    this.thumbnail,
    this.thumbnailOutline,
    this.isInstalled,
    this.isArchived,
    this.isOfficial,
    this.isAnimated,
    this.isMasks,
    this.isViewed,
    this.stickers,
    this.emojis});

  /// [id] Identifier of the sticker set
  int? id;

  /// [title] Title of the sticker set 
  String? title;

  /// [name] Name of the sticker set 
  String? name;

  /// [thumbnail] Sticker set thumbnail in WEBP or TGS format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
  Thumbnail? thumbnail;

  /// [thumbnailOutline] Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
  List<ClosedVectorPath>? thumbnailOutline;

  /// [isInstalled] True, if the sticker set has been installed by the current user
  bool? isInstalled;

  /// [isArchived] True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
  bool? isArchived;

  /// [isOfficial] True, if the sticker set is official
  bool? isOfficial;

  /// [isAnimated] True, is the stickers in the set are animated 
  bool? isAnimated;

  /// [isMasks] True, if the stickers in the set are masks 
  bool? isMasks;

  /// [isViewed] True for already viewed trending sticker sets
  bool? isViewed;

  /// [stickers] List of stickers in this set
  List<Sticker>? stickers;

  /// [emojis] A list of emoji corresponding to the stickers in the same order. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
  List<Emojis>? emojis;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StickerSet.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_name;
    try{
      pre_name=json['name'];
   }catch(_){}
    name = pre_name;
    Thumbnail? pre_thumbnail;
    try{
      pre_thumbnail=Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    List<ClosedVectorPath>? pre_thumbnailOutline;
    try{
      pre_thumbnailOutline=List<ClosedVectorPath>.from((json['thumbnail_outline'] ?? [])!.map((item) => ClosedVectorPath.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    thumbnailOutline = pre_thumbnailOutline;
    bool? pre_isInstalled;
    try{
      pre_isInstalled=json['is_installed'];
   }catch(_){}
    isInstalled = pre_isInstalled;
    bool? pre_isArchived;
    try{
      pre_isArchived=json['is_archived'];
   }catch(_){}
    isArchived = pre_isArchived;
    bool? pre_isOfficial;
    try{
      pre_isOfficial=json['is_official'];
   }catch(_){}
    isOfficial = pre_isOfficial;
    bool? pre_isAnimated;
    try{
      pre_isAnimated=json['is_animated'];
   }catch(_){}
    isAnimated = pre_isAnimated;
    bool? pre_isMasks;
    try{
      pre_isMasks=json['is_masks'];
   }catch(_){}
    isMasks = pre_isMasks;
    bool? pre_isViewed;
    try{
      pre_isViewed=json['is_viewed'];
   }catch(_){}
    isViewed = pre_isViewed;
    List<Sticker>? pre_stickers;
    try{
      pre_stickers=List<Sticker>.from((json['stickers'] ?? [])!.map((item) => Sticker.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    stickers = pre_stickers;
    List<Emojis>? pre_emojis;
    try{
      pre_emojis=List<Emojis>.from((json['emojis'] ?? [])!.map((item) => Emojis.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    emojis = pre_emojis;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "name": name,
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "thumbnail_outline": thumbnailOutline?.map((i) => i.toJson()).toList(),
      "is_installed": isInstalled,
      "is_archived": isArchived,
      "is_official": isOfficial,
      "is_animated": isAnimated,
      "is_masks": isMasks,
      "is_viewed": isViewed,
      "stickers": stickers?.map((i) => i.toJson()).toList(),
      "emojis": emojis?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'stickerSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}