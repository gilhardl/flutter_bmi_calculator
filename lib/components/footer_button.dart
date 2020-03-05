import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  FooterButton({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kFooterLabelTextStyle,
          ),
        ),
        color: kAccentColor,
        margin: EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: kFooterHeight,
      ),
    );
  }
}
