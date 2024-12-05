import 'package:flutter/material.dart';

import '../../main.dart';

class MagazineTile extends StatelessWidget {
  String title;

  MagazineTile(this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: titleBgColor,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: titleStyle,
            textAlign: TextAlign.center,
          )),
    );
  }
}
