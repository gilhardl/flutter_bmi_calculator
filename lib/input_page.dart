import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_card.dart';

const footerHeight = 80.0;
const footerColor = Color(0xFFEA1556);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const activeCardContentColor = Color(0xFFFFFEFF);
const inactiveCardContentColor = Color(0xFF8E8E9B);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: BmiCard(
                      color: gender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      child: GenderCardContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        color: gender == Gender.male
                            ? activeCardContentColor
                            : inactiveCardContentColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: BmiCard(
                      color: gender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      child: GenderCardContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        color: gender == Gender.female
                            ? activeCardContentColor
                            : inactiveCardContentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BmiCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BmiCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: footerColor,
            margin: EdgeInsets.only(top: 12.0),
            width: double.infinity,
            height: footerHeight,
          )
        ],
      ),
    );
  }
}
