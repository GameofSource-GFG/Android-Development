import 'package:flutter/material.dart';
import 'package:our_gfg/components/my_cached_network_image.dart';
import 'package:our_gfg/models/event.dart';

class UpcomingEventCard extends StatelessWidget {
  final Event event;
  final Color _textColor = Colors.black;

  UpcomingEventCard({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCachedNetworkImage(
            url: event.photoUrl,
            borderRadius: 5,
            imageWidth: double.infinity,
            imageHeight: 250,
          ),
          SizedBox(height: 10),
          Text(
            event.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: _textColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            event.description,
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _textColor.withOpacity(0.7),
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: _textColor.withOpacity(0.8),
                fontSize: 17,
              ),
              children: [
                TextSpan(
                  text: "Date : ",
                  style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF2F8D46)),
                ),
                TextSpan(text: event.date),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: _textColor.withOpacity(0.8),
                fontSize: 17,
              ),
              children: [
                TextSpan(
                  text: "Time : ",
                  style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF2F8D46)),
                ),
                TextSpan(text: event.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
