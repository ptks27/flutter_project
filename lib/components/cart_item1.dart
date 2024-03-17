import 'package:flutter/material.dart';

import '../models/shoe1.dart';

// ignore: must_be_immutable
class CartItem1 extends StatefulWidget {
  Shoe1 shoe1;

  CartItem1({
    super.key,
    required this.shoe1,
  });

  @override
  State<CartItem1> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem1> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.shoe1.imagePath,
      ),
      title: Text(widget.shoe1.name),
      subtitle: Text(widget.shoe1.price),
    );
  }
}
