import 'package:flutter/material.dart';
import 'package:pet_center/pages/login.dart';
import 'package:pet_center/pages/register.dart';
import 'package:pet_center/pages/navBar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar()
    );
  }
}

