import 'package:flutter/material.dart';

import '../components/announcement_card.dart';
import '../models/announcement.dart';
import '../widgets/CustomAppDrawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Announcements"),
          backgroundColor: Color(0xFF2F8D46),
        ),
        drawer: CustomAppDrawer(),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Announcement mockAnnouncement = Announcement(
              title: "Title ${index + 1}",
              date: "0${index + 1}/0${index + 1}/2020",
              description:
                  "sum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when a",
            );
            return AnnouncementCard(mockAnnouncement);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
