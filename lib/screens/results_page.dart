import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/footer_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  String result;
  String resultValue;
  String resultInterpretation;

  ResultsPage({
    @required this.result,
    @required this.resultValue,
    @required this.resultInterpretation,
  });

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
                      result.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      resultValue,
                      style: kResultValueTextStyle,
                    ),
                    Text(
                      resultInterpretation,
                      style: kResultInterpretationTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            FooterButton(
              label: 'RE-CALCULATE YOUR BMI',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ));
  }
}
