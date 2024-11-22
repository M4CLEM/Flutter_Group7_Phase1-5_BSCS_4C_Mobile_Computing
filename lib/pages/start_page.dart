import 'package:flutter/material.dart';

class StartPage extends StatelessWidget{
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'lib/images/KICK IT LOGO.png', 
                  height: 350,
                ),
              ),

              const SizedBox(height: 20),

              
            ],
          ),
          ),
      ),
    );
  }
}