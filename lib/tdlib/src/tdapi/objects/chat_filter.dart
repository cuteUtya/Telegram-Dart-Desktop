part of '../tdapi.dart';

class ChatFilter extends TdObject {

  /// Represents a filter of user chats
  ChatFilter({this.title,
    this.iconName,
    this.pinnedChatIds,
    this.includedChatIds,
    this.excludedChatIds,
    this.excludeMuted,
    this.excludeRead,
    this.excludeArchived,
    this.includeContacts,
    this.includeNonContacts,
    this.includeBots,
    this.includeGroups,
    this.includeChannels});

  /// [title] The title of the filter; 1-12 characters without line feeds
  String? title;

  /// [iconName] The icon name for short filter representation. If non-empty, must be one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work".. If empty, use getChatFilterDefaultIconName to get default icon name for the filter
  String? iconName;

  /// [pinnedChatIds] The chat identifiers of pinned chats in the filtered chat list
  List<int>? pinnedChatIds;

  /// [includedChatIds] The chat identifiers of always included chats in the filtered chat list
  List<int>? includedChatIds;

  /// [excludedChatIds] The chat identifiers of always excluded chats in the filtered chat list
  List<int>? excludedChatIds;

  /// [excludeMuted] True, if muted chats need to be excluded
  bool? excludeMuted;

  /// [excludeRead] True, if read chats need to be excluded
  bool? excludeRead;

  /// [excludeArchived] True, if archived chats need to be excluded
  bool? excludeArchived;

  /// [includeContacts] True, if contacts need to be included
  bool? includeContacts;

  /// [includeNonContacts] True, if non-contact users need to be included
  bool? includeNonContacts;

  /// [includeBots] True, if bots need to be included
  bool? includeBots;

  /// [includeGroups] True, if basic groups and supergroups need to be included
  bool? includeGroups;

  /// [includeChannels] True, if channels need to be included
  bool? includeChannels;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatFilter.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_iconName;
    try{
      pre_iconName=json['icon_name'];
   }catch(_){}
    iconName = pre_iconName;
    List<int>? pre_pinnedChatIds;
    try{
      pre_pinnedChatIds=List<int>.from((json['pinned_chat_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    pinnedChatIds = pre_pinnedChatIds;
    List<int>? pre_includedChatIds;
    try{
      pre_includedChatIds=List<int>.from((json['included_chat_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    includedChatIds = pre_includedChatIds;
    List<int>? pre_excludedChatIds;
    try{
      pre_excludedChatIds=List<int>.from((json['excluded_chat_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    excludedChatIds = pre_excludedChatIds;
    bool? pre_excludeMuted;
    try{
      pre_excludeMuted=json['exclude_muted'];
   }catch(_){}
    excludeMuted = pre_excludeMuted;
    bool? pre_excludeRead;
    try{
      pre_excludeRead=json['exclude_read'];
   }catch(_){}
    excludeRead = pre_excludeRead;
    bool? pre_excludeArchived;
    try{
      pre_excludeArchived=json['exclude_archived'];
   }catch(_){}
    excludeArchived = pre_excludeArchived;
    bool? pre_includeContacts;
    try{
      pre_includeContacts=json['include_contacts'];
   }catch(_){}
    includeContacts = pre_includeContacts;
    bool? pre_includeNonContacts;
    try{
      pre_includeNonContacts=json['include_non_contacts'];
   }catch(_){}
    includeNonContacts = pre_includeNonContacts;
    bool? pre_includeBots;
    try{
      pre_includeBots=json['include_bots'];
   }catch(_){}
    includeBots = pre_includeBots;
    bool? pre_includeGroups;
    try{
      pre_includeGroups=json['include_groups'];
   }catch(_){}
    includeGroups = pre_includeGroups;
    bool? pre_includeChannels;
    try{
      pre_includeChannels=json['include_channels'];
   }catch(_){}
    includeChannels = pre_includeChannels;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "icon_name": iconName,
      "pinned_chat_ids": pinnedChatIds?.map((i) => i).toList(),
      "included_chat_ids": includedChatIds?.map((i) => i).toList(),
      "excluded_chat_ids": excludedChatIds?.map((i) => i).toList(),
      "exclude_muted": excludeMuted,
      "exclude_read": excludeRead,
      "exclude_archived": excludeArchived,
      "include_contacts": includeContacts,
      "include_non_contacts": includeNonContacts,
      "include_bots": includeBots,
      "include_groups": includeGroups,
      "include_channels": includeChannels,
    };
  }

  static const CONSTRUCTOR = 'chatFilter';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}