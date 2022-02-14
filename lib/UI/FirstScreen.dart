// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      home: Scaffold(
        body: Container(
          child: FirstScreen(),
        ),
      ),
    );
  }
}
class FirstScreen extends StatefulWidget{
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen>{
  @override
  Widget build (BuildContext context){
    return Container(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          Container(
          child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 100
                  ),
                  child: Text(
                      "Learn Free"
                  ),
                ),

                Text("We make learning easy. Join AgnitoTechnology to learn flutter."),
              ],

            ),
          ),

          Container(

            child:Center(

                child:Text("Image"),
            ),
          ),

          Container(

            child:Center(

                child:Text("Button"),
            ),
          ),


        ],
      )






    );
  }
}


