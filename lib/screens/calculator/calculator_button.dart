import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/calculator/calculator.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Color buttonColor;
  final Color textColor;
  final Function onClick;

  const CalculatorButton(
      {required this.digit,
      required this.onClick,
      this.buttonColor = darkGrey,
      this.textColor = lightBlue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.yellow,
        margin: EdgeInsets.all(12),
        child: ElevatedButton(
            onPressed: () {
              onClick(digit);
            },
            style: ButtonStyle(),
            child: Text(
              digit,
              style: TextStyle(color: textColor, fontSize: 48),
            )),
      ),
    );
  }
}
