import 'package:flutter/material.dart';
import 'package:recipes/Pages/Main_screen.dart';
import 'package:recipes/Pages/Menu.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.amberAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Menu(),
      //'/home': (context) => HomePage(),
    },
  ));
}


