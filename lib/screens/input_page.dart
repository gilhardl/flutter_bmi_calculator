import 'package:bmi_calculator/bmi_controller.dart';
import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/footer_button.dart';
import 'package:bmi_calculator/components/gender_card_content.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  BmiController _bmiCtrl;

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
          FooterButton(
            label: 'CALCULATE YOUR BMI',
            onTap: () {
              _bmiCtrl = BmiController(height: _height, weight: _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    resultValue: _bmiCtrl.calculate(),
                    result: _bmiCtrl.getResult(),
                    resultInterpretation: _bmiCtrl.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
