import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class SmoothDesktopListView extends StatefulWidget {
  const SmoothDesktopListView(
      {Key? key,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.primary,
      this.shrinkWrap = false,
      this.padding,
      this.reverseScroll = false,
      this.itemExtent,
      this.prototypeItem,
      this.scrollController,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.addSemanticIndexes = true,
      this.cacheExtent,
      this.itemCount,
      this.semanticChildCount,
      this.dragStartBehavior = DragStartBehavior.start,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      required this.itemBuilder,
      this.clipBehavior = Clip.hardEdge,
      this.restorationId})
      : super(key: key);

  final Axis scrollDirection;
  final bool reverse;
  final bool reverseScroll;
  final bool? primary;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final int? itemCount;
  final bool addSemanticIndexes;
  final ScrollController? scrollController;
  final double? cacheExtent;
  final Widget Function(BuildContext, int) itemBuilder;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  @override
  State<StatefulWidget> createState() => _SmoothDekstopListViewState();
}

class _SmoothDekstopListViewState extends State<SmoothDesktopListView> {
  late final ScrollController _controller = widget.scrollController ?? ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerSignal: (signal) {
          if (signal is PointerScrollEvent) {
            double delta = 0;
            if (!widget.reverseScroll) {
              delta -= signal.scrollDelta.dy;
            } else {
              delta += signal.scrollDelta.dy;
            }
            delta *= Platform.isWindows ? 30 : 15;
            _controller.animateTo(
              clamp(delta + _controller.offset, 0, _controller.position.maxScrollExtent).toDouble(),
              duration: const Duration(milliseconds: 400),
              curve: Curves.decelerate,
            );
          }
        },
        child: ListView.builder(
          itemBuilder: widget.itemBuilder,
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          scrollDirection: widget.scrollDirection,
          itemCount: widget.itemCount,
          reverse: widget.reverse,
          primary: widget.primary,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          itemExtent: widget.itemExtent,
          prototypeItem: widget.prototypeItem,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          cacheExtent: widget.cacheExtent,
          semanticChildCount: widget.semanticChildCount,
          dragStartBehavior: widget.dragStartBehavior,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          restorationId: widget.restorationId,
          clipBehavior: widget.clipBehavior,
        ));
  }
}
