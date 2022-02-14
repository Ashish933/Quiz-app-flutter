// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/UI/LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      // ignore: prefer_const_constructors
        Duration(seconds: 10),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    debugShowcheckedBanner: false;

    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Image.asset('assets/Images/quizanim.gif',

          fit: BoxFit.fitHeight,

        ),

      ),

    );
  }
}