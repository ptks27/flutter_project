import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;

  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}
// remove item from cart

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeFromCart() {
    Provider.of<Cart>(context, listen: false).removeFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
