import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/xo/game_board.dart';
import 'package:flutter_basics_c13/screens/xo/gradient_bg_scaffold.dart';

class ChoosePlayerScreen extends StatelessWidget {
  static const routeName = "choose_player_screen";

  const ChoosePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBgScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/splash_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Text(
          "Pick who goes first?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildBottomBox("X", Colors.red, () {
                Navigator.pushNamed(context, GameBoard.routeName,
                    arguments: "x");
              }),
              buildBottomBox("O", Colors.green, () {
                Navigator.pushNamed(context, GameBoard.routeName,
                    arguments: "o");
              }),
            ],
          ),
        )
      ],
    ));
  }

  Widget buildBottomBox(String symbol, Color symbolColor, Function onClick) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          margin: EdgeInsets.all(16),
          child: Center(
            child: Text(
              symbol,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: symbolColor,
                fontSize: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
