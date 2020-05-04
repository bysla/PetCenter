import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';


class Info extends StatefulWidget {
  
String title;
 String description;
 String url;
 String city;
 String whats;

  Info({
    Key key,
     this.title,
     this.description,
     this.url,
     this.city,
     this.whats,}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

     

    return Scaffold(
      appBar: AppBar(
        title: Text("Caso: "+widget.title.toString()),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: height*0.06,),
          Center(
            child: Container(
              height: height*0.7,
              width: width*0.8,
              child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child:  Container(
                  width: width * 0.8,
                  height: height * 0.7,
                  //color: Colors.amber,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: 28),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            widget.url,
                            height: height * 0.4,
                          ),
                        ),
                        Text(widget.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 18)),
Card(
                    color: Colors.green[400],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: width*0.1),
                    child: FlatButton(
                      onPressed: (){ FlutterOpenWhatsapp.sendSingleMessage("55"+widget.whats.toString(), "Ola, bom dia");}, 
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                      ),
                      SizedBox(width: width*0.05,),
                      Center(
                        child: Center(
                          child: 
                          Text(
                        'Whatsapp',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0, color: Colors.white),
                      ),
                        ),
                      )
                    ],
                  ))),

                      ],
                    ),
                  )),
            ),
            ),
          )
        ],
      )
       
    );
  }
}