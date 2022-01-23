import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class OnlineIndicatorDidplay extends StatelessWidget {
  const OnlineIndicatorDidplay({
    Key? key,
    required this.online,
    this.selected = false,
    this.heigth,
    this.width,
  }) : super(key: key);

  final bool online;
  final bool selected;
  final double? width;
  final double? heigth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
                curve: Curves.easeInQuad,
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ClientTheme.currentTheme.getField(
                    selected ? "OnlineColorOutlineSelected" : "OnlineColorOutline",
                  ),
                ),
                width: online ? 20 : 0,
                height: online ? 20 : 0),
            AnimatedContainer(
              curve: Curves.easeInQuad,
              duration: const Duration(milliseconds: 150),
              width: online ? 12 : 0,
              height: online ? 12 : 0,
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
