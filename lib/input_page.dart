import 'package:bmi_calculator/results_page.dart';
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
  int _weight = 65;
  int _age = 20;

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
                  SizedBox(
                    height: 8.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveCardContentColor,
                      inactiveTrackColor: kInactiveCardContentColor,
                      trackHeight: 2.2,
                      thumbColor: kAccentColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 28.0,
                      ),
                      overlayColor: kAccentColor.withOpacity(0.16),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 110.0,
                      max: 250.0,
                      onChanged: (double height) {
                        setState(() {
                          _height = height.round();
                        });
                      },
                    ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kCardLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kCardNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              color: kInactiveCardContentColor,
                              onPressed: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              color: kInactiveCardContentColor,
                              onPressed: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kCardLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kCardNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              color: kInactiveCardContentColor,
                              onPressed: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              color: kInactiveCardContentColor,
                              onPressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(),
              ),
            ),
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: kFooterLabelTextStyle,
                ),
              ),
              color: kAccentColor,
              margin: EdgeInsets.only(top: 12.0),
              width: double.infinity,
              height: kFooterHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  Color color;
  IconData icon;
  VoidCallback onPressed;

  RoundedIconButton({this.icon, this.color, this.onPressed});

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
