import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pet_center/pages/login.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}


class _PerfilState extends State<Perfil> {
String nome="";
 @override
  void initState() {
    
    super.initState();
    
    setState(() {
      getname();
    });

  }

  void getname() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nome = prefs.getString('name');
    });
    
  }

  void sair()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('error');
    prefs.remove('name');
    prefs.remove('verification');

    Navigator
    .of(context)
    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: <Widget>[
        SizedBox(height: height*0.05,),
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/icon.png'),
            ),
            Text(
                  'Bem vinda/o',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.white,
                    letterSpacing: 2.5,
                  ),
                ),
            Text(nome,
            style: TextStyle(
              fontFamily: 'SourceSansPro',
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
                
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text("Nos ajude a achar o dono ou ate mesmo adotar algum desse animais.",
                  style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: height*0.05,),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text("E caso você ache algum animal perdido ou queira colocar algum para adoção, o coloque aqui, é so clicar no botão de + no canto inferior direito",
                  style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: height*0.36,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    
                      Card(
                    color: Colors.red[400],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: width*0.2),
                    child: FlatButton(onPressed: sair, 
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.directions_run,
                        color: Colors.white,
                      ),
                      SizedBox(width: width*0.15,),
                      Center(
                        child: Center(
                          child: 
                          Text(
                        'Sair',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0, color: Colors.white),
                      ),
                        ),
                      )
                    ],
                  ))),
                    
                    ],
                  ),
                )
          ],
        ),
      ),
      ],
    );
  }
}