import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiController {
  int height;
  int weight;
  double _bmi;

  BmiController({@required this.height, @required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your BMI result is quite high, you should eat less !';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Your BMI result is quite low, you should eat more !';
    }
  }
}
