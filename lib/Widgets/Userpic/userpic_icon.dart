import 'package:flutter/cupertino.dart';

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
      child: Icon(icon, size: 30, color: iconColor),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
