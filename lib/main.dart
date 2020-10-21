import 'package:flutter/material.dart';
import 'package:our_gfg/ContactUs/contactPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactPage(),

  final kMainColor = Color(0xFF1d2d50);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kMainColor),
        accentColor: kMainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UpcomingEventsScreen(),
    );
  }
}

