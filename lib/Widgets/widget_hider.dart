import 'package:flutter/cupertino.dart';

/// Widget that provide ease interface to hide or show [child] through [GlobalKey]
class WidgetHider extends StatefulWidget {
  const WidgetHider(
      {Key? key,
      required this.child,
      this.emptyReplacer = const SizedBox.shrink(),
      this.hiddenOnInit = false})
      : super(key: key);
  final Widget child;
  final Widget emptyReplacer;
  final bool hiddenOnInit;
  @override
  State<StatefulWidget> createState() => WidgetHiderState();
}

class WidgetHiderState extends State<WidgetHider> {
  late bool _hide = widget.hiddenOnInit;

  void show() => setState(() => _hide = false);
  void hide() => setState(() => _hide = true);

  Widget build(BuildContext context) {
    return _hide ? widget.emptyReplacer : widget.child;
  }
}
