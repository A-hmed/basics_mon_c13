import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/calculator/calculator_button.dart';
import 'dart:math';

const Color scaffoldBg = Color(0xff17181A);
const Color lightBlue = Color(0xff29A8FF);
const Color grey = Color(0xff616161);
const Color darkGrey = Color(0xff303136);
const TextStyle resultStyle =
    TextStyle(fontSize: 48, fontWeight: FontWeight.w500, color: Colors.white);

class Calculator extends StatefulWidget {
  static const routeName = "calculator";

  const Calculator();

  @override
  State createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State {
  String result = "";
  String lhs = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Center(
                  child: Container(
                      width: double.infinity,
                      child: Text(
                        result,
                        style: resultStyle,
                        textAlign: TextAlign.end,
                      )))),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "7",
                  onClick: onDigitClick,
                ),
                CalculatorButton(digit: "8", onClick: onDigitClick),
                CalculatorButton(digit: "9", onClick: onDigitClick),
                CalculatorButton(
                    digit: "+",
                    buttonColor: lightBlue,
                    textColor: Colors.white,
                    onClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "4", onClick: onDigitClick),
                CalculatorButton(digit: "5", onClick: onDigitClick),
                CalculatorButton(digit: "6", onClick: onDigitClick),
                CalculatorButton(
                    digit: "-",
                    buttonColor: lightBlue,
                    textColor: Colors.white,
                    onClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "1", onClick: onDigitClick),
                CalculatorButton(digit: "2", onClick: onDigitClick),
                CalculatorButton(digit: "3", onClick: onDigitClick),
                CalculatorButton(
                  digit: "*",
                  onClick: onOperatorClick,
                  buttonColor: lightBlue,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: ".", onClick: onDigitClick),
                CalculatorButton(digit: "0", onClick: onDigitClick),
                CalculatorButton(digit: "=", onClick: onEqualClick),
                CalculatorButton(
                    digit: "/",
                    buttonColor: lightBlue,
                    textColor: Colors.white,
                    onClick: onOperatorClick),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDigitClick(String digit) {
    if (digit == "." && result.contains(".")) return;
    result += digit;
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (savedOperator.isEmpty) {
      lhs = result;
    } else {
      lhs = calculate(lhs, savedOperator, result);
    }
    savedOperator = clickedOperator;
    result = "";
    setState(() {});
    print("lhs = $lhs, savedOperator = $savedOperator");
  }

  void onEqualClick(String _) {
    if (lhs.isEmpty && result.isEmpty) return;
    result = calculate(lhs, savedOperator, result);
    lhs = "";
    savedOperator = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    switch (operator) {
      case "+":
        return "${n1 + n2}";
      case "-":
        return (n1 - n2).toString();
      case "*":
        return (n1 * n2).toString();
      default:
        return (n1 / n2).toString();
    }
  }
}
