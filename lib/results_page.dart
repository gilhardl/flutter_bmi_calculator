import 'package:bmi_calculator/bmi_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your results',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BmiCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Normal',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '22.6',
                      style: kResultValueTextStyle,
                    ),
                    Text(
                      'Your BMI result is quite low, you should eat more !',
                      style: kResultInterpretationTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE YOUR BMI',
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
        ));
  }
}
