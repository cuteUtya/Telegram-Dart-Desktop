import 'package:flutter/material.dart';

abstract class ComponentsData {
  /// [Мюсли]
  /// В Spectrum данная штуковина может быть применена
  /// для управления выделенными сообщениями, поле ввода будет заменятся
  /// на actionBar (обязательно с красивой анимацией)
  /// [/Мюсли]

  Widget actionBar({
    //https://spectrum.adobe.com/page/action-bar/#Emphasis
    bool isEmphasized = false,
    VoidCallback onClose,
    String counterText,
    List<ActionItem> actionGroup,
  });

  Widget actionButton({
    VoidCallback onClick,
    IconData? icon,
    //tooltip
    String? hideLabel,
    String? text,
    ButtonSize size = ButtonSize.medium,
    //https://spectrum.adobe.com/page/action-button/#Quiet
    bool quiet = false,
    //https://spectrum.adobe.com/page/action-button/#Emphasis
    bool selected = false,
    bool disabled = false,
    //black or white
    Color staticColor,
    Color selectedTextColor,
  });

  Widget button({
    String? text,
    //tooltip
    String? hideLabel,
    IconData? icon,
    Color? color,
    ButtonSize size = ButtonSize.medium,
    ButtonStyle style = ButtonStyle.outlined,
    bool isPending = false,
    bool isDisabled = false,
  });

  Widget divider({
    DividerSize size = DividerSize.medium,
    Axis orientatioin = Axis.horizontal,
  });

  // funny name :D
  // anims -> https://spectrum.adobe.com/page/popover/#Behaviors
  Widget popover({
    double? width,
    double? height,
    bool showTip = true,
  });

  // mobile only, for desktop use popover/context menu
  // anims -> https://spectrum.adobe.com/page/tray/#Animation
  Widget tray({
    List<Widget> items,
  });

  Widget alert({
    String text,
    IconData? icon,
    String? emphasizedText,
    List<Widget>? button,
  });

  Widget alertDialog({
    String title,
    String description,
    bool isWarning = false,
    List<Widget> buttons,
  });

  Widget contextualHelp({
    String title,
    String deskription,
  });

  Widget inlineAlert({
    String title,
    String body,
    IconData icon,
    MaterialColor color,
    List<Widget> buttons,
  });

  Widget toast({
    IconData icon,
    String text,
    Widget button,
    MaterialColor color,
    bool autoDismiss = true,
  });

  Widget tooltip({
    String text,
    IconData? icon,
    MaterialColor color,
  });

  Widget checkBox({
    String? label,
    bool selected = false,
    void Function(bool) onStateChange,
    bool isIndeterminate = false,
    ItemSize size = ItemSize.medium,
    bool emphasis = false,
    bool disabled = false,
    bool isReadOnly = false,
    bool isError = false,
  });

  Widget checkBoxGroup({
    String label,
    List<Widget> checkBoxes,
    Axis orientation = Axis.vertical,
    bool disabled,
    String helpText,
    //if true [helpText] will be error text
    bool isError,
  });

  Widget comboBox({
    String label,
    List<String> values,
    void Function(String) onValueChanged,
    String? value,
    String? helpText,
    double? width,
    ItemSize size = ItemSize.medium,
    LabelPosition labelPosition = LabelPosition.top,
    bool hasAutocomplete = true,
    bool quiet = false,
    bool error = false,
    bool disabled = false,
    bool readOnly = false,
  });

  Widget fieldLabel({
    TextEditingController? controller,
    String? label,
    LabelPosition labelPosition = LabelPosition.top,
    ItemSize size = ItemSize.medium,
    bool isRequired = false,
    bool isDisabled = false,
  });

  Widget radioGroup({
    List<Widget> radioButtons,
    String? label,
    String? description,
    LabelPosition labelPosition = LabelPosition.top,
    Axis orientation = Axis.vertical,
    ItemSize size = ItemSize.medium,
    bool emphasized = false,
    bool isRequired = false,
    bool isError = false,
    bool isDisabled = false,
    bool isReadOnly = false,
    String? erorrMessage,
  });

  Widget slider({
    String? label,
    LabelPosition labelPosition = LabelPosition.top,
    double value = 50,
    double minValue = 0,
    double maxValue = 100,
    double step = 1,
    double? width,
    bool hasFill = true,
    double fillStart = 0,
    Gradient? gradient,
    bool isEditable = true,
    bool isDisabled = false,
  });

  Widget switch_({
    String? label,
    bool value = false,
    void Function(bool) onValueChanged,
    bool isSelected = false,
    ItemSize size = ItemSize.medium,
    bool isDisabled = false,
    bool isReadOnly = false,
  });

  Widget textArea({
    String? label,
    LabelPosition labelPosition = LabelPosition.top,
    bool required = false,
    String? value,
    double? width,
    double? height,
    ItemSize size = ItemSize.medium,
    bool quiet = false,
    bool disabled = false,
    bool readOnly = false,
    String? helpText,
    bool error = false,
  });

  Widget textField({
    String? label,
    LabelPosition labelPosition = LabelPosition.top,
    String? value,
    double? width,
    ItemSize size = ItemSize.medium,
    bool quiet = false,
    bool required = false,
    int? characterCount,
    bool? valid,
    //error text if valid = false
    String? helpText,
    bool disabled = false,
    bool readOnly = false,
    InputType inputType = InputType.text,
  });

  Widget tabs({
    List<TabItem> items,
    int value,
    void Function(int) onValueChanged,
    bool disabled = false,
    Axis orietation = Axis.horizontal,
    bool quiet = false,
    bool emphasis,
  });

  Widget tag({
    String label,
    bool removable = true,
    bool isError = false,
    bool disabled = false,
    bool readOnly = false,
  });
}

class ActionItem {
  const ActionItem({required this.icon, required this.onClick});
  final IconData icon;
  final VoidCallback onClick;
}

class TabItem {
  const TabItem({
    required this.label,
    this.icon,
  });

  final IconData? icon;
  final String label;
}

enum ButtonSize {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
}

enum ButtonStyle {
  fill,
  outlined,
}

enum DividerSize {
  small,
  medium,
  large,
}

enum AlertSemantic {
  neutral,
  informative,
  negative,
}

enum ItemSize {
  small,
  medium,
  large,
  extraLarge,
}

enum LabelPosition {
  left,
  top,
}

enum InputType {
  text,
  url,
  phone,
  email,
  password,
}
