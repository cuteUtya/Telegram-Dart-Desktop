import 'package:flutter/cupertino.dart';
import 'package:myapp/tdlib/td_api.dart';

class BackgroundFillDisplay extends StatelessWidget {
  const BackgroundFillDisplay({Key? key, required this.fill}) : super(key: key);
  final BackgroundFill fill;

  @override
  Widget build(BuildContext context) {
    var colors = getColorsFromFill(fill);
    if (colors.length == 1) colors = [colors[0], colors[0]];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          transform: const GradientRotation(50 * 3.14 / 180),
        ),
      ),
    );
  }

  static List<Color> getColorsFromFill(BackgroundFill fill) {
    List<Color> colors = [];
    switch (fill.runtimeType) {
      case BackgroundFillFreeformGradient:
        colors = (fill as BackgroundFillFreeformGradient)
            .colors!
            .map((n) => Color(n).withOpacity(1))
            .toList();
        break;
      case BackgroundFillSolid:
        colors = [
          Color(
            (fill as BackgroundFillSolid).color!,
          )
        ];
        break;

      case BackgroundFillGradient:
        var gradient = fill as BackgroundFillGradient;
        colors = [
          Color(gradient.bottomColor!),
          Color(gradient.topColor!),
        ];
        break;
    }
    return colors;
  }
}
