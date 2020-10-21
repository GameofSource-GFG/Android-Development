import 'package:flutter/material.dart';
import 'screens/about_screen.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: About(),
    );
  }
}