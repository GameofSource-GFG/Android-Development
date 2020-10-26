//sign up page along with google sign in button
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/upcoming_events_screen.dart';

String emailIdErrorMessage = "";
String passwordErrorMessage = "";

class SignUp extends StatefulWidget {
  static final String routeName = "/sign_up";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController nameController = TextEditingController();

  //google sign-in
  // ignore: unused_field
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  // ignore: unused_element
  _logout() {
    _googleSignIn.signOut();
    setState(
      () {
        _isLoggedIn = false;
      },
    );
  }

  final email = TextEditingController();
  final password = TextEditingController();
  bool validityEmail = true;
  bool validityPassword = true;
//email sign-up method
  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((result) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpcomingEventsScreen()),
      );
    }).catchError(
      (err) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    // Cleaning up controllers.
    nameController.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(36.0),
          child: ListView(
            children: <Widget>[
              //  SizedBox(height: 80),
              Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Geeks For Geeks',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  onSubmitted: (v) {
                    FocusScope.of(context).requestFocus();
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: '\tName',
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (v) {
                    FocusScope.of(context).requestFocus();
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: '\tEmail',
                    icon: Icon(
                      Icons.email,
                      color: Colors.brown,
                    ),
                    errorText: validityEmail ? null : emailIdErrorMessage,
                  ),
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: password,
                  textInputAction: TextInputAction.done,

                  decoration: InputDecoration(
                    hoverColor: Colors.brown,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: 'Password',
                    icon: Icon(Icons.lock, color: Colors.brown),
                    errorText: validityPassword ? null : passwordErrorMessage,
                  ),
                  obscureText:
                      true, //replaces password with bullets as we enter it
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  children: <Widget>[
                    Text('Continue for a seamless experience!'),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      shape: StadiumBorder(),
                      color: Color(0xFF2F8D46),
                      onPressed: () {
                        setState(
                          () {
                            validityEmail = isValidEmail(email.text);
                            validityPassword = isValidPassword(password.text);
                            registerToFb();
                          },
                        );
                      },
                      child: Text('SIGN UP'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      shape: StadiumBorder(),
                      color: Color(0xFF2F8D46),
                      onPressed: () {
                        _login();
                      },
                      child: Text('Sign In With Google'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  //Function that VALIDATES ENTERED EMAIL ID

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  if (email.isEmpty) {
    //assigning error message to String variable emailIdErrorMessage
    emailIdErrorMessage = "Please enter a Email-id";
    return false;
  } else if (!(regExp.hasMatch(email))) {
    //assigning error message to String variable emailIdErrorMessage
    emailIdErrorMessage = "Please enter a valid Email Address";
    return false;
  } else
    return true;
}

bool isValidPassword(String password) {
  //Function that VALIDATES ENTERED PASSWORD

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  if (password.isEmpty) {
    //assigning error message to String variable passwordErrorMessage
    passwordErrorMessage = "Please enter Password";
    return false;
  } else if (password.length < 8) {
    //assigning error message to String variable passwordErrorMessage
    passwordErrorMessage = "Password must contain at least 8 characters";
    return false;
  } else if (!(regExp.hasMatch(password))) {
    //assigning error message to String variable passwordErrorMessage
    passwordErrorMessage =
        "Password must contain \n at least 1 upper case alphabet,\nat least one number \nand at least one special character \nalong with lowercase alphabets";
    return false;
  } else
    return true;
}
