import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/calculator/calculator.dart';
import 'package:flutter_basics_c13/screens/home/home.dart';
import 'package:flutter_basics_c13/screens/login/login.dart';
import 'package:flutter_basics_c13/screens/xo/game_board.dart';

Color titleBgColor = Color(0xff852bba);
TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 22);

void main() {
  // MaterialApp app = MaterialApp();
  // runApp(app);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) {
          return Home();
        },
        Login.routeName: (_) => Login(),
        Calculator.routeName: (_) => Calculator(),
        GameBoard.routeName: (_) => GameBoard()
      },
      initialRoute: GameBoard.routeName,
    );
  }
}
