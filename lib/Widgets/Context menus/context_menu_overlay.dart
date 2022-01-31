import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/Widgets/transcluent_gestures_stack.dart';

class ContextMenuOverlay extends StatefulWidget {
  const ContextMenuOverlay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContextMenuOverlayState();
}

class ContextMenuOverlayState extends State<ContextMenuOverlay> {
  final List<_ContextMenuInstanceInfo> _displayedMenus = [];
  static late ContextMenuOverlayState current;
  Size? _lastWindowSize;
  int _key = 0;
  Offset mousePosition = Offset.zero;

  static openMenu(Widget menu) => current._openMenu(menu);
  static closeMenu(ContextMenuInstanceKey key) => current._closeMenu(key);
  static closeAllMenus() => current._closeAllMenus();

  ContextMenuInstanceKey _openMenu(Widget menu) {
    closeAllMenus();
    _key++;
    var cKey = ContextMenuInstanceKey(_key);
    setState(() {
      _displayedMenus.add(
        _ContextMenuInstanceInfo(
          key: cKey,
          menu: menu,
          position: mousePosition,
        ),
      );
    });
    return cKey;
  }

  void _closeMenu(ContextMenuInstanceKey key) {
    for (var obj in _displayedMenus) {
      if (obj.key == key) {
        setState(() => _displayedMenus.remove(obj));
        break;
      }
    }
  }

  void _closeAllMenus() => setState(() => _displayedMenus.clear());

  @override
  Widget build(BuildContext context) {
    current = this;
    return MouseRegion(
      onHover: (pos) {
        mousePosition = pos.position;
      },
      child: LayoutBuilder(
        builder: (_, size) {
          var windowSize = Size(size.maxWidth, size.maxHeight);
          if (_lastWindowSize != windowSize && _lastWindowSize != null) {
            _displayedMenus.clear();
          }
          _lastWindowSize = windowSize;
          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Center(child: Container()),
                onTap: () => _closeAllMenus(),
                onSecondaryTap: () => _closeAllMenus(),
              ),
              Stack(
                children: _displayedMenus.map(
                  (e) {
                    var key = GlobalKey();
                    if (e.size == null) {
                      Future.delayed(Duration.zero, () {
                        for (var obj in _displayedMenus) {
                          if (obj.key == e.key) {
                            setState(
                              () => _displayedMenus[_displayedMenus.indexOf(obj)].size = key.currentContext?.size,
                            );
                          }
                        }
                      });
                    }
                    //on first frame we can't know widget size,
                    //so, we render object in left top corner with opacity 0
                    //that user don't see it (yep, this catches the eye)
                    return Opacity(
                      opacity: e.size == null ? 0 : 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: e.size == null ? 0 : e.position.dx - e.size!.width,
                          top: e.size == null ? 0 : e.position.dy - e.size!.height,
                        ),
                        child: SizedBox(
                          key: key,
                          child: e.menu,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ContextMenuInstanceInfo {
  _ContextMenuInstanceInfo({
    required this.key,
    required this.menu,
    required this.position,
    this.size,
  });

  final ContextMenuInstanceKey key;
  final Offset position;
  final Widget menu;
  Size? size;
}

class ContextMenuInstanceKey {
  const ContextMenuInstanceKey(this.key);
  final int key;

  bool operator ==(covariant ContextMenuInstanceKey a) {
    return key == a.key;
  }
}
