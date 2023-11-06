// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bluemart/components/bottom_nav_bar.dart';
import 'package:bluemart/pages/log_sign_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'shop_page.dart';
import 'transaction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Selected index to control the bottom nav bar
  int _selectedIndex = 0;

  //Update selected index
  //Everytime user clicks on the bottom nav bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Pages to be displayed
  final List<Widget> _pages = [
    //Shop Page
    const ShopPage(),
    //Cart Page
    const CartPage(),
    //Transactions Page
    const TransactionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
        actions: [Image.asset('lib/images/Logo.png')],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //Logo
                DrawerHeader(
                  child: Image.asset(
                  'lib/images/Logo.png'
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                //Pages
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),       
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Cart',
                      style: TextStyle(color: Colors.white),       
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.list_sharp,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Transactions',
                      style: TextStyle(color: Colors.white),       
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // ABOUT US BUTTON
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About Us',
                      style: TextStyle(color: Colors.white),       
                    ),
                  ),
                ),
                // LOG OUT BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => LogSignPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0, bottom: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Log-out',
                        style: TextStyle(color: Colors.white),       
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
    );
  }
}