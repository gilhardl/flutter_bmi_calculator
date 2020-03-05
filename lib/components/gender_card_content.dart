import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

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
          style: kCardLabelTextStyle,
        )
      ],
    );
  }
}
