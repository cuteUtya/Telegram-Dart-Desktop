import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class DataInput extends StatefulWidget {
  const DataInput(
      {Key? key,
      required this.validationCallback,
      this.defaultText,
      this.fontSize = 22,
      this.onValueChange,
      this.fieldName = "label",
      this.getHintCallback,
      this.customLabelDisplay})
      : super(key: key);

  final DataValidationCallback validationCallback;
  final String? defaultText;
  final double fontSize;
  final OnChangeValue? onValueChange;
  final String fieldName;
  final GetHintCallback? getHintCallback;
  final Widget? customLabelDisplay;

  @override
  State<StatefulWidget> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  DataState dataState = DataState.empty;
  String hintText = "";
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext contex) {
    var clr = getBorderColor(dataState);
    print(clr);
    var border =
        UnderlineInputBorder(borderSide: BorderSide(color: clr, width: 2));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.customLabelDisplay == null
          ? Text(
              widget.fieldName,
              style: TextDisplay.create(
                  textAlign: TextAlign.left,
                  size: 16,
                  textColor: ClientTheme.currentTheme.getField("RegularText")),
            )
          : widget.customLabelDisplay ??
              const Text(
                  "Are you seriosly, Google, you think here can be NULL? Look at ternary operator!"),
      Stack(children: [
        TextField(
          style: TextStyle(fontSize: widget.fontSize),
          enabled: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: hintText,
              hintStyle: TextStyle(
                  color:
                      ClientTheme.currentTheme.getField("DataInputHintColor")),
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border),
        ),
        TextField(
          controller: inputController,
          onSubmitted: (value) {
            setState(() {
              inputController.text = hintText.isEmpty ? value : hintText;
              validate(inputController.text);
            });
          },
          style: TextStyle(fontSize: widget.fontSize),
          onChanged: (value) {
            widget.onValueChange ?? (value);
            setState(() {
              inputController.text = value;
              inputController.selection = TextSelection.fromPosition(
                TextPosition(offset: inputController.text.length),
              );
              if (widget.getHintCallback != null) {
                hintText = widget.getHintCallback!(value);
              }
              dataState = value.isEmpty ? DataState.empty : DataState.valid;
            });
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 12),
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
    });
  }

  static Color getBorderColor(DataState state) {
    String fieldName = "";
    switch (state) {
      case DataState.empty:
        fieldName = "DataInputEmtyColor";
        break;
      case DataState.invalid:
        fieldName = "DataInputInvalidColor";
        break;
      case DataState.valid:
        fieldName = "DataInputValidColor";
        break;
    }
    return ClientTheme.currentTheme.getField(fieldName);
  }
}

enum DataState { valid, invalid, empty }

typedef DataValidationCallback = bool Function(String);
typedef GetHintCallback = String Function(String);
typedef OnChangeValue = void Function(String);
