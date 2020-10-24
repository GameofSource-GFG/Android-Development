import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Newsletter extends StatefulWidget {
  @override
  _NewsletterState createState() => _NewsletterState();
}

class _NewsletterState extends State<Newsletter> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsLetter",
            style: GoogleFonts.adamina(
              fontSize: 32,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          child: Container(
            height: 300,
            child: Card(
              elevation: 18.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(58.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.8),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Join Our Newsletter",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Be one of the first to be notified when\nwe have an update...",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Form(
                        key: _formKey,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (String value) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.length == 0) {
                                    return "Email is Required";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "Invalid Email";
                                  } else {
                                    return null;
                                  }
                                }),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {}
                                  },
                                  child: Text('Suscribe'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
