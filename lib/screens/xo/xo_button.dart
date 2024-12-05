import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButton(
      {super.key,
      required this.symbol,
      required this.onClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onClick(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          symbol,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 55, color: symbol == "x" ? Colors.black : Colors.green),
        ),
      ),
    ));
  }
}
