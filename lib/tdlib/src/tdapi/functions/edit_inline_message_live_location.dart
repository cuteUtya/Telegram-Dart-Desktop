part of '../tdapi.dart';

class EditInlineMessageLiveLocation extends TdFunction {

  /// Edits the content of a live location in an inline message sent via a bot; for bots only
  EditInlineMessageLiveLocation({this.inlineMessageId,
    this.replyMarkup,
    this.location,
    this.heading,
    this.proximityAlertRadius});

  /// [inlineMessageId] Inline message identifier
  String? inlineMessageId;

  /// [replyMarkup] The new message reply markup; pass null if none
  ReplyMarkup? replyMarkup;

  /// [location] New location content of the message; pass null to stop sharing the live location
  Location? location;

  /// [heading] The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
  int? heading;

  /// [proximityAlertRadius] The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
  int? proximityAlertRadius;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditInlineMessageLiveLocation.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "location": location == null ? null : location?.toJson(),
      "heading": heading,
      "proximity_alert_radius": proximityAlertRadius,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editInlineMessageLiveLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}