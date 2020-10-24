import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class MissionAndVision extends StatefulWidget {
  static final String routeName = "/mission";

  @override
  _MissionAndVisionState createState() => _MissionAndVisionState();
}

class _MissionAndVisionState extends State<MissionAndVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mission & Vision",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(

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
              SizedBox(
                height: 550.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "With the idea ofg imparting programming knowledge, Mr. Sandeep Jain, an IIT Roorkee alumnus started a dream, GeeksforGeeks. Whether programming excites you or you feel stifled, wondering how to prepare for interview questions or how to ace data structures and algorithms, GeeksforGeeks is a one-stop solution. With every tick of time, we are adding arrows in our quiver. From articles on various computer science subjects to programming problems for practice, from basic to premium courses, from technologies to entrance examinations, we have been building ample content with superior quality.",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 80.0,
                child: TextLiquidFill(
                  text: 'Vision Of GFG',
                  waveColor: Colors.white,
                  boxBackgroundColor: Color.fromRGBO(128, 199, 131, 1),
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 80.0,
                ),
              ),
              SizedBox(
                height: 550.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical; it's not genuine, correct, or comprehensible Latin anymore.",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}