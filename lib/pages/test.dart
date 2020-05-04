import 'package:flutter/material.dart';
import '../util/upload.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  
  bool _isimg = false;
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final GlobalKey<ScaffoldState> _mainScaffoldKey =
      new GlobalKey<ScaffoldState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController cityController = TextEditingController();


 
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

      ),
      key: _mainScaffoldKey,
      body: Container(
        height: height,
        width: width,
        child: Center(
          child: Stack(
                    alignment: Alignment.topCenter,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      ListView(
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child:  Container(
                                child: FlatButton(
                                  child: Text(
                                    "Imagem",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: "SignikaRegular"),
                                  ),
                                  onPressed: () {
                                   Choose();
                                   _isimg = true;
                                  },
                                ),
                              )
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
                                  focusNode: focusEmail,
                                  controller: titleController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.heading,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Titulo",
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
                                  controller: textController,
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.heading,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Descrição",
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
                                  controller: cityController,
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.locationArrow,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Cidade",
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
                                      "Enviar",
                                      style: TextStyle(
                                          fontFamily: "SignikaSemiBold",
                                          color: Colors.white,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if(!_isimg){
                                      displaySnackBar("imagem não selecionada");
                                    }
                                    else if(titleController.text.length<4){
                                      displaySnackBar("titulo muito curto");
                                    }
                                    else if(textController.text.length<4){
                                      displaySnackBar("descrição muito cuta");
                                    }
                                    else if(cityController.text.length<2){
                                      displaySnackBar("informe a cidade");
                                    }
                                    else{
                                      AsyncFileUpload(titleController.text, textController.text, cityController.text);
                                      displaySnackBar("Comcluido");
                                      Navigator.pop(context);
                                    }
                                   
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                        ],
                      )
                    ],
                  ),
        ),
      ),
      
    );
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
