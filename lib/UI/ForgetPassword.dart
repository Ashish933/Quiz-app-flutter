import 'package:flutter/material.dart';
import 'package:quizapp/UI/HomePage.dart';



// ignore: use_key_in_widget_constructors
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>{
  bool _secureText = true;
  // ignore: prefer_final_fields
  TextEditingController _passwordController = TextEditingController();

  String? _passwordError;
  @override
  Widget build (BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar:AppBar(
        title:const Text("Forgat Password?",
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 20,fontStyle:FontStyle.italic),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: 450,
          decoration: const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/Images/Img3.png"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 100),
          child: Column(
              children:<Widget> [
                TextField(
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email Id or Phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: const TextStyle(color: Colors.black12),
                        fillColor: Colors.white,
                        filled: true
                    )
                ),
                const SizedBox(height: 3.0, width: 5.0,),

                TextField(
                  decoration:
                  InputDecoration(
                    // ignore: prefer_const_constructors
                    labelText: 'New Password',
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




                RaisedButton(
                    elevation: 20,
                    color: Colors.green,
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Widget okButton = TextButton(
                              // ignore: prefer_const_constructors
                              child:  Text("Save"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
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

                            );
                            return AlertDialog(
                              // ignore: prefer_const_constructors
                              title:  Text("Massage"),
                              // ignore: prefer_const_constructors
                              content:  Text("your Password has successfully change"),
                              actions: [
                                okButton,
                              ],
                            );
                          });},
                    splashColor: Colors.yellow[200],
                    animationDuration: const Duration(seconds: 2),
                    child: const Text("Reset Here"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Colors.red),
                    )
                ),

              ]),
        ),
      ),
    );

  }
}