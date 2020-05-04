import 'package:flutter/material.dart';
import 'package:pet_center/pages/navBar.dart';
import 'package:splashscreen/splashscreen.dart';


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
      home: _introScreen()
    );
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF578ABE),
            Color(0xFF578ABE)
          ],
        ),
        navigateAfterSeconds: NavBar(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/icon.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}

