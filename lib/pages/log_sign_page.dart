// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'log_in_page.dart';
import 'sign_up_page.dart';

class LogSignPage extends StatelessWidget {
  const LogSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'lib/images/KICK IT LOGO.png', 
                    height: 350,
                  ),
                ),
          
                const SizedBox(height: 8),
      
                //Log in
                GestureDetector(
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: const Text('LOG IN',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ),
                ),
      
                const SizedBox(height: 20),
                
                //Sign Up
                GestureDetector(
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.white,
                        width: 8,
                      )
                    ),
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: const Text('SIGN UP',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      )
                    ),
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