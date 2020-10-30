import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/firebase_storage_service.dart';
import '../components/my_text_field.dart';
import '../widgets/CustomAppDrawer.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  static final String routeName = "/contact_us";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _phone, _message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomAppDrawer(),
        appBar: AppBar(
          title: Text("Contact Us"),
          backgroundColor: Color(0xFF2F8D46),
          actions: [
            // submit form button
            IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FirebaseStorageService.contactFormHandler(
                            _name, _email, _phone, _message)
                        .then((value) {
                      _formKey.currentState.reset();
                      Fluttertoast.showToast(
                          backgroundColor: Color(0xFF2F8D46),
                          msg: "Your response has been recorded!");
                    }).catchError((error) {
                      print(error);
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please enter valid data!",
                        backgroundColor: Color(0xFF2F8D46));
                  }
                }),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              MyTextField(
                labelText: "Name",
                onChanged: (String name) => _name = name,
                textCapitalization: TextCapitalization.words,
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter your name";
                },
                prefixIconData: Icons.person,
              ),
              MyTextField(
                labelText: "Email",
                onChanged: (String email) => _email = email,
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter an email address";
                  else if (!(value.contains("@") && value.contains(".")))
                    return "Please enter a valid email address";
                },
                prefixIconData: Icons.alternate_email,
              ),
              MyTextField(
                labelText: "Phone",
                onChanged: (String phone) => _phone = phone,
                keyboardType: TextInputType.phone,
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter your phone number";
                },
                prefixIconData: Icons.phone,
              ),
              MyTextField(
                labelText: "Message",
                onChanged: (String message) => _message = message,
                textCapitalization: TextCapitalization.sentences,
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter the message";
                },
                enableMultilineText: true,
                prefixIconData: Icons.message,
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Container(
                    height: 215,
                    child: WebView(
                      initialUrl: Uri.dataFromString(
                        '<html><body><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d62206.04005409677!2d77.61683905!3d12.97968585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1603287999342!5m2!1sen!2sin" allowfullscreen="" width="${MediaQuery.of(context).size.width - 15}" height="200" frameborder="0" style="border:0;" aria-hidden="false" tabindex="0"></iframe></body></html>',
                        mimeType: 'text/html',
                      ).toString(),
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
