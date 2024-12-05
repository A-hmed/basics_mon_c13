import 'package:flutter/material.dart';

import 'game_board.dart';

class GradientBgScaffold extends StatelessWidget {
  final Widget body;

  const GradientBgScaffold({super.key, required this.body});

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
          child: body,
        ),
      ),
    );
    ;
  }
}
