//User Login screen for the app
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

String emailIdErrorMessage = "";
String passwordErrorMessage = "";
//string variables that store error messages
//for incorrectly entered email and password respectively.
//They are initialized to "" but their values are changed by
//functions bool isValidEmail(String) and bool is isValidPassword(String)
//if entered Data is invalid.
//The functions bool isValidEmail(String) and bool isValidPassword(String)
//validate the email and password entered by user.

class _LoginScreenState extends State<LoginScreen> {
  //textControllers for textFields of email and password
  final email = TextEditingController();
  final password = TextEditingController();

  //boolean variables that indicate whether or not entered data is valid
  bool validityEmail = true;
  bool validityPassword = true;
  //They store values returned by functions bool isValidEmail(String) and bool is isValidPassword(String)
  //They are initialized to true but their values change depending on data entered.On pressing the LogIn button
  //the functions bool isValidEmail(String) and bool isValidPassword(String)
  //are called which validate entered data and return true if data is valid and false if data is invalid.

  @override
  void dispose() {
    // Cleaning up controllers.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              //the GRAPHIC DESIGN included in the page
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //graphic design used for the screen
                        image: AssetImage('assets/images/login-design.png'),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            //blank space
            SizedBox(height: 10.0),
            Padding(
              //textField to enter EMAIL ADDRESS
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSubmitted: (v) {
                  FocusScope.of(context).requestFocus();
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2F8D46).withOpacity(0.2),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6)),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF2F8D46)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2F8D46).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2F8D46).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorText: validityEmail ? null : emailIdErrorMessage,
                    //here string stored in emailIdErrorMessage is displayed if boolean variable validityEmail is false

                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Padding(
              //TextField to enter PASSWORD
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: password,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2F8D46).withOpacity(0.2),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6)),
                    errorText: validityPassword ? null : passwordErrorMessage,
                    //here string stored in emailIdErrorMessage is displayed if boolean variable validityEmail is false

                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF2F8D46)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2F8D46).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2F8D46).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                obscureText: true,
              ),
            ),
            Padding(
              //LOGIN BUTTON
              //after pressing this button the emailId and Password entered by user
              //are validated by validating functions bool isValidEmail(String) and bool isValidPassword(String)
              //the value returned by function is stored in the boolean variables validityEmail and validityPassword
              // if the data is entered is valid functions return true.
              //if data entered is invalid:
              // 1.functions assign appropriate error messages to String variable passwordErrorMessage and String variable emailIdErrorMessage
              // 2. and then return false.

              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20)),
                  onPressed: () {
                    setState(() {
                      //storing value returned by validating functions into boolean variables
                      validityEmail = isValidEmail(email.text);
                      validityPassword = isValidPassword(password.text);
                    });
                    if (validityEmail && validityPassword) {
                      //authenticate and navigate to next screen
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white),
                  ),
                //Color(0xFF0DD6BB)
                color: new Color(0xFF2F8D46))
            ),
            SizedBox(height: 10.0),
            Row(
              //REGISTER NOW LINK
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have a account yet?",
                  style: TextStyle(),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    //navigate to the registration page
                  },
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                        color: Color(0xFF2F8D46),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),

          ],
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

