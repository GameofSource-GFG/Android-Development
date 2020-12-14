import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_gfg/models/event.dart';
import 'package:our_gfg/services/firebase_storage_service.dart';

import '../widgets/CustomAppDrawer.dart';

class EventRegistration extends StatefulWidget {
  static final String routeName = "/event_registration";
  @override
  _EventRegistrationState createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  TextEditingController name = TextEditingController();
  TextEditingController usn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController event = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String dropDownHint = 'Select Event';
  List<String> eventList = [];

  @override
  void initState() {
    fetchEvents();
    super.initState();
  }

  void fetchEvents() async {
    List<Event> event = await FirebaseStorageService.getUpcomingEvents();
    setState(() {
      for (Event i in event) {
        eventList.add(i.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(fontSize: null),
        ),
      ),
      drawer: CustomAppDrawer(),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              Divider(),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Enter your first and last name',
                  labelText: 'Name',
                ),
                controller: name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.carpenter_rounded),
                  hintText: 'Enter your USN',
                  labelText: 'USN',
                ),
                controller: usn,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter a email address',
                  labelText: 'Email',
                ),
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              DropdownButton<String>(
                hint: Text(
                  dropDownHint,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: eventList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    dropDownHint = val;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('EventRegistration')
                        .add({
                      'Name': name.text,
                      'usn': usn.text,
                      'email': email.text,
                      'event': event.text
                    }).then(
                      (value) {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
