import 'package:flutter/material.dart';
import 'package:our_gfg/components/my_text_field.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  static final String routeName = "/contact_us";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _phone, _message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact Us"),
          backgroundColor: Color(0xFF2F8D46),
          actions: [
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_name);
                  print(_email);
                  print(_phone);
                  print(_message);
                }
              },
            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
