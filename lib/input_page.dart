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
  Gender _gender;
  int _height = 170;

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
                        _gender = Gender.male;
                      });
                    },
                    color: _gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      color: _gender == Gender.male
                          ? kActiveCardContentColor
                          : kInactiveCardContentColor,
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    onPressed: () {
                      setState(() {
                        _gender = Gender.female;
                      });
                    },
                    color: _gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      color: _gender == Gender.female
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kCardLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kCardNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kCardLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: _height.toDouble(),
                    min: 110.0,
                    max: 250.0,
                    onChanged: (double height) {
                      setState(() {
                        _height = height.round();
                      });
                    },
                  )
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
