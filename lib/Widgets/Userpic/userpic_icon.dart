import 'package:flutter/cupertino.dart';
import 'package:myapp/scale_utils.dart';

class UserpicIcon extends StatelessWidget {
  const UserpicIcon({
    Key? key,
    required this.color,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: p(20), color: iconColor),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
