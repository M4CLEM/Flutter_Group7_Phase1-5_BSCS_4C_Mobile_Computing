// ignore_for_file: prefer_const_constructors

import 'package:bluemart/models/cart.dart';
import 'package:bluemart/pages/log_sign_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogSignPage(),
      )
    );
  }
}