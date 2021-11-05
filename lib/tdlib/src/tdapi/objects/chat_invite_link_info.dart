part of '../tdapi.dart';

class ChatInviteLinkInfo extends TdObject {

  /// Contains information about a chat invite link
  ChatInviteLinkInfo({this.chatId,
    this.accessibleFor,
    this.type,
    this.title,
    this.photo,
    this.memberCount,
    this.memberUserIds,
    this.isPublic});

  /// [chatId] Chat identifier of the invite link; 0 if the user has no access to the chat before joining
  int? chatId;

  /// [accessibleFor] If non-zero, the amount of time for which read access to the chat will remain available, in seconds
  int? accessibleFor;

  /// [type] Contains information about the type of the chat
  ChatType? type;

  /// [title] Title of the chat
  String? title;

  /// [photo] Chat photo; may be null
  ChatPhotoInfo? photo;

  /// [memberCount] Number of members in the chat
  int? memberCount;

  /// [memberUserIds] User identifiers of some chat members that may be known to the current user
  List<int>? memberUserIds;

  /// [isPublic] True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
  bool? isPublic;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLinkInfo.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_accessibleFor;
    try{
      pre_accessibleFor=json['accessible_for'];
   }catch(_){}
    accessibleFor = pre_accessibleFor;
    ChatType? pre_type;
    try{
      pre_type=ChatType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    ChatPhotoInfo? pre_photo;
    try{
      pre_photo=ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    int? pre_memberCount;
    try{
      pre_memberCount=json['member_count'];
   }catch(_){}
    memberCount = pre_memberCount;
    List<int>? pre_memberUserIds;
    try{
      pre_memberUserIds=List<int>.from((json['member_user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    memberUserIds = pre_memberUserIds;
    bool? pre_isPublic;
    try{
      pre_isPublic=json['is_public'];
   }catch(_){}
    isPublic = pre_isPublic;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "accessible_for": accessibleFor,
      "type": type == null ? null : type?.toJson(),
      "title": title,
      "photo": photo == null ? null : photo?.toJson(),
      "member_count": memberCount,
      "member_user_ids": memberUserIds?.map((i) => i).toList(),
      "is_public": isPublic,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}