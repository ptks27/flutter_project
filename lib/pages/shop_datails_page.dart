import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/components/button.dart';

import 'package:project/models/cart.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';

class ShopDetailsPage extends StatefulWidget {
  final Shoe shoe;

  const ShopDetailsPage({super.key, required this.shoe});

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shoe = context.read<Cart>();

      shoe.addItemToCart(widget.shoe, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 219, 255, 215),
          content: const Text(
            'Product added successfully!!!',
            style: TextStyle(
              color: Color.fromARGB(255, 27, 143, 4),
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'kanit',
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.done),
              color: Color.fromARGB(255, 35, 153, 6),
              iconSize: 30,
            )
          ],
        ),
      );
    }
  }

  void showLargeImage() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.asset(
          widget.shoe.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return GestureDetector(
      onTap: showLargeImage, // Show large image on tap
      child: Image.asset(
        imagePath,
        height: 250,
        width: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview of food datails

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: showLargeImage, // Show large image on tap
                    child: Image.asset(
                      widget.shoe.imagePath,
                      height: 250,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.shoe.rating,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // shoe name
                  Text(
                    widget.shoe.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //descirption
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Text(
                    'Home shirts from season 23/24. Each teams shirt has a different identity. You can choose to shop according to the team you support. Your favorite player, shop la liga, welcomes you.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //peice + quantity + add to cart button
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\฿' + widget.shoe.price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    // quantity
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 53, 53, 53),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        // quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 53, 53, 53),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // add to cart button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MyBotton(
                    text: 'Add to cart',
                    onTap: addToCart,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
