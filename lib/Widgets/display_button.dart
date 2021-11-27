import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

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
      this.textColor = TextColor.Accent,
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
  final TextFont? font;
  final TextColor textColor;
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
            style: TextDisplay.create(
              fontWeight: widget.weight,
              textColor: widget.textColor,
              size: widget.fontSize,
              fontFamily: widget.font,
            )),
      ),
      onTap: () {
        widget.onPressed?.call();
        setState(() => isPressed = true);
        Future.delayed(const Duration(microseconds: 100), () {
          //if after 100ms button does not exists:
          //screen been changed, or widget been replaced with another etc.
          //call to setState() throw exception
          //So, we need call setState() only if mounted = true
          if (mounted) {
            setState(() => isPressed = false);
          }
        });
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
