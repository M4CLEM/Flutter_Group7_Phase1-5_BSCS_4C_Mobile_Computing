import 'package:bluemart/components/transaction_item.dart';
import 'package:bluemart/models/carts.dart';
import 'package:bluemart/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text(
            'My Transactions',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: value.getUserTransaction().length,
              itemBuilder: (context, index) {
                Shoe boughtShoeItem = value.getUserTransaction() [index];

                return TransactionItem(shoe: boughtShoeItem);
              }
            )
          ),
        ],
      ),
    ));
  }
}