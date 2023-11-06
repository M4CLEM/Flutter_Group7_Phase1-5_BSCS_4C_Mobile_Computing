// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluemart/pages/home_page.dart';
import 'package:bluemart/pages/log_sign_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passToggle = true;
  final _formfield = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  //Text editing controller to get access to what the user typed(A bug will occur if you use the same controller on the different fields)
  //TextEditingController myController = TextEditingController();
  //controller: myController,

  //SingleChildScrollView fixes the bottom overflow issue when the keyboard shows up.

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
          child: Icon(Icons.arrow_back),
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
                          'lib/images/Logo.png',
                          height: 250,
                          ),
                      ),

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
                          validator: (value){
                            bool userValid = RegExp(r'^[\w-.]{8,25}').hasMatch(value!);
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
                              userController.clear();
                              passController.clear();

                              Navigator.push(context,
                                MaterialPageRoute(
                                builder: (context) => HomePage(),
                                )
                              );
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