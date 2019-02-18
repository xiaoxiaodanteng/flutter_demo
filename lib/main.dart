import 'package:flutter/material.dart';
import 'package:toutiao/home/home.dart';
import 'package:toutiao/login/login.dart';
import 'package:toutiao/module/pub.dart';

void main() {
  PubModule.checkUser().then((token) {
    runApp(App(token));
  });
}

class App extends StatelessWidget {
  final String token;
  App(this.token);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '头条',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}