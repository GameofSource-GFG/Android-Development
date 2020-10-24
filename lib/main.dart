import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_gfg/screens/LoginScreen.dart';
import 'package:our_gfg/screens/about_screen.dart';
import 'package:our_gfg/screens/contact_us_screen.dart';
import 'package:our_gfg/screens/members.dart';
import 'package:our_gfg/screens/mission.dart';
import 'package:our_gfg/screens/sign_up.dart';
import 'package:our_gfg/screens/social_media.dart';
import 'package:our_gfg/screens/upcoming_events_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final kMainColor = Color(0xFF2F8D46);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kMainColor),
        accentColor: kMainColor,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        About.routeName: (context) => About(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Members.routeName: (context) => Members(),
        MissionAndVision.routeName: (context) => MissionAndVision(),
        SignUp.routeName: (context) => SignUp(),
        SocialMediaLinks.routeName: (context) => SocialMediaLinks(),
        UpcomingEventsScreen.routeName: (context) => UpcomingEventsScreen(),
        ContactUs.routeName: (context) => ContactUs(),
      },
      home: LoginScreen(),
    );
  }
}
