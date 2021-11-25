part of '../tdapi.dart';

class StickerSetInfo extends TdObject {

  /// Represents short information about a sticker set
  StickerSetInfo({this.id,
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
    this.size,
    this.covers});

  /// [id] Identifier of the sticker set
  int? id;

  /// [title] Title of the sticker set 
  String? title;

  /// [name] Name of the sticker set 
  String? name;

  /// [thumbnail] Sticker set thumbnail in WEBP or TGS format with width and height 100; may be null
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

  /// [size] Total number of stickers in the set
  int? size;

  /// [covers] Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
  List<Sticker>? covers;

  /// Parse from a json
  StickerSetInfo.fromJson(Map<String, dynamic> json)  {
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
    int? pre_size;
    try{
      pre_size=json['size'];
   }catch(_){}
    size = pre_size;
    List<Sticker>? pre_covers;
    try{
      pre_covers=List<Sticker>.from((json['covers'] ?? [])!.map((item) => Sticker.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    covers = pre_covers;
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
      "size": size,
      "covers": covers?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'stickerSetInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}