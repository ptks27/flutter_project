import 'package:flutter/material.dart';

import 'package:project/pages/shop_datails_page.dart';
import 'package:project/pages/shop_datails_page1.dart';

import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';

import '../models/cart.dart';

import '../models/shoe.dart';
import '../models/shoe1.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add item to cart
  void navigateToShopDetials(BuildContext context, int index) {
    final shoe = context.read<Cart>();
    final shoeShop = shoe.shoeShop;
    final shoe1 = context.read<Cart>();
    final shoeShop1 = shoe1.shoeShop1;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopDetailsPage(
          shoe: Provider.of<Cart>(context).getShoeList()[
              index], // ใช้ Provider.of<Cart>(context) เพื่อเข้าถึง Cart และค่า value
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shoe = context.read<Cart>();
    final shoeShop = shoe.shoeShop;
    final shoe1 = context.read<Cart>();
    final shoeShop1 = shoe1.shoeShop1;

    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                // message
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'Hvae fun shopping on our application.',
                    style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Popular Team ⚽🔥 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 228, 80, 124)),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // get a shoe from shop list
                      Shoe shoe = value.getShoeList()[index];

                      // return the shoe
                      return ShoeTile(
                        shoe: shoe,
                        ontap: (context, shoe) {
                          // ส่ง context และ shoe ไป
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShopDetailsPage(shoe: shoe), // ส่ง shoe ไป
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    '',
                    style: TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Coming soon! 💯  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // get a shoe from shop list
                      Shoe1 shoe1 = value.getShoeList1()[index];

                      // return the shoe
                      return ShoeTile1(
                        shoe1: shoe1,
                        ontap: (context, shoe1) {
                          // ส่ง context และ shoe ไป
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShopDetailsPage1(shoe1: shoe1), // ส่ง shoe ไป
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ));
  }
}
