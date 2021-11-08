import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

typedef TapCallback = void Function();
enum ButtonColor { accent, accentHalfTransparency, transparency }

class DesktopButton extends StatefulWidget {
  const DesktopButton(
      {Key? key,
      this.text = "Button",
      this.width,
      this.heigth,
      this.onPressed,
      this.onLongPress,
      this.color = ButtonColor.accentHalfTransparency,
      this.customColor,
      this.pressColor,
      this.font,
      this.textColor,
      this.fontSize = 20,
      this.weight = FontWeight.normal,
      this.padding = const EdgeInsets.all(12)})
      : super(key: key);

  final String text;
  final double? width;
  final double? heigth;
  final TapCallback? onPressed;
  final TapCallback? onLongPress;
  final ButtonColor color;
  final Color? pressColor;
  final Color? customColor;
  final String? font;
  final Color? textColor;
  final double fontSize;
  final EdgeInsets padding;
  final FontWeight weight;

  @override
  State<DesktopButton> createState() => _desktopButtonState();
}

class _desktopButtonState extends State<DesktopButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext contex) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.heigth,
        decoration: BoxDecoration(
            color: widget.pressColor ??
                _getCurrentColor(isPressed,
                    widget.customColor ?? _getEnumColor(widget.color)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: widget.padding,
        child: Text(widget.text,
            textAlign: TextAlign.center,
            style: TextDisplay.H1(
              weight: widget.weight,
              textColor: widget.textColor ??
                  ClientTheme.currentTheme.getField("Accent"),
              size: widget.fontSize,
              fontFamily: widget.font,
            )),
      ),
      onTap: () {
        widget.onPressed;
        setState(() => isPressed = true);
        Future.delayed(const Duration(microseconds: 100),
            () => setState(() => isPressed = false));
      },
      onLongPress: widget.onLongPress,
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
    );
  }

  static Color _getCurrentColor(bool pressed, Color baseColor) {
    if (pressed) {
      return Color.lerp(baseColor, const Color(0xFFFFFFFF), 0.5) ?? baseColor;
    }
    return baseColor;
  }

  static Color _getEnumColor(ButtonColor clr) {
    switch (clr) {
      case ButtonColor.accent:
        return ClientTheme.currentTheme.getField("Accent");
      case ButtonColor.accentHalfTransparency:
        return ClientTheme.currentTheme.getField("AccentHalfTransparent");
      case ButtonColor.transparency:
        return const Color(0x00000000);
    }
  }
}
