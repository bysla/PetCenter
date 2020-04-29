import 'package:flutter/material.dart';
import '../util/upload.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String txt = "Imagem não selecionada";
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
                onPressed: ()=>{
                  setState(()=>{
                    Choose(),
                    txt = "Imagem selecionada"
                  })
                },
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: 
                  AsyncFileUpload,
                child: Text('Upload Image'),
              )
            ],
          ),
          Text(txt) 
        ],
      ),
    );
  }
}
