import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

class Announcement {
  final String id;
  final String title;
  final String description;
  final String relativeTime;

  Announcement({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.relativeTime,
  });

  factory Announcement.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic> data = snapshot.data();

    return Announcement(
      id: snapshot.id,
      title: data['title'] as String,
      description: data['description'] as String,
      relativeTime: timeago.format(data['timestamp'].toDate())
    );
  }
}
