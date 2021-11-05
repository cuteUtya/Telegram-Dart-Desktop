part of '../tdapi.dart';

class PageBlockTableCell extends TdObject {

  /// Represents a cell of a table
  PageBlockTableCell({this.text,
    this.isHeader,
    this.colspan,
    this.rowspan,
    this.align,
    this.valign});

  /// [text] Cell text; may be null. If the text is null, then the cell must be invisible 
  RichText? text;

  /// [isHeader] True, if it is a header cell
  bool? isHeader;

  /// [colspan] The number of columns the cell spans
  int? colspan;

  /// [rowspan] The number of rows the cell spans
  int? rowspan;

  /// [align] Horizontal cell content alignment
  PageBlockHorizontalAlignment? align;

  /// [valign] Vertical cell content alignment
  PageBlockVerticalAlignment? valign;

  /// Parse from a json
  PageBlockTableCell.fromJson(Map<String, dynamic> json)  {
    RichText? pre_text;
    try{
      pre_text=RichText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    bool? pre_isHeader;
    try{
      pre_isHeader=json['is_header'];
   }catch(_){}
    isHeader = pre_isHeader;
    int? pre_colspan;
    try{
      pre_colspan=json['colspan'];
   }catch(_){}
    colspan = pre_colspan;
    int? pre_rowspan;
    try{
      pre_rowspan=json['rowspan'];
   }catch(_){}
    rowspan = pre_rowspan;
    PageBlockHorizontalAlignment? pre_align;
    try{
      pre_align=PageBlockHorizontalAlignment.fromJson(json['align'] ?? <String, dynamic>{});
   }catch(_){}
    align = pre_align;
    PageBlockVerticalAlignment? pre_valign;
    try{
      pre_valign=PageBlockVerticalAlignment.fromJson(json['valign'] ?? <String, dynamic>{});
   }catch(_){}
    valign = pre_valign;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "is_header": isHeader,
      "colspan": colspan,
      "rowspan": rowspan,
      "align": align == null ? null : align?.toJson(),
      "valign": valign == null ? null : valign?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockTableCell';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}