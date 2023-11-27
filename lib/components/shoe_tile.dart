// ignore_for_file: must_be_immutable

import 'package:bluemart/models/shoe.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: 280,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Shoe pic
            ClipRRect(
              child: Image.asset(shoe.imagePath),
              borderRadius: BorderRadius.circular(12),
            ),
            //desciption
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                shoe.description,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            //price and details
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //shoe name
                      Text(
                        shoe.name,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
              
                      const SizedBox(height: 5,),
              
                      //price
                      Text(
                        '\₱' + shoe.price,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  //Add to cart button
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12), 
                        bottomRight: Radius.circular(12),
                        
                      ),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}