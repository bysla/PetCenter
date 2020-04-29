import 'package:flutter/material.dart';
import '../util/upload.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: Choose ,
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: Upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          file == null
            ? Text('No Image Selected') 
            : Image.file(file)
        ],
      ),
    );
  }
}