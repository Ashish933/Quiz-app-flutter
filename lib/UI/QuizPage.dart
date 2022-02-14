// ignore_for_file: prefer_const_constructors

import 'dart:convert';


import 'package:flutter/material.dart';

class Loadjson extends StatelessWidget{
  const Loadjson({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
          builder: (context,snapshot){
          List? mydata = json.decode(snapshot.data.toString());
             if (mydata == null){
              return Scaffold(
                body: Center(
                  child: Text(
                      "Loading...",
                ),
              ),
              );
            } else {
              return QuizPage(mydata: mydata );
            }
          }
          ),
    );
  }
}
class QuizPage extends StatefulWidget{
  final mydata;

    QuizPage({Key? key, required this.mydata}) : super(key: key);
   @override
  _QuizPageState createState() => _QuizPageState(mydata: mydata);
}
class _QuizPageState extends State<QuizPage>{

 List? mydata;

   _QuizPageState({this.mydata});
@override
Widget build(BuildContext context) {
     return WillPopScope(
       onWillPop: ()async{
         return false;
        },
             child:  Scaffold(
               body: Center(
                 child: Text(
                   mydata.toString(),
                 ),
               ),

    ),

  );

}
}

