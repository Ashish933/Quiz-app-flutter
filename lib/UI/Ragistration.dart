// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:quizapp/UI/DatePicker.dart';
import 'package:quizapp/UI/HomePage.dart';
import 'package:quizapp/UI/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';

// ignore: use_key_in_widget_constructors
class RagistrationPage extends StatefulWidget{
  @override
  _RagistrationPageState createState() => _RagistrationPageState();

}
class _RagistrationPageState extends State<RagistrationPage> {


  bool _secureText = true;
  TextEditingController dateinput = TextEditingController();

  // ignore: prefer_final_fields
  TextEditingController _passwordController = TextEditingController();
  String ?_passwordError;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Ragistration Page',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,fontStyle:FontStyle.italic)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800, width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Img3.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children:<Widget> [

              Text("Your Criteria",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0, color: Colors.black87,
                    fontWeight: FontWeight.bold,)
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),

                    hintText: "Enter Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:  TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),

              TextField(
                decoration: InputDecoration(
                    errorText: _passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(_secureText ? Icons.remove_red_eye : Icons. security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
                obscureText:_secureText,

              ),
              SizedBox(height: 3.0),

              TextField(
                decoration: InputDecoration(
                    errorText: _passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(_secureText ? Icons.remove_red_eye : Icons. security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
                obscureText:_secureText,

              ),
              SizedBox(height: 3.0),

              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:  TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:  TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),

              TextField(
                controller: dateinput,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DatePicker()),
                        );
                      },
                      icon: Icon(Icons.date_range),
                    ),
                    hintText: "Date of Birth",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:  TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.streetview),
                    hintText: "Current Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle:  TextStyle(color: Colors.black12),
                    fillColor: Colors.white70,
                    filled: true
                ),
              ),
              SizedBox(height: 3.0),

              RaisedButton(
                elevation: 20,
                color: Colors.green,
                onPressed: (){
                  // ignore: avoid_print
                  print("Password :" + _passwordController.text);
                  setState(() {
                    if(_passwordController.text.length < 8)
                      // ignore: curly_braces_in_flow_control_structures
                      _passwordError = "Enter at least 8 character";
                    else
                      // ignore: curly_braces_in_flow_control_structures
                      _passwordError = null;
                  });

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Widget okButton = TextButton(
                          child:  Text("OK"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavBar()),
                            );
                          },
                        );
                        return AlertDialog(
                          title:  Text("Massage"),
                          content:  Text("your ragistration has successfully submitted"),
                          actions: [
                            okButton,
                          ],
                        );
                      });},
                splashColor: Colors.yellow[200],
                animationDuration: const Duration(seconds: 2),
                child:  Text("Submit"),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(25.0),
                  side:  BorderSide(color: Colors.red),
                ),

              ),

              RaisedButton(
                  elevation: 20,
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  splashColor: Colors.yellow[200],
                  animationDuration:  Duration(seconds: 2),
                  child:  Text("Skip"),
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    side:  BorderSide(color: Colors.red),
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}

