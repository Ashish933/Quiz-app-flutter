// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/UI/LoginScreen.dart';
import 'package:quizapp/UI/QuizPage.dart';
import 'package:quizapp/UI/Ragistration.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<String> langname = [
    "Python",
    "Java",
    "JavaScript",
    "C++",
    "",
  ];

  List<String> images = [
    "assets/Images/py.png",
    "assets/Images/java.png",
    "assets/Images/js.png",
    "assets/Images/Cimg.png",
    "assets/Images/C.png",
  ];

  List<String> des = [
    "Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. ...",
    "Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. ... ",
    "Javascript (JS) is a scripting languages, primarily used on the Web. It is used to enhance HTML pages and is commonly found embedded in HTML code. JavaScript is an interpreted language. ",
    "C++ is an object-oriented programming (OOP) language that is viewed by many as the best language for creating large-scale applications...",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",  ];
  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Loadjson(),
          ));
        },
        child: Material(
            color:Colors.cyan,
            elevation: 10.0,
            borderRadius:BorderRadius.circular(25.0),
            child: Container(
              child:Column(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        height: 150.0,
                        width: 150.0,
                        child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(75.0),
                            child:Container(
                              height: 150.0,
                              width: 150.0,
                              child:ClipOval(
                                child:Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(image),
                                ),
                              ),
                            )
                        )
                    ),
                  ),
                  Center(
                    child:Text("langname",style:TextStyle(fontSize:20.0,color:Colors.white,
                      fontFamily:"Nunito",fontWeight: FontWeight.w700,),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child:Text(des,style: TextStyle(fontSize:18.0,color: Colors.white,fontFamily: "Nunito"),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ) ,
            )
        ),
      ),

    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuizApp",
        style:TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple[100],
      ),

      backgroundColor: Colors.deepPurple[200],
      body: ListView(
        children:<Widget>[
          customcard("python", images[0], des[0],),
          customcard("Java", images[1], des[1],),
          customcard("JavaScript", images[2], des[2],),
          customcard("C++", images[3], des[3],),
          customcard("Linux", images[4], des[4],),
        ],
      ),
    );



  }
}
