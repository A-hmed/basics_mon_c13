import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/model/magazine_dm.dart';
import 'package:flutter_basics_c13/screens/home/magazine_tile.dart';
import 'package:flutter_basics_c13/screens/home/magazine_widget.dart';
import '../../main.dart';

String imageCarUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgEQBQhHpT9C2aQjQ9lZxPBVgmBIqGKvMyCA&s";

class Home extends StatelessWidget {
  static const routeName = "home";
  List<MagazineDM> dataModels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody(context));
  }

  Widget buildBody(context) {
    // List<Widget> magazineWidgets = [];
    // for(int i = 0; i < dataModels.length; i++){
    //   magazineWidgets.add(MagazineWidget(dataModel: dataModels[i]));
    // }
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Login")),
        Row(
          children: [
            MagazineTile("Magazine"),
            MagazineTile("News"),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: dataModels.length,
              itemBuilder: (BuildContext x, int index) =>
                  MagazineWidget(dataModel: dataModels[index])),
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        "Home",
        style: TextStyle(),
      ),
      actions: [Icon(Icons.arrow_back), Text("Asdasd")],
    );
  }
}
