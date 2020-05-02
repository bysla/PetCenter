import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pet_center/pages/test.dart';
import 'package:pet_center/pages/main.dart';
import 'package:pet_center/pages/listMy.dart';
import 'package:pet_center/pages/login.dart';
import 'package:pet_center/pages/perfil.dart';


class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}



class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
     cheq();
    _pageController = PageController();

  }

  void cheq() async{
SharedPreferences prefs = await SharedPreferences.getInstance();
if (prefs.getString('id')==null) {
  Navigator
    .of(context)
    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Login()));
} else {
}
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _views = [
    Main(),
    ListMy(),
    Perfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFEF),
      body:SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: _views,
        ),
      ), 
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Todos'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Meus'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
            title: Text('Perfil'),
            icon: Icon(Icons.person)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => Test()),);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blueAccent,
    )
    );
  }
}