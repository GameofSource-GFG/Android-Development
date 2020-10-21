import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: AfterSplash(),
        title: Text('Mission \n&\n Vission',
            textAlign: TextAlign.center,
            style: GoogleFonts.fascinate(
              fontSize: 60.0,
              color: Colors.green,
            )),
        image: Image.asset(
          'assets/loading.gif',
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => AfterSplash(),
        loaderColor: Colors.black,
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mission & Vission",
          style: GoogleFonts.blackOpsOne(),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.white])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 80.0,
              child: TextLiquidFill(
                text: 'Mission Of GFG',
                waveColor: Colors.white,
                boxBackgroundColor: Color.fromRGBO(128, 199, 131, 1),
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 80.0,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Vision();
                  }));
                },
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Vision of GFG >>'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Text(
                    "With the idea of imparting programming knowledge, Mr. Sandeep Jain, an IIT Roorkee alumnus started a dream, GeeksforGeeks. Whether programming excites you or you feel stifled, wondering how to prepare for interview questions or how to ace data structures and algorithms, GeeksforGeeks is a one-stop solution. With every tick of time, we are adding arrows in our quiver. From articles on various computer science subjects to programming problems for practice, from basic to premium courses, from technologies to entrance examinations, we have been building ample content with superior quality.",
                    style: GoogleFonts.oswald(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Vision extends StatefulWidget {
  @override
  _VisionState createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mission & Vission",
          style: GoogleFonts.blackOpsOne(),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.green],
        )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 60.0,
              child: Text(
                "Vision of GFG",
                style: GoogleFonts.abrilFatface(
                  fontSize: 40.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('<< Mission of GFG'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical; it's not genuine, correct, or comprehensible Latin anymore.",
                    style: GoogleFonts.oswald(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
