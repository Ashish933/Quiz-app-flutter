
// ignore_for_file: unused_local_variable, avoid_print, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:quizapp/UI/ForgetPassword.dart';
import 'package:quizapp/UI/NavBar.dart';
import 'package:quizapp/UI/Ragistration.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  bool _secureText = true;


  @override
  void initState(){
    super.initState();
  }

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  String? _passwordError;

  set emailController(emailController) {}


  @override
  Widget build (BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 850,
            width: 400,
            decoration: const BoxDecoration(
              image:  DecorationImage(
                image: AssetImage("assets/Images/Img1.png"),
                fit: BoxFit.fill,

              ),
            ),
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children:<Widget> [
                // ignore: prefer_const_constructors
                Text("Log In",style: TextStyle(fontStyle: FontStyle.normal,
                  fontSize: 50,color: Colors.redAccent,
                ),

                ),

                TextField(
                  controller: _usernameController,
                  // ignore: prefer_const_constructors
                    scrollPadding: EdgeInsets.symmetric(),
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                        hintText: "Name",
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: const TextStyle(color: Colors.black12),
                        fillColor: Colors.white,
                        filled: true
                    )

                ),
                const SizedBox(height: 2.0, width: 5.0,),

                TextField(
                  controller:_emailController,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email Id or Phone number",
                        labelText: 'Email ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: const TextStyle(color: Colors.black12),
                        fillColor: Colors.white,
                        filled: true
                    )

                ),


                const SizedBox(height: 2.0, width: 5.0,),

                TextField(
                  controller: _passwordController,

                  decoration:
                  InputDecoration(
                    // ignore: prefer_const_constructors
                    labelText: 'Password',
                    hintText: 'Password',
                    errorText: _passwordError,

                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.black12),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(_secureText ? Icons.remove_red_eye : Icons. security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },


                    ),
                  ),
                  obscureText:_secureText,
                  maxLength: 8,

                ),
                const SizedBox(height: 2.0, width: 5.0,),


                FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                    );

                    //forgot password screen
                  },
                  textColor: Colors.red,
                  child: const Text('Forget Password'),
                ),

                RaisedButton(
                    elevation: 20,
                    color: Colors.green,
                    onPressed: () {
                      var _email = _emailController.text;
                      var _password = _passwordController.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const NavBar()),
                      );
                      print("username : " + _usernameController.text);
                      print("email : " + _emailController.text);
                      print("Password :" + _passwordController.text);



                      setState(() {
                        if(_passwordController.text.length < 8)
                          // ignore: curly_braces_in_flow_control_structures
                          _passwordError = "Enter at least 8 character";
                        else
                          // ignore: curly_braces_in_flow_control_structures
                          _passwordError = null;
                      });

                    },

                    splashColor: Colors.yellow[200],
                    animationDuration: const Duration(seconds: 2),
                    child: const Text("Login Here"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Colors.red),
                    )
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RagistrationPage()),
                    );

                    //forgot password screen
                    },
                  padding: const EdgeInsets.only(top:100),
                  textColor: Colors.white,
                  child: const Text('new user? Create account'),
                ),

              ],

            ),

          ),

        )
    );

  }



}



