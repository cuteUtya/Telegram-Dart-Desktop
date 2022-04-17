import 'package:flutter/material.dart';
import 'package:myapp/Context%20menu/context_menu_config.dart';

class ContextMenuRegion extends StatefulWidget {
  const ContextMenuRegion({
    Key? key,
    required this.child,
    required this.config,
  }) : super(key: key);

  final ContextMenuConfig config;
  final Widget child;

  @override
  State<ContextMenuRegion> createState() => ContextMenuRegionState();
}

class ContextMenuRegionState extends State<ContextMenuRegion> {
  Offset _mousePosition = Offset.zero;
  late GlobalKey _childKey;
  static List<OverlayEntry> _entryes = [];

  @override
  Widget build(BuildContext context) {
    _childKey = GlobalKey();
    return MouseRegion(
      onHover: (pointer) => _mousePosition = pointer.localPosition,
      child: GestureDetector(
        onSecondaryTap: () => _spawnWindow(),
        child: Container(
          key: _childKey,
          child: widget.child,
        ),
      ),
    );
  }

  static void close() {
    for (int i = 0; i < _entryes.length; i++) {
      _entryes[i].remove();
    }
    _entryes.clear();
  }

  void _spawnWindow() {
    var box = _childKey.currentContext?.findRenderObject() as RenderBox;
    var position = box.globalToLocal(Offset.zero);
    position -= _mousePosition;
    OverlayEntry entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () => close(),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: -position.dx,
            top: -position.dy,
            child: widget.config,
          ),
        ],
      ),
    );
    _entryes.add(entry);
    Overlay.of(context)!.insert(entry);
  }
}
