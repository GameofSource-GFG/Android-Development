import 'package:flutter/material.dart';
import 'package:our_gfg/components/my_text_field.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _phone, _message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Contact Us"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              MyTextField(
                labelText: "Name",
                onChanged: (String name) => _name = name,
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter your name";
                },
                prefixIconData: Icons.account_circle,
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
                validator: (String value) {
                  if (value == null || value.trim() == "")
                    return "Please enter message";
                },
                prefixIconData: Icons.event_note,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print(_name);
              print(_email);
              print(_phone);
              print(_message);
            }
          },
        ),
      ),
    );
  }
}
