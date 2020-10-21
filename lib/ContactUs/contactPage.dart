import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ContactPageHome();
  }
}

class ContactPageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPageHome> {
  Color gfgTheme = Color.fromRGBO(47, 141, 70, 1);
  String _name="";
  String _email="";
  String _phone="";
  String _message="";
  var H, W;
  @override
  Widget build(BuildContext context) {
    H = MediaQuery.of(context).size.height;
    W = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
        backgroundColor: gfgTheme,
      ),
      body: Container(
        color: Color.fromRGBO(47, 141, 70, .7),
        child: Center(
            child: Container(
              padding: EdgeInsets.all(H*.02),
          height: H * .7,
          width: W * .9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(H * .02),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your Name",
                    style: TextStyle(fontWeight: FontWeight.bold,color: gfgTheme),
                  ),
                  textField("Name",1)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your Email",
                    style: TextStyle(fontWeight: FontWeight.bold,color: gfgTheme),
                  ),
                  textField("Email",1)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your Phone No.",
                    style: TextStyle(fontWeight: FontWeight.bold,color: gfgTheme),
                  ),
                  textField("Phone",1)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your Message",
                    style: TextStyle(fontWeight: FontWeight.bold,color: gfgTheme),
                  ),
                  textField("Message",5)
                ],
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(H*.02)),
                color: gfgTheme,
                child: Container(
                  width: W*.8,
                  height: H*.06,
                  alignment: Alignment.center,
                  child: Text("Send Message",style: TextStyle(color: Colors.white,fontSize: H*.02),),
                ),
                onPressed: (){
                  if(_name.trim().length!=0 &&
                      _email.trim().length!=0 &&
                      _phone.trim().length!=0 &&
                      _message.trim().length!=0){
                    saveData();
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget textField(saveTo,int size){
    return TextField(
      maxLines: size,
        cursorColor: gfgTheme,
        decoration: InputDecoration(
            focusColor: gfgTheme,
            border: OutlineInputBorder(),
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(H*.02),
              borderSide: BorderSide(width: 1.5,color: gfgTheme)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(H*.02),
                borderSide: BorderSide(width: 1.5,color: gfgTheme)
            )
        ),
        onChanged: (val){
          if(saveTo=="Name") _name=val;
          else if(saveTo =="Email") _email=val;
          else if(saveTo =="Phone") _phone=val;
          else if(saveTo =="Message") _message=val;
    },
    );
  }
  void saveData(){
    var Firestore;
    var db = Firestore.instance;
    db.collection("GFG").document("contact_us").setData(
      {
        "name":_name,
        "email":_email,
        "phone":_phone,
        "message":_message
      }
    ).whenComplete(() {
      print("Message Sent");
    });
  }
}
