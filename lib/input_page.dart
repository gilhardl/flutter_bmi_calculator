import 'package:flutter/material.dart';

const footerHeight = 80.0;
const footerColor = Color(0xFFEA1556);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF101427);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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

class BmiCard extends StatelessWidget {
  BmiCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
