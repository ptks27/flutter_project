import 'package:flutter/material.dart';

import '../models/shoe.dart';
import '../models/shoe1.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final Function(BuildContext, Shoe) ontap; // เพิ่มพารามิเตอร์ ontap และ Shoe

  ShoeTile({required this.shoe, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(context, shoe),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 15, bottom: 25),
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // shop pic
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(shoe.imagePath)),

              // description
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  shoe.description,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
              const SizedBox(height: 20),

              // price + datails
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\฿' + shoe.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    shoe.rating,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )

              // buttom to add cart
            ],
          ),
        ),
      ),
    );
  }
}

class ShoeTile1 extends StatelessWidget {
  final Shoe1 shoe1;
  final Function(BuildContext, Shoe1) ontap; // เพิ่มพารามิเตอร์ ontap และ Shoe

  ShoeTile1({required this.shoe1, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(context, shoe1),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 15, bottom: 25),
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // shop pic
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(shoe1.imagePath)),

              // description
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  shoe1.description,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
              const SizedBox(height: 20),

              // price + datails
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe1.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\฿' + shoe1.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    shoe1.rating,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )

              // buttom to add cart
            ],
          ),
        ),
      ),
    );
  }
}
