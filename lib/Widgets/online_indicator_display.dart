import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';

class OnlineIndicatorDidplay extends StatelessWidget {
  const OnlineIndicatorDidplay({
    Key? key,
    required this.online,
    this.selected = false,
    this.size,
    this.strokeColor,
}) : super(key: key);

  final bool online;
  final bool selected;
  final double? size;
  final Color? strokeColor;
  @override
  Widget build(BuildContext context) {
    var cSize = (size ?? 20) * 0.6;
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
                curve: Curves.easeInQuad,
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: strokeColor ?? ClientTheme.currentTheme.getField(
                    selected ? "OnlineColorOutlineSelected" : "OnlineColorOutline",
                  ),
                ),
                width: online ? size : 0,
                height: online ? size : 0),
            AnimatedContainer(
              curve: Curves.easeInQuad,
              duration: const Duration(milliseconds: 150),
              width: online ? cSize : 0,
              height: online ? cSize : 0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ClientTheme.currentTheme.getField(selected ? "OnlineColorSelected" : "OnlineStatusColor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
