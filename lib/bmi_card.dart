import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  BmiCard({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}

class GenderCardContent extends StatelessWidget {
  GenderCardContent({
    @required this.icon,
    @required this.label,
    this.color = Colors.white,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: color,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: color,
          ),
        )
      ],
    );
  }
}
