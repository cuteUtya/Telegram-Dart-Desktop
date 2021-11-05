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
    List<PageBlock>? pre_pageBlocks;
    try{
      pre_pageBlocks=List<PageBlock>.from((json['page_blocks'] ?? [])!.map((item) => PageBlock.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    pageBlocks = pre_pageBlocks;
    int? pre_viewCount;
    try{
      pre_viewCount=json['view_count'];
   }catch(_){}
    viewCount = pre_viewCount;
    int? pre_version;
    try{
      pre_version=json['version'];
   }catch(_){}
    version = pre_version;
    bool? pre_isRtl;
    try{
      pre_isRtl=json['is_rtl'];
   }catch(_){}
    isRtl = pre_isRtl;
    bool? pre_isFull;
    try{
      pre_isFull=json['is_full'];
   }catch(_){}
    isFull = pre_isFull;
    InternalLinkType? pre_feedbackLink;
    try{
      pre_feedbackLink=InternalLinkType.fromJson(json['feedback_link'] ?? <String, dynamic>{});
   }catch(_){}
    feedbackLink = pre_feedbackLink;
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