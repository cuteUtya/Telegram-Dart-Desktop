part of '../tdapi.dart';

class CreateNewSupergroupChat extends TdFunction {

  /// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
  CreateNewSupergroupChat({this.title,
    this.isChannel,
    this.description,
    this.location,
    this.forImport});

  /// [title] Title of the new chat; 1-128 characters
  String? title;

  /// [isChannel] True, if a channel chat needs to be created
  bool? isChannel;

  /// [description] Chat description; 0-255 characters
  String? description;

  /// [location] Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
  ChatLocation? location;

  /// [forImport] True, if the supergroup is created for importing messages using importMessage
  bool? forImport;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateNewSupergroupChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "is_channel": isChannel,
      "description": description,
      "location": location == null ? null : location?.toJson(),
      "for_import": forImport,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'createNewSupergroupChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}