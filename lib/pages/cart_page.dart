import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/models/shoe.dart';
import 'package:project/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1; // Initialize quantity

  double calculateTotalPrice(List<Shoe> cart) {
    double total = 0.0;
    for (var shoe in cart) {
      if (shoe.price != null && double.tryParse(shoe.price) != null) {
        double price = double.parse(shoe.price);
        total += price;
      }
    }
    return total;
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void Success(BuildContext context) {
    final cart = context.read<Cart>();

    if (cart.cart.isEmpty) {
      // ถ้าตะกร้าว่าง
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 248, 242, 242),
          content: const Text(
            'Please add products to cart!!',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 10, 10),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'kanit',
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด AlertDialog
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color.fromARGB(255, 89, 235, 21),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'kanit',
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // ถ้าตะกร้าไม่ว่าง
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 219, 255, 215),
          content: const Text(
            'Successfully purchased the product!!!',
            style: TextStyle(
              color: Color.fromARGB(255, 7, 150, 31),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'kanit',
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.done),
              color: Color.fromARGB(255, 7, 150, 31),
              iconSize: 30,
            )
          ],
        ),
      );
    }
  }

  void removeFromCart(Shoe shoe, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 243, 232, 232),
        content: const Text(
          'Want to delete this product?',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'kanit',
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด AlertDialog
            },
            child: Text(
              'Close',
              style: TextStyle(
                color: Color.fromARGB(255, 59, 233, 7),
                fontWeight: FontWeight.bold,
                fontFamily: 'kanit',
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final shop = context.read<Cart>();
              shop.removeFromCart(shoe);

              Navigator.of(context).pop(); // ปิด AlertDialog
              showDeleteSuccessDialog(context); // แสดง Dialog แจ้งลบสำเร็จ
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold,
                fontFamily: 'kanit',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDeleteSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 243, 232, 232),
        content: const Text(
          'Successfully deleted the product!!!',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด AlertDialog
            },
            icon: Icon(Icons.done),
            color: const Color.fromARGB(255, 255, 0, 0),
            iconSize: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: DrawerHeader(
                  child: Image.asset(
                    'lib/images/la.png',
                    height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Text(
              'My basket',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                fontFamily: 'kanit',
              ),
            ),
            const SizedBox(height: 20),
            _mainProductList(value),
            const SizedBox(height: 20),
            _bottomInfos(value.cart),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomInfos(List<Shoe> cart) {
    double total = calculateTotalPrice(cart);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // จัดข้อความไปทางขวาสุด
              children: [
                Text(
                  'Total :',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\฿${total.toStringAsFixed(2)}', // แสดงราคารวมเป็น String ที่มี 2 ตำแหน่งทศนิยม
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: MyBotton(
                  text: 'Buy',
                  onTap: () => Success(context)), // ส่ง context ไปยัง Success
            )
          ],
        ),
      ),
    );
  }

  Widget _mainProductList(Cart value) {
    return SizedBox(
      width: 300,
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: value.cart.length,
        itemBuilder: (context, index) {
          final Shoe shoe = value.cart[index];

          final String shoeimagePath = shoe.imagePath;

          final String shoeName = shoe.name;

          final String shoePrice = shoe.price;

          int quantity = 1;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 100,
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 15,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(0),
                        child: SizedBox(
                          width: 115,
                          height: 78,
                          child: Image.asset(shoeimagePath),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      shoeName,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\฿' + shoePrice,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            removeFromCart(
                                shoe, context); // เรียกใช้งานฟังก์ชันลบสินค้า
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            ' $quantity', // แสดงจำนวนสินค้า
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Increase quantity
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
