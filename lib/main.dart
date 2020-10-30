import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/homepage.dart';
import 'screens/members.dart';
import 'screens/mission.dart';
import 'screens/sign_up.dart';
import 'screens/social_media.dart';
import 'screens/upcoming_events_screen.dart';
import 'services/one_signal_service.dart';
import 'screens/EventRegistration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // to register the device with OneSignal
  OneSignalService.initializeOneSignal();
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
        EventRegistration.routeName: (context) => EventRegistration(),
        HomePage.routeName: (context) => HomePage(),
      },
      home: LoginScreen(),
    );
  }
}
