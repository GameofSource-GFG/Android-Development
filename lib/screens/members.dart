//committee members page
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_gfg/models/members.dart';
import 'package:our_gfg/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  List<MEMBER> developers = [
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 1",
      speakerDesc: "Developer",
      speakerSession: "Team Lead and dev",
      fbUrl: "",
      githubUrl: "",
      linkedinUrl: "",
      twitterUrl: "",
      instagramUrl: "",
    ),
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 2",
      speakerDesc: "Competetive coder",
      speakerSession: "Manager for project",
      fbUrl: "",
      githubUrl: "",
      linkedinUrl: "",
      twitterUrl: "",
      instagramUrl: "",
    ),
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 3",
      speakerDesc: "Sr. Developer",
      speakerSession: "debugger for project___",
      fbUrl: "",
      githubUrl: "",
      twitterUrl: "",
      linkedinUrl: "",
      instagramUrl: "",
    ),
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 4",
      speakerDesc: "UI/UX",
      speakerSession: "designer for project",
      fbUrl: "",
      githubUrl: "",
      linkedinUrl: "",
      twitterUrl: "",
      instagramUrl: "",
    ),
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 5",
      speakerDesc: "Data Scientist",
      speakerSession: "Error handler for project__",
      fbUrl: "",
      githubUrl: "",
      linkedinUrl: "",
      twitterUrl: "",
      instagramUrl: "",
    ),
    MEMBER(
      speakerImage: "",
      speakerName: "MEMBER 6",
      speakerDesc: "Cloud Enthusiast",
      speakerSession: "Deploy web-apps onto any services",
      fbUrl: "",
      githubUrl: "",
      linkedinUrl: "",
      twitterUrl: "",
      instagramUrl: "",
    ),
  ];
  Widget socialActions(context, MEMBER developers) => FittedBox(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (developers.fbUrl != null)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.facebookF,
                  size: 15,
                ),
                onPressed: () {
                  launch(developers.fbUrl);
                },
              ),
            if (developers.instagramUrl != null)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  size: 15,
                ),
                onPressed: () {
                  launch(developers.instagramUrl);
                },
              ),
            if (developers.twitterUrl != null)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  size: 15,
                ),
                onPressed: () {
                  launch(developers.twitterUrl);
                },
              ),
            if (developers.githubUrl != null)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.github,
                  size: 15,
                ),
                onPressed: () {
                  launch(developers.githubUrl);
                },
              ),
            if (developers.linkedinUrl != null)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.linkedin,
                  size: 15,
                ),
                onPressed: () {
                  launch(developers.linkedinUrl);
                },
              )
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Members',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (c, i) {
          return Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: developers[i].speakerImage),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              developers[i].speakerName,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.multiColors[Random().nextInt(4)],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(developers[i].speakerDesc,
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          developers[i].speakerSession,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        socialActions(context, developers[i]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: developers.length,
      ),
    );
  }
}
