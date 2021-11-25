import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class DataInput extends StatefulWidget {
  DataInput(
      {Key? key,
      this.value = "",
      required this.validationCallback,
      this.defaultText,
      this.fontSize = 24,
      this.onValueChange,
      this.externalControll = false,
      this.fieldName = "",
      this.getHintCallback,
      this.customLabelDisplay,
      this.onDataStateChanged,
      this.labelFontSize = 14,
      this.hintText = ""})
      : super(key: key) {
    if (externalControll) {
      _inputController.text = value;
      _inputController.selection =
          TextSelection(baseOffset: value.length, extentOffset: value.length);
    }
  }

  final String value;
  final DataValidationCallback validationCallback;
  final String? defaultText;
  final double fontSize;
  final OnChangeValue? onValueChange;
  final String fieldName;
  final GetHintCallback? getHintCallback;
  final Widget? customLabelDisplay;
  final double labelFontSize;
  final bool externalControll;
  final OnDataStateChanged? onDataStateChanged;
  late String hintText;

  final TextEditingController _inputController = TextEditingController();

  @override
  State<StatefulWidget> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  DataState dataState = DataState.empty;
  late String _displaingHint = widget.hintText;
  String _lastInputValue = "";

  @override
  Widget build(BuildContext contex) {
    var clr = getBorderColor(dataState);
    var border =
        UnderlineInputBorder(borderSide: BorderSide(color: clr, width: 2));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.customLabelDisplay == null
          ? Text(
              widget.fieldName,
              style: TextDisplay.create(
                  textAlign: TextAlign.left,
                  size: widget.labelFontSize,
                  textColor: TextColor.RegularText),
            )
          : widget.customLabelDisplay ?? const Text(""),
      Stack(children: [
        //hint field
        TextField(
          style: TextStyle(fontSize: widget.fontSize),
          enabled: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: _displaingHint,
              hintStyle: TextStyle(
                  color:
                      ClientTheme.currentTheme.getField("DataInputHintColor")),
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border),
        ),
        //input field
        TextField(
          controller: widget._inputController,
          onSubmitted: (value) {
            setState(() {
              widget._inputController.text =
                  widget.hintText.isEmpty || _displaingHint.isEmpty
                      ? value
                      : widget.hintText;
              validate(widget._inputController.text);
            });
          },
          style: TextStyle(fontSize: widget.fontSize),
          onChanged: (value) {
            if (widget.onValueChange != null) widget.onValueChange!(value);
            setState(() {
              _displaingHint = _getHintText(widget._inputController.text);
              if (widget.getHintCallback != null) {
                widget.hintText = widget.getHintCallback!(value);
              }
              dataState = value.isEmpty ? DataState.empty : DataState.valid;
              //Be honestly, few line below isn't perfect way to
              //control input cursor
              //for example:
              //
              // | — user input cursor
              //
              //I very much love programming!|
              //I v|ery much love programming!
              //I vee|ry much love programming!
              //
              //cursor shift on two symbols here. Because i just compare two strings and
              //set value in position where strings different. Flutter don't allow
              //get cursor shifts (or allow, but i don't know about this). This (as i know) only
              //one bug and it's happen only if you write symbol in center of text,
              //which has the same value as the character on the left
              widget._inputController.selection = TextSelection.fromPosition(
                  TextPosition(
                      offset: getTextPosition(_lastInputValue, value)));
              _lastInputValue = value;
            });
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: widget.defaultText,
              hintStyle: TextStyle(
                  color:
                      ClientTheme.currentTheme.getField("DataInputHintColor")),
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border),
        )
      ])
    ]);
  }

  void validate(String input) {
    setState(() {
      dataState = input.isEmpty
          ? DataState.empty
          : (widget.validationCallback(input)
              ? DataState.valid
              : DataState.invalid);
      if (widget.onDataStateChanged != null) {
        widget.onDataStateChanged!(dataState);
      }
    });
  }

  int getTextPosition(String a, String b) {
    if (b.isEmpty) return 0;

    for (int i = 0; i < max(a.length, b.length); i++) {
      var aChar = i >= a.length ? "" : a[i];
      var bChar = i >= b.length ? "" : b[i];
      if (aChar != bChar) return i + (a.length < b.length ? 1 : 0);
    }

    return b.length;
  }

  String _getHintText(String? inputValue) {
    if (inputValue!.length > widget.hintText.length) return "";

    if (inputValue.isEmpty ||
        widget.hintText.substring(0, inputValue.length) == inputValue) {
      return widget.hintText;
    }
    return "";
  }

  Color getBorderColor(DataState state) {
    if (widget.value.isNotEmpty) {
      dataState = DataState.valid;
      return ClientTheme.currentTheme.getField("DataInputValidColor");
    }

    switch (state) {
      case DataState.empty:
        return ClientTheme.currentTheme.getField("DataInputEmtyColor");
      case DataState.invalid:
        return ClientTheme.currentTheme.getField("DataInputInvalidColor");
      case DataState.valid:
        return ClientTheme.currentTheme.getField("DataInputValidColor");
    }
  }
}

enum DataState { valid, invalid, empty }

typedef DataValidationCallback = bool Function(String);
typedef GetHintCallback = String Function(String);
typedef OnChangeValue = void Function(String);
typedef OnDataStateChanged = void Function(DataState);
