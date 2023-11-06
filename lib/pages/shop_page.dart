import 'package:bluemart/models/cart.dart';
import 'package:bluemart/models/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/game_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          //S A L E B A N N E R
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Container(
              child: Image.asset('lib/images/Sale Banner.png'),
            ),
          ),
          // CUSTOM TEXT DIVIDER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 3,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              const Text(
                'Popular Games',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Container(
                width: 100,
                height: 3,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Items
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                // create a game
                Games game = value.getGameList()[index];
                
                // return game
                return GameTile(
                  games: game,
                );
              }
            ),
          ),
        ],
      ),
    ),
    );
  }
}