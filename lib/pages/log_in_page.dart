// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:bluemart/api_connection/apiconnection.dart';
import 'package:bluemart/pages/home_page.dart';
import 'package:bluemart/pages/log_sign_page.dart';
// import 'package:bluemart/users/model/users.dart';
// import 'package:bluemart/users/userpreference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passToggle = true;
  final _formfield = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Text editing controller to get access to what the user typed(A bug will occur if you use the same controller on the different fields)
  //TextEditingController myController = TextEditingController();
  //controller: myController,

  //SingleChildScrollView fixes the bottom overflow issue when the keyboard shows up.

  Future loginUser() async {
  try {
    var res = await http.post(
      Uri.parse(API.logIn),
      body: {
        "user_email": emailController.text.trim(),
        "user_pass": passController.text.trim(),
      },
    );

    print(res.body); 

    if (res.statusCode == 200) {
      var resBodyOfLogin = jsonDecode(res.body);
      if (resBodyOfLogin['success'] == true) {
        Fluttertoast.showToast(msg: "Login Successful");

        Future.delayed(Duration(microseconds: 2000), () {
          Get.to(HomePage());
        });
      } else {
        Fluttertoast.showToast(msg: "Incorrect Credentials");
      }
    }
  } catch (e) {
    print("Error :: " + e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
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
                          height: 250,
                          ),
                      ),

                      //Username textfield
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          // V A L I D A T O R
                          validator: (value){
                            bool userValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                            if(value.isEmpty){
                              return "Enter Email";
                            }
                            else if(!userValid){
                              return "Invalid Email";
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
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
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
                          validator: (value){
                            bool passValid = RegExp(r'^[\w]{8,25}').hasMatch(value!);

                            if(value.isEmpty){
                              return "Enter Password";
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
                      const SizedBox(height: 48),

                      //Login button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            //Login logic here
                            if(_formfield.currentState!.validate()){
                              print("Login Successful");
                              loginUser();
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
                            child: const Text('Login',
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