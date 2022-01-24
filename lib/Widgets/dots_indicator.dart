import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/utils.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.dotsCount = 10,
    this.currentDot = 1,
    this.t = 0,
    this.onDotClick,
  }) : super(key: key);

  final int dotsCount;
  final int currentDot;
  final double t;
  final Function(int index)? onDotClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: List<GestureDetector>.generate(
            dotsCount,
            (i) => GestureDetector(
              onTap: () => onDotClick!(i),
              child: Dot(
                selected: i == currentDot,
                color: ClientTheme.currentTheme.getField("CarouselIndicatorInActive"),
              ),
            ),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        AnimatedPositioned(
          curve: Curves.easeInOutExpo,
          duration: Duration(milliseconds: t == 0 ? 300 : 0),
          left: t == 0
              ? getDotPosition(currentDot, context)
              : lerp(getDotPosition(currentDot, context), getDotPosition(currentDot + 1, context), t),
          child: Dot(
            color: ClientTheme.currentTheme.getField(
              "CarouselIndicatorActive",
            ),
          ),
        )
      ],
    );
  }

  double getDotPosition(int index, BuildContext context) {
    var margin = 10;
    var size = 20;
    var pointSpace = (margin * 2) + size;
    var posOfFirst = (MediaQuery.of(context).size.width / 2 -
        (dotsCount % 2 == 0 ? 0 : (10 * 2)) -
        (dotsCount % 2 == 0 ? (dotsCount / 2) * (pointSpace) : (((dotsCount) / 2) * (pointSpace)) - (10 * 2)));
    return posOfFirst + (index * (pointSpace));
  }
}

class Dot extends StatelessWidget {
  const Dot({Key? key, this.selected = false, required this.color}) : super(key: key);

  final bool selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
