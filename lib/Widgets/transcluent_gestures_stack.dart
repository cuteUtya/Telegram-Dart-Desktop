import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TranscluentGesturesStack extends Stack {
  TranscluentGesturesStack({children}) : super(children: children);

  @override
  CustomRenderStack createRenderObject(BuildContext context) {
    return CustomRenderStack(
      alignment: alignment,
      textDirection: textDirection ?? Directionality.of(context),
      fit: fit,
    );
  }
}

class CustomRenderStack extends RenderStack {
  CustomRenderStack({alignment, textDirection, fit, overflow})
      : super(
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
        );

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset? position}) {
    var stackHit = false;

    final children = getChildrenAsList();

    for (var child in children) {
      final StackParentData? childParentData = child.parentData as StackParentData?;

      final childHit = result.addWithPaintOffset(
        offset: childParentData?.offset,
        position: position ?? Offset(0, 0),
        hitTest: (BoxHitTestResult result, Offset transformed) {
          return child.hitTest(result, position: transformed);
        },
      );

      if (childHit) stackHit = true;
    }

    return stackHit;
  }
}
