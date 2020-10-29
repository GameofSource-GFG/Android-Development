import 'package:flutter/material.dart';
import 'package:our_gfg/components/announcement_card.dart';
import 'package:our_gfg/models/announcement.dart';
import 'package:our_gfg/services/firebase_storage_service.dart';

import '../widgets/CustomAppDrawer.dart';

class HomePage extends StatefulWidget {
  static final String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Announcement>> _announcements;

  @override
  void initState() {
    super.initState();
    _announcements = FirebaseStorageService.getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Announcements"),
          backgroundColor: Color(0xFF2F8D46),
        ),
        drawer: CustomAppDrawer(),
        body: FutureBuilder<List<Announcement>>(
          future: this._announcements,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: Icon(
                Icons.error,
                  color: Color(0xFF2F8D46),
                ),
              );
            }
            else if(snapshot.hasData){
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return AnnouncementCard(snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}