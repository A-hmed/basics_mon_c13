import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/main.dart';
import 'package:flutter_basics_c13/model/magazine_dm.dart';

class MagazineWidget extends StatelessWidget {
  MagazineDM dataModel;

  MagazineWidget({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.network(dataModel.image),
        Container(
            color: Color(0x80852bba),
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              dataModel.title,
              style: titleStyle,
            ))
      ],
    );
  }
}
