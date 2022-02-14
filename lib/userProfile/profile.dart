// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizapp/Profile/user/user_data.dart';
import 'package:quizapp/Settings/SettingsScreen.dart';
import 'package:quizapp/UI/NavBar.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user = UserData.myUser;
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), onPressed: () {  },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: () async {
            final image = await ImagePicker()
                .pickImage(source: ImageSource.gallery);

            if (image == null) return;

            final location = await getApplicationDocumentsDirectory();
            final name = basename(image.path);
            final imageFile = File('${location.path}/$name');
            final newImage =
            await File(image.path).copy(imageFile.path);
            setState(
                    () => user = user.copy(imagePath: newImage.path));

            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://images.pexels.com/photos/11031074/pexels-photo-11031074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                          width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.blue
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),

                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              buildTextField(
                  "Full Name", "Ashish", false),
              buildTextField(
                  "Email", "example@gmail.com", false),
              buildTextField(
              "Password", "*******", true),
              buildTextField(
                  "Phone Number", "00000000", false),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavBar()),
                        );
                      },
                      child: const Text("CANCEL",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                        ),
                        ),
                    style:OutlinedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                      ),
                  ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavBar()),
                      );
                    },
                      child:const Text("SAVE",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black
                        ),
                      ) ,
                    style:OutlinedButton.styleFrom(
                     primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
  Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField){
    return Padding(padding: const EdgeInsets.only(bottom: 30,),
      child: TextField(
        obscureText: isPasswordTextField? isObscurePassword: false,
          decoration: InputDecoration(
            suffix: isPasswordTextField ?
                IconButton(
                  icon: const Icon(Icons.remove_red_eye,
                    color: Colors.grey,),
                  onPressed: (){
                    setState(() {
                      isObscurePassword = ! isObscurePassword;
                    });
                  },
                ):null,
              contentPadding: const EdgeInsets.only(bottom: 5),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )
          ),
      ),
    );
  }

  basename(String path) {}
}
