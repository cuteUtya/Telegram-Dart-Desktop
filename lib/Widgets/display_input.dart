import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class DataInput extends StatefulWidget {
  DataInput({
    Key? key,
    this.value = "",
    this.validationCallback,
    this.asyncValidationCallback,
    this.defaultText,
    this.fontSize = 24,
    this.onValueChange,
    this.externalControll = false,
    this.fieldName = "",
    this.getHintCallback,
    this.obscureText = false,
    this.customLabel,
    this.onDataStateChanged,
    this.labelFontSize = 14,
    this.hintText = "",
  }) : super(key: key) {
    if (externalControll) {
      _lastInputValue = value;
      _inputController.text = value;
      _inputController.selection = TextSelection(baseOffset: value.length, extentOffset: value.length);
    }
  }

  final String value;
  final bool Function(String)? validationCallback;
  final Future<bool>? Function(String)? asyncValidationCallback;
  final String? defaultText;
  final double fontSize;
  final void Function(String)? onValueChange;
  final String fieldName;
  final String Function(String)? getHintCallback;
  final bool obscureText;
  final Widget? customLabel;
  final double labelFontSize;
  final bool externalControll;
  final void Function(DataState)? onDataStateChanged;
  late String hintText;
  late String _lastInputValue = "";

  final TextEditingController _inputController = TextEditingController();

  @override
  State<StatefulWidget> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  DataState dataState = DataState.empty;
  late String _displaingHint = widget.hintText;

  @override
  Widget build(BuildContext contex) {
    var clr = getBorderColor(dataState);
    var border = UnderlineInputBorder(borderSide: BorderSide(color: clr, width: 2));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.customLabel == null
          ? Text(
              widget.fieldName,
              style: TextDisplay.create(
                  textAlign: TextAlign.left,
                  size: widget.labelFontSize,
                  textColor: ClientTheme.currentTheme.getField("RegularText")),
            )
          : widget.customLabel!,
      Stack(children: [
        //hint field
        TextField(
          style: TextStyle(fontSize: widget.fontSize),
          enabled: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: _displaingHint,
              hintStyle: TextStyle(color: ClientTheme.currentTheme.getField("DataInputHintColor")),
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border),
        ),
        //input field
        TextField(
          obscureText: widget.obscureText,
          controller: widget.externalControll ? widget._inputController : null,
          onSubmitted: (value) {
            setState(() {
              if (widget.externalControll) {
                widget._inputController.text = widget.hintText.isEmpty || _displaingHint.isEmpty ? value : widget.hintText;
                value = widget._inputController.text;
              }
              validate(value);
            });
          },
          style: TextStyle(fontSize: widget.fontSize),
          onChanged: (value) {
            if (widget.onValueChange != null) widget.onValueChange!(value);
            setState(() {
              if (widget.externalControll) {
                _displaingHint = _getHintText(widget._inputController.text);
              }
              if (widget.getHintCallback != null) {
                widget.hintText = widget.getHintCallback!(value);
                widget._inputController.selection =
                    TextSelection.fromPosition(TextPosition(offset: getTextPosition(widget._lastInputValue, value)));
                widget._lastInputValue = value;
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
            });
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: widget.defaultText,
              hintStyle: TextStyle(color: ClientTheme.currentTheme.getField("DataInputHintColor")),
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border),
        )
      ])
    ]);
  }

  void validate(String input) {
    if (input.isNotEmpty) {
      if (widget.validationCallback != null) {
        setState(() => dataState = widget.validationCallback!(input) ? DataState.valid : DataState.invalid);
      } else if (widget.asyncValidationCallback != null) {
        widget.asyncValidationCallback!(input)!
            .then((value) => setState(() => dataState = value ? DataState.valid : DataState.invalid));
      }
      if (widget.onDataStateChanged != null) {
        widget.onDataStateChanged!(dataState);
      }
    } else {
      dataState = DataState.empty;
    }
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

    if (inputValue.isEmpty || widget.hintText.substring(0, inputValue.length) == inputValue) {
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
