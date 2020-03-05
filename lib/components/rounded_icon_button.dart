import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  RoundedIconButton({
    @required this.icon,
    @required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
