// ignore_for_file: must_be_immutable



import 'package:bluemart/models/carts.dart';
import 'package:bluemart/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key, 
    required this.shoe
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemToCart(widget.shoe);

    //Message that the item is removed
    showDialog(
      context: context, 
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 300),(){
          Navigator.of(context).pop(true);
        });
        return const AlertDialog(
          title: Text('Item removed'),
        );
      }
    
    );
  }

  void itemCheckOutCart() {
    Provider.of<Cart>(context, listen: false).itemCheckOut(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text('\₱' + widget.shoe.price),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: removeItemFromCart,
              icon: const Icon(Icons.delete)
            ),
            IconButton(
              onPressed: itemCheckOutCart,
              icon: const Icon(Icons.shopping_cart_checkout)
            )
          ],
        )
      ),
    );
  }
}