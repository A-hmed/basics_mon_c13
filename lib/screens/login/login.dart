import 'package:flutter/material.dart';
import 'package:flutter_basics_c13/screens/home/home.dart';

class Login extends StatelessWidget {
  static const routeName = "login";

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login "),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Home.routeName);
            },
            child: Text("home")),
      ),
    );
  }
}
