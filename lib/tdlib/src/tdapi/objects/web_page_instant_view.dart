part of '../tdapi.dart';

class WebPageInstantView extends TdObject {

  /// Describes an instant view page for a web page
  WebPageInstantView({this.pageBlocks,
    this.viewCount,
    this.version,
    this.isRtl,
    this.isFull,
    this.feedbackLink});

  /// [pageBlocks] Content of the web page
  List<PageBlock>? pageBlocks;

  /// [viewCount] Number of the instant view views; 0 if unknown
  int? viewCount;

  /// [version] Version of the instant view, currently can be 1 or 2
  int? version;

  /// [isRtl] True, if the instant view must be shown from right to left
  bool? isRtl;

  /// [isFull] True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
  bool? isFull;

  /// [feedbackLink] An internal link to be opened to leave feedback about the instant view
  InternalLinkType? feedbackLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  WebPageInstantView.fromJson(Map<String, dynamic> json)  {
    pageBlocks = json['page_blocks'] == null ? null : List<PageBlock>.from((json['page_blocks'] ?? [])!.map((item) => PageBlock.fromJson(item ?? <String, dynamic>{})).toList());
    viewCount = json['view_count'] == null ? null : json['view_count'];
    version = json['version'] == null ? null : json['version'];
    isRtl = json['is_rtl'] == null ? null : json['is_rtl'];
    isFull = json['is_full'] == null ? null : json['is_full'];
    feedbackLink = json['feedback_link'] == null ? null : InternalLinkType.fromJson(json['feedback_link'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "page_blocks": pageBlocks?.map((i) => i.toJson()).toList(),
      "view_count": viewCount,
      "version": version,
      "is_rtl": isRtl,
      "is_full": isFull,
      "feedback_link": feedbackLink == null ? null : feedbackLink?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'webPageInstantView';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}