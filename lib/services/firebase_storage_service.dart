import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_gfg/models/event.dart';

class FirebaseStorageService {
  FirebaseStorageService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Event>> getUpcomingEvents() async {
    List<Event> _events = [];
    QuerySnapshot snapshot = await _firestore.collection("event-data").get();
    for (QueryDocumentSnapshot docSnapshot in snapshot.docs)
      _events.add(Event.fromDocumentSnapshot(docSnapshot));
    return _events;
  }
}
