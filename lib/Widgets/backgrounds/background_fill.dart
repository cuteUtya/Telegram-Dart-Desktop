import 'package:flutter/cupertino.dart';
import 'package:myapp/tdlib/td_api.dart';

class BackgroundFillDisplay extends StatelessWidget {
  const BackgroundFillDisplay({Key? key, required this.fill}) : super(key: key);
  final BackgroundFill fill;
  @override
  Widget build(BuildContext context) {
    switch (fill.runtimeType) {
      case BackgroundFillFreeformGradient:
        var colors = (fill as BackgroundFillFreeformGradient).colors!.map((n) {
          var clr = Color(n);
          return Color.fromRGBO(clr.red, clr.green, clr.blue, 1);
        }).toList();
        return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    transform: const GradientRotation(50 * 3.14 / 180))));
      case BackgroundFillSolid:
        return Container(color: Color((fill as BackgroundFillSolid).color!));

      case BackgroundFillGradient:
        var gradient = fill as BackgroundFillGradient;
        //TODO rotate background when message was sended;
        return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
          Color(gradient.bottomColor!),
          Color(gradient.topColor!)
        ])));
    }

    throw Exception("Undefined type of BackgroundFill was used");
  }
}
