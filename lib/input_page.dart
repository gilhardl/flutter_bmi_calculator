import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_card.dart';
import 'constants.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BmiCard(
                    onPressed: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      color: gender == Gender.male
                          ? kActiveCardContentColor
                          : kInactiveCardContentColor,
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    onPressed: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      color: gender == Gender.female
                          ? kActiveCardContentColor
                          : kInactiveCardContentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              color: kActiveCardColor,
              child: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kCardLabelTextStyle,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '170',
                        style: kCardNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kCardLabelTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BmiCard(
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kFooterColor,
            margin: EdgeInsets.only(top: 12.0),
            width: double.infinity,
            height: kFooterHeight,
          )
        ],
      ),
    );
  }
}
