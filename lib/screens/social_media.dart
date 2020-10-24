// page for social media links of geeks for geeks
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatefulWidget {
  static final String routeName = "/socialmedia";

  @override
  _SocialMediaLinksState createState() => _SocialMediaLinksState();
}

class _SocialMediaLinksState extends State<SocialMediaLinks> {
  //urls for gfg different social media
  String fburl = "https://www.facebook.com/geeksforgeeks.org/";
  String websiteurl = "https://www.geeksforgeeks.org/";
  String twitterUrl = "https://twitter.com/geeksforgeeks";
  String linkedinUrl = "https://www.linkedin.com/company/geeksforgeeks/";
  String youtubeUrl = "https://www.youtube.com/geeksforgeeksvideos";
  String instagramUrl = "https://www.instagram.com/geeks_for_geeks/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GFG Social media'),
        centerTitle: true,
      ),
      body: Center(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (fburl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebookF,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(fburl);
                  },
                ),
              if (instagramUrl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(instagramUrl);
                  },
                ),
              if (twitterUrl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(twitterUrl);
                  },
                ),
              if (linkedinUrl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.linkedinIn,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(linkedinUrl);
                  },
                ),
              if (youtubeUrl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.youtube,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(youtubeUrl);
                  },
                ),
              if (websiteurl != null)
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.chrome,
                    size: 20,
                  ),
                  onPressed: () {
                    launch(websiteurl);
                  },
                )
              //in case of null
              else
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.question,
                    size: 20,
                  ),
                  onPressed: () {
                    CircularProgressIndicator();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
