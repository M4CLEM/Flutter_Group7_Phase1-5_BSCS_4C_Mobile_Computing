import 'package:flutter/material.dart';
import 'package:bluemart/pages/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
              
              const SizedBox(height: 8,),

              GestureDetector(
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  )
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text('START BROWSING',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
