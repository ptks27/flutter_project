import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../models/shoe1.dart';

class ShopDetailsPage1 extends StatefulWidget {
  final Shoe1 shoe1;

  const ShopDetailsPage1({super.key, required this.shoe1});

  @override
  State<ShopDetailsPage1> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage1> {
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
                  Image.asset(
                    widget.shoe1.imagePath,
                    height: 200,
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
                        widget.shoe1.rating,
                        style: TextStyle(
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
                    widget.shoe1.name,
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
                    'The product is well designed. Suitable for all seasons, comfortable to wear, affordable price. There are many to choose from. Shop now!',
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
                      '\฿' + widget.shoe1.price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
