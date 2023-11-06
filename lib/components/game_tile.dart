// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../models/game.dart';

class GameTile extends StatelessWidget {
  Games games;
  GameTile({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 500,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(games.imagePath)
          ),
          //Description
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                games.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              //Sale Desciption
              Text(
                games.description, 
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),

          //Buy Button
          GestureDetector(
            onTap: (){
              //Logic Here
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7B61FF),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}