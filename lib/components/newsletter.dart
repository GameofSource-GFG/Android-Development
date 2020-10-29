import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/firebase_storage_service.dart';

class Newsletter extends StatefulWidget {
  @override
  _NewsletterState createState() => _NewsletterState();
}

class _NewsletterState extends State<Newsletter> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(47, 141, 70, 1),
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
                      color: Color.fromRGBO(47, 141, 70, 1),
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
                      color: Color.fromRGBO(47, 141, 70, 1),
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
                            controller: _emailController,
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
                              color: Color.fromRGBO(47, 141, 70, 1),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  try {
                                    await FirebaseStorageService
                                        .subscribeToNewsletter(
                                            _emailController.text?.trim());
                                    _emailController.clear();
                                    Fluttertoast.showToast(
                                        msg: "Subscribed successfully");
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "An error occurred. Please try again later");
                                  }
                                }
                              },
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
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
    );
  }
}
