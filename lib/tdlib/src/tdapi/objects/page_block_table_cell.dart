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
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    isHeader = json['is_header'] == null ? null : json['is_header'];
    colspan = json['colspan'] == null ? null : json['colspan'];
    rowspan = json['rowspan'] == null ? null : json['rowspan'];
    align = json['align'] == null ? null : PageBlockHorizontalAlignment.fromJson(json['align'] ?? <String, dynamic>{});
    valign = json['valign'] == null ? null : PageBlockVerticalAlignment.fromJson(json['valign'] ?? <String, dynamic>{});
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