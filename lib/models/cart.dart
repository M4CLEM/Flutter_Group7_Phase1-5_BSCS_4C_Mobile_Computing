import 'package:flutter/material.dart';

import 'game.dart';

class Cart extends ChangeNotifier{
  //List of Games
  List<Games> gameShope = [
    Games(
      name: 'VALORANT', 
      imagePath: 'lib/images/Val Logo.png', 
      description: '5v5 Shooter',
    ),
    Games(
      name: 'GENSHIN IMPACT', 
      imagePath: 'lib/images/Gen Logo.png', 
      description: 'Open World Game'
    ),
    Games(
      name: 'FARLIGHT 84',
      imagePath: 'lib/images/Far Logo.png',
      description: 'Battle Royale',
    ),
    Games(name: 'ROBLOX', 
    imagePath: 'lib/images/Rob Logo.png', 
    description: 'Kids Game',
    ),
  ];

  //list of items in user cart
  List<Games> userCart = [];

  //get List of games
  List<Games> getGameList() {
    return gameShope;
  }
  //get user cart
  List<Games> getUserCart() {
    return userCart;
  }
  //add items to cart
  void addItemToCart(Games games) {
    userCart.add(games);
    notifyListeners();
  }
  //remove items to cart
  void removeItemToCart(Games games) {
    userCart.remove(games);
    notifyListeners();
  }
}