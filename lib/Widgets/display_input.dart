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
      this.controllStateSingly = true,
      this.fieldName = "",
      this.getHintCallback,
      this.customLabelDisplay,
      this.onDataStateChanged,
      this.labelFontSize = 14,
      this.hintText = ""})
      : super(key: key) {
    if (!controllStateSingly) {
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
  final bool controllStateSingly;
  final OnDataStateChanged? onDataStateChanged;
  late String hintText;

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
              widget._inputController.text = value;
              widget._inputController.selection = TextSelection.fromPosition(
                TextPosition(offset: widget._inputController.text.length),
              );
              if (widget.getHintCallback != null) {
                widget.hintText = widget.getHintCallback!(value);
              }
              dataState = value.isEmpty ? DataState.empty : DataState.valid;
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

  String _getHintText(String? inputValue) {
    if (inputValue != null && inputValue.length <= widget.hintText.length) {
      if (inputValue.isEmpty ||
          widget.hintText.substring(0, inputValue.length) == inputValue) {
        return widget.hintText;
      }
      return "";
    }
    return widget.hintText;
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
