import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/xo/xo_button.dart';

const Color lightBlue = Color(0xff00D2FF);
const Color darkLightBlue = Color(0xff3A7BD5);

class GameBoard extends StatefulWidget {
  static const routeName = "game_board";

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final EdgeInsets horizontal16Vertical24 =
      const EdgeInsets.symmetric(horizontal: 16, vertical: 24);

  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  bool isWinner = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [lightBlue, darkLightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildStopWatch(),
              buildPlayerTurnText(),
              buildBoard(),
              buildResetButton()
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  String formatSeconds(int seconds) {
    int hours = seconds ~/ 3600;
    seconds -= hours * 3600;
    int minutes = seconds ~/ 60;
    seconds -= minutes * 60;
    return "${hours < 10 ? "0$hours" : hours}:"
        "${minutes < 10 ? "0$minutes" : minutes}:"
        "${seconds < 10 ? "0$seconds" : seconds}";
  }

  Widget buildStopWatch() => Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: horizontal16Vertical24,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(44)),
        child: Text(
          "${formatSeconds(timer.tick)}",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      );

  Widget buildPlayerTurnText() => Text(
        "Player ${counter % 2 == 0 ? "1" : "2"}'s ${isWinner ? "Wins" : "Turn"}",
        style: TextStyle(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );

  Widget buildBoard() => Expanded(
        child: Container(
          margin: horizontal16Vertical24,
          child: Stack(
            children: [
              buildGridButtons(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 22,
                    endIndent: 22,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void onUserClick(int index) {
    if (board[index].isNotEmpty) return;
    if (isWinner) return;

    board[index] = counter % 2 == 0 ? "o" : "x";
    if (checkWinner()) {
      isWinner = true;
      timer.cancel();
      setState(() {});
      return;
    }
    counter++;
    setState(() {});
  }

  bool checkWinner() {
    String symbol = counter % 2 == 0 ? "o" : "x";

    ///Rows
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol)
      return true;
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol)
      return true;
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol)
      return true;

    ///Columns
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol)
      return true;
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol)
      return true;
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol)
      return true;

    ///Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol)
      return true;
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol)
      return true;
    return false;
  }

  Container buildGridButtons() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(44)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                XoButton(symbol: board[0], onClick: onUserClick, index: 0),
                XoButton(symbol: board[1], onClick: onUserClick, index: 1),
                XoButton(symbol: board[2], onClick: onUserClick, index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButton(symbol: board[3], onClick: onUserClick, index: 3),
                XoButton(symbol: board[4], onClick: onUserClick, index: 4),
                XoButton(symbol: board[5], onClick: onUserClick, index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButton(symbol: board[6], onClick: onUserClick, index: 6),
                XoButton(
                  symbol: board[7],
                  onClick: onUserClick,
                  index: 7,
                ),
                XoButton(symbol: board[8], onClick: onUserClick, index: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildResetButton() => ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.red,
              );
            });
        // board = ["", "", "", "", "", "", "", "", ""];
        //  counter = 0;
        //  isWinner = false;
        //  setState(() {});
        //  startTimer();
      },
      child: Text("Reset"));
}
