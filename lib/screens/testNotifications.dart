import 'package:flutter/material.dart';
import 'package:our_gfg/services/one_signal_event_notifier.dart';

class TestNotifications extends StatelessWidget {
  final String name = "Test event";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Event name: $name"),
              SizedBox(
                height: 25,
              ),
              Text("Event starts in 4 hours!"),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                onPressed: () {
                  DateTime date = DateTime.now()
                      .toUtc()
                      .add(Duration(hours: 4));
                  OneSignalService.scheduleNotification(name, date, 4);
                },
                child: Text("Get notification!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
