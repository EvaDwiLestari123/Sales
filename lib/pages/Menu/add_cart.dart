import 'package:flutter/material.dart';
import 'package:sales/widget.dart';

class CartPage extends StatefulWidget {
  final Map<String, int> itemsInCart;

  CartPage({Key? key, required this.itemsInCart}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Cart'),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 25,
              right: 20,
            ),
            child: Text(
              'Items in cart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          //Iterating over itemsInCart map to display the items in a ListView
          ...widget.itemsInCart.entries.map((item) {
            return ListTile(
              title: Text(item.key),
              trailing: Text('Quantity: ${item.value.toString()}'),
            );
          }).toList(),
        ],
      ),
    );
  }
}
