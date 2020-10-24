import 'package:flutter/material.dart';
import 'package:our_gfg/components/upcoming_event_card.dart';
import 'package:our_gfg/models/event.dart';
import 'package:our_gfg/services/firebase_storage_service.dart';

class UpcomingEventsScreen extends StatefulWidget {
  static final String routeName = "/upcoming_events";

  @override
  _UpcomingEventsScreenState createState() => _UpcomingEventsScreenState();
}

class _UpcomingEventsScreenState extends State<UpcomingEventsScreen> {
  Future<List<Event>> _upcomingEvents;

  @override
  void initState() {
    super.initState();
    _upcomingEvents = FirebaseStorageService.getUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upcoming Events"),
        ),
        body: FutureBuilder<List<Event>>(
          future: this._upcomingEvents,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Icon(Icons.error,color: Color(0xFF2F8D46),));
            } else if (snapshot.hasData) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return UpcomingEventCard(event: snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
