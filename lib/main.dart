import 'package:flutter/material.dart';
import 'package:tictactoe/home_page.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
