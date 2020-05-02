import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/api.dart' as api;
import 'package:pet_center/pages/navBar.dart';
import 'package:pet_center/pages/register.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final GlobalKey<ScaffoldState> _mainScaffoldKey =
      new GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF578ABE),
        key: _mainScaffoldKey,
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.7,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Container(
                                  child: new Image(
                                      //width: 60.0,
                                      //height: height*0.2,
                                      fit: BoxFit.none,
                                      image: new AssetImage(
                                          'assets/images/logo@3x.png'))),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: TextField(
                                  focusNode: focusEmail,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          fontFamily: "SignikaSemiBold",
                                          fontSize: 18.0)),
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: TextField(
                                  focusNode: focusPassword,
                                  controller: passwordController,
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Senha",
                                      hintStyle: TextStyle(
                                          fontFamily: "SignikaSemiBold",
                                          fontSize: 18.0)),
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: 60.0, bottom: 26.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color(0xFF578ABE),
                                          offset: Offset(1.0, 6.0),
                                          blurRadius: 20.0),
                                      BoxShadow(
                                          color: Color(0xFF578ABE),
                                          offset: Offset(1.0, 6.0),
                                          blurRadius: 20.0),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF578ABE),
                                          Color(0xFF578ABE)
                                        ],
                                        begin: const FractionalOffset(0.2, 0.2),
                                        end: const FractionalOffset(1.0, 1.0),
                                        stops: [0.1, 1.0],
                                        tileMode: TileMode.clamp)),
                                child: MaterialButton(
                                  highlightColor: Color(0xFF578ABE),
                                  splashColor: Color(0xFF578ABE),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 42.0),
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(
                                          fontFamily: "SignikaSemiBold",
                                          color: Colors.white,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    var resp = await api.Login(
                                        emailController.text,
                                        passwordController.text);
                                    if (resp == 0) {
                                      print(prefs.getString('name'));
                                      Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  NavBar()));
                                    } else {
                                      displaySnackBar(prefs.getString("error"));
                                    }
                                  },
                                ),
                              ),
                              Container(
                                child: FlatButton(
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: "SignikaRegular"),
                                  ),
                                  onPressed: () {
                                    displaySnackBar("Forgot clicked");
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      child: Text(
                        "Não tem uma conta?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "SignikaRegular"),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white],
                            begin: const FractionalOffset(0.2, 0.2),
                            end: const FractionalOffset(0.5, 0.5),
                            stops: [0.1, 0.5],
                            tileMode: TileMode.clamp)),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "Criar uma conta",
                          style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              color: Colors.black,
                              fontSize: 22.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) => Register()));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void displaySnackBar(String value) {
    _mainScaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontFamily: "SignikaRegular"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }
}
