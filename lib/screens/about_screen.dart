import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  static final String routeName = "/about";

  Future<dynamic> urlLauncher(String url) async // function for launching url
  {
    if (await canLaunch(url)) {
      return await launch(url);
    } else {
      throw 'Cannot launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'GeeksForGeeks Student Chapter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF2F8D46),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                  child: CircleAvatar(
                backgroundColor: Color(0xFF2F8D46),
                radius: 70,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpeg'),
                  radius: 67,
                  foregroundColor: Color(0xFF2F8D46),
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypewriterAnimatedTextKit(
                    text: ['About Us'],
                    speed: Duration(milliseconds: 100),
                    repeatForever: true,
                    textStyle: TextStyle(
                        color: Color(0xFF2F8D46),
                        fontSize: 30,
                        )),
                Icon(
                  Icons.info,
                  color: Color(0xFF2F8D46),
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
