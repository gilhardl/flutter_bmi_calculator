import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  BmiCard({@required this.color, this.child, this.onPressed});

  final Color color;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
