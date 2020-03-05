import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090B22),
        accentColor: Color(0xFFEA1456),
        scaffoldBackgroundColor: Color(0xFF090B22),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEA1456),
          foregroundColor: Colors.white,
        ),
      ),
      home: InputPage(),
    );
  }
}
