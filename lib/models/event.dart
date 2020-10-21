import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' show DateFormat;

class Event {
  final String id;
  final String title;
  final String photoUrl;
  final String description;
  final String date;
  final String time;

  Event({
    @required this.id,
    @required this.title,
    @required this.photoUrl,
    @required this.description,
    @required this.date,
    @required this.time,
  });

  factory Event.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic> data = snapshot.data();
    final Map<String, String> _displayDateAndTime =
        getDisplayDateAndTime(snapshot['timestamp'] as Timestamp);
    return Event(
      id: snapshot.id,
      photoUrl: data['url'] as String,
      description: data['description'] as String,
      date: _displayDateAndTime['displayDate'],
      time: _displayDateAndTime['displayTime'],
      title: data['title'] as String,
    );
  }

  static Map<String, String> getDisplayDateAndTime(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    DateFormat formatter;
    String displayTime;
    String displayDate;

    formatter = DateFormat('h:mm a');
    displayTime = formatter.format(dateTime);

    formatter = DateFormat('d MMMM yyyy');
    displayDate = formatter.format(dateTime);

    return {
      'displayTime': displayTime,
      'displayDate': displayDate,
    };
  }
}
