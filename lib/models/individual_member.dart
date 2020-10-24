import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_gfg/models/members.dart';
import 'package:our_gfg/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class IndividualMember extends StatelessWidget {
  final MEMBER member;

  const IndividualMember({Key key, this.member}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                child:
                    (member.speakerImage == "" || member.speakerImage == null)
                        ? FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.green,
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: member.speakerImage ?? "",
                            imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              print(error.toString());
                              return FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              );
                            })),
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
                        member.speakerName,
                        style: Theme.of(context).textTheme.headline6,
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
                  Text(member.speakerDesc,
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    member.speakerSession,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  socialActions(context, member),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
