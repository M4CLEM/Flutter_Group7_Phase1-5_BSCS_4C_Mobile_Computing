import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Force One', 
      description: "Colour Shown: White/White", 
      price: '6,195', 
      imagePath: 'lib/images/air-force-1-le-older-shoe-TDGHCN.png',
    ),
    Shoe(
      name: 'Air Max 95',
      description: "Colour Shown: Sequoia/Light Silver/High Voltage",
      price: '5,152',
      imagePath: 'lib/images/air-max-95-mens-shoes-4Nzc1w.png',
    ),
    Shoe(
      name: 'Air Max Scorpion', 
      description: "Colour Shown: Black/Anthracite/Black/Anthracite.", 
      price: "10,879", 
      imagePath: 'lib/images/air-max-scorpion-flyknit-shoes-4dWrx1.png',
    ),
    Shoe(
      name: 'Free Metcon 5', 
      description: "Mica Green/Amber Brown/Medium Ash/Campfire Orange", 
      price: '4,139', 
      imagePath: 'lib/images/free-metcon-5-workout-shoes-HfHgmZ.png',
    )
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get List of games
  List<Shoe> getShoeList() {
    return shoeShop;
  }
  //get user cart
  List<Shoe> getUserCart() {
    return userCart;
  }
  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }
  //remove items to cart
  void removeItemToCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
  //Transactions...
  List<Shoe> userTransactions = [];

  List<Shoe> getUserTransaction() {
    return userTransactions;
  }

  void itemCheckOut(Shoe shoe) {
    userTransactions.add(shoe);
    userCart.remove(shoe);
    notifyListeners();
  }
}