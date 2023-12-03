import 'package:bluemart/models/shoe.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  Shoe shoe;
  TransactionItem({super.key, required this.shoe});

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
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
      ),
    );
  }
}