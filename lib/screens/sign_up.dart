//sign up page along with google sign in button
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: '\tEmail',
                    icon: Icon(
                      Icons.email,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hoverColor: Colors.brown,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: 'Password',
                    icon: Icon(Icons.lock, color: Colors.brown),
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
                      color: Colors.green,
                      onPressed: () {},
                      child: Text('SIGN UP'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      shape: StadiumBorder(),
                      color: Colors.green,
                      onPressed: () {},
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
