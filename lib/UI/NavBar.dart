// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/Profile/Pages/edit_profile.dart';
import 'package:quizapp/Settings/SettingsScreen.dart';
import 'package:quizapp/UI/HomePage.dart';
import 'package:quizapp/userProfile/profile.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex =0;
  final List<Widget> _children = [
    HomePage(),
    SettingsScreen(),
    ProfilePage(),
  ];
  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
        currentIndex: _currentIndex,
          showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.deepPurple[100],
        // this will be set when a new tab is tapped
        // ignore: prefer_const_literals_to_create_immutables
        items: [
        BottomNavigationBarItem(icon:  Icon(Icons.home), title:  Text('Home'), backgroundColor: Colors.redAccent,),
        BottomNavigationBarItem(icon:  Icon(Icons.settings), title:  Text('Setting'), backgroundColor: Colors.redAccent,),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'), backgroundColor: Colors.redAccent,)
    ],

    ),
    );
  } 
}
