import 'package:flutter/material.dart';
import 'package:pet_center/pages/main.dart';
import 'package:pet_center/pages/test.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test()
    );
  }
}
