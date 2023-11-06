// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: GNav(
      //backgroundColor: Colors.blue.shade300,
      mainAxisAlignment: MainAxisAlignment.center,
      tabBorderRadius: 16,
      onTabChange: (value) => onTabChange!(value),

      tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            backgroundColor: Color(0xFF7B61FF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              bottomLeft: Radius.circular(7),
            ),
            iconColor: Colors.white,
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
            backgroundColor: Color(0xFFFCFF6F),
            iconColor: Colors.white,
          ),
          GButton(
            icon: Icons.checklist_rtl,
            text: 'Transactions',
            backgroundColor: Color(0xFFFF4655),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(7),
              bottomRight: Radius.circular(7),
            ),
            iconColor: Colors.white,
          )
        ]
      ),
    );
  }
}