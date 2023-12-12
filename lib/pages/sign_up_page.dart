// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:bluemart/api_connection/apiconnection.dart';
import 'package:bluemart/pages/log_sign_page.dart';
import 'package:bluemart/users/model/users.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formfield = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var userController = TextEditingController();
  var passController = TextEditingController();
  var conpassController = TextEditingController();
  bool passToggle = true;
  bool conpassToggle = true;

  Future validateUserEmail() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );

      if(res.statusCode == 200)
      {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if(resBodyOfValidateEmail['emailFound'] == true)
        {
          Fluttertoast.showToast(msg: "Email already in use");
        }
        else
        {
          saveUserRecord();
        }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future saveUserRecord() async 
  {
    User userModel = User(
      //1,
      emailController.text.trim(),
      userController.text.trim(),
      passController.text.trim(),
    );

    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200)
      {
        var resBodyOfSignup = jsonDecode(res.body);
        if(resBodyOfSignup['success'] == true) 
        {
          Fluttertoast.showToast(msg: "Signed-up Successfully");

          setState(() {
            emailController.clear();
            userController.clear();
            passController.clear();
            conpassController.clear();
          });
        }
        else
        {
          Fluttertoast.showToast(msg: "Error Occured");
        }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //Appbar
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => LogSignPage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      //Body of the App

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Form
                Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      //Logo
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Image.asset(
                          'lib/images/KICK IT LOGO.png', 
                          height: 200,
                        ),
                      ),

                      //Email textfield
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          // V A L I D A T O R
                          validator: (value) {
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                            if(value.isEmpty){
                              return "Enter Email";
                            }
                            else if(!emailValid){
                              return "Invalid Email";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      //Username textfield
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: userController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          // V A L I D A T O R
                          validator: (value) {
                            bool userValid = RegExp(r'^[\w\s-.]{8,25}').hasMatch(value!);
                            if(value.isEmpty){
                              return "Enter Username";
                            }
                            else if(!userValid){
                              return "Invalid Username";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      //Password textfield
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passController,
                          obscureText: passToggle,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          // V A L I D A T O R
                          validator: (value) {
                            bool passValid = RegExp(r'^[\w]{8,25}').hasMatch(value!);

                            if(value.isEmpty){
                              return "Enter password";
                            }
                            else if(!passValid){
                              return "Invalid Password. Password may contain 8-25 alphanumeric characters";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      //Confirm Password field
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: conpassController,
                          obscureText: conpassToggle,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  conpassToggle = !conpassToggle;
                                });
                              },
                              child: Icon(conpassToggle ? Icons.visibility_off : Icons.visibility),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          // V A L I D A T O R
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                            else if(passController.text != conpassController.text){
                              return "Password do not match";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 48),

                      //Sign up button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            //Sign up logic
                            if(_formfield.currentState!.validate()){
                              // Temporary logic
                              print("Data added successfully");
                              validateUserEmail();
                              // emailController.clear();
                              // userController.clear();
                              // passController.clear();
                              // conpassController.clear();
                            }
                          },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            border: Border.all(
                              color: Colors.white,
                              width: 8,
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: const Text("Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                        ),  
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}