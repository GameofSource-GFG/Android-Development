//committee members page
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:our_gfg/models/individual_member.dart';
import 'package:our_gfg/models/members.dart';


class Members extends StatefulWidget {
  static final String routeName = "/members";

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List<MEMBER> _recordFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MEMBER(
          speakerImage: doc.data()["speakerImage"] ?? "Not Available",
          speakerName: doc.data()["speakerName"] ?? "Not Available",
          speakerDesc: doc.data()["speakerDesc"] ?? "Not Available",
          speakerSession: doc.data()["speakerSession"] ?? "Not Available",
          fbUrl: doc.data()["fbUrl"] ?? "Not Available",
          githubUrl: doc.data()["githubUrl"] ?? "Not Available",
          linkedinUrl: doc.data()["linkedinUrl"] ?? "Not Available",
          twitterUrl: doc.data()["twitterUrl"] ?? "Not Available",
          instagramUrl: doc.data()["twitterUrl"] ?? "Not Available");
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Members',
        ),
        centerTitle: true,
      ),

      body: StreamBuilder<List<MEMBER>>(
        stream: FirebaseFirestore.instance
            .collection("members")
            .orderBy("speakerName")
            .snapshots()
            .map(_recordFromSnapshots),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              {
                if (snapshot.hasData) {
                  return Container(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        return IndividualMember(member: snapshot.data[i]);
                      },
                      itemCount: snapshot.data.length,

                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              }
              break;
            case ConnectionState.none:
              return Center(
                child: Text("Nothing Happening"),
              );
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              return Center(
                child: Text("Connection Established"),
              );
              break;
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
