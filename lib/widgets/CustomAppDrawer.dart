import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class CustomAppDrawer extends StatefulWidget {
  @override
  _CustomAppDrawerState createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.symmetric(vertical: 0 , horizontal: 2.5  ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpeg"),
                      fit: BoxFit.cover

                  )
                ),
                child: null,
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home" ,),
                // style: TextStyle(color: Colors.white),
                leading: Icon(
                  Icons.home,
                  color: Color.fromRGBO(47,141,70,1),
                ),
              ),
            ),
            Divider(
              color: Color.fromRGBO(47,141,70,1),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Events" , ),
                leading: Icon(
                  Icons.event,
                  color: Color.fromRGBO(47,141,70,1),
                ),
              ),
            ),
            Divider(
              color: Color.fromRGBO(47,141,70,1),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Contact Us" , ),
                leading: Icon(
                  Icons.contact_page,
                  color: Color.fromRGBO(47,141,70,1),
                ),
              ),
            ),
            Divider(
              color: Color.fromRGBO(47,141,70,1),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Team" , ),
                leading: Icon(
                    Icons.group,
                  color: Color.fromRGBO(47,141,70,1),
                ),
              ),
            ),

            Divider(
              color: Color.fromRGBO(47,141,70,1),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About Us" , ),
                leading: Icon(
                  Icons.info,
                  color: Color.fromRGBO(47,141,70,1),
                ),
              ),
            ),
          ]
        ),

      ),
    );
  }
}

