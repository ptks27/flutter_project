import 'package:flutter/material.dart';


import 'shoe.dart';
import 'shoe1.dart';

class Cart1 extends ChangeNotifier {
  // list of shoes for sale
  final List<Shoe1> _shoeShop1 = [
    Shoe1(
        name: 'Real Madrid Shirt',
        price: '12,890',
        imagePath: 'lib/images/1.png',
        description: 'Real Madrid 2023/24 MATCH HOME',
        rating: '4.9'),
    Shoe1(
        name: 'Barcelona Shirt',
        price: '4,890',
        imagePath: 'lib/images/2.png',
        description: 'BARCELONA 2023/24 MATCH HOME',
        rating: '4.9'),
    Shoe1(
        name: 'Atletico Madrid Shirt ',
        price: '4,890',
        imagePath: 'lib/images/3.png',
        description: 'Atletico Madrid 2023/24 MATCH HOME',
        rating: '4.8'),
    Shoe1(
        name: 'Sevilla Shirt',
        price: '3,098',
        imagePath: 'lib/images/6.png',
        description: 'Sevilla 2023/24 MATCH HOME',
        rating: '4.7'),
    Shoe1(
        name: 'Valencia Shirt',
        price: '5,422',
        imagePath: 'lib/images/5.png',
        description: 'Valencia 2023/24 MATCH HOME',
        rating: '4.2'),
    Shoe1(
        name: 'Real betis Shirt',
        price: '3,096',
        imagePath: 'lib/images/4.png',
        description: 'Real betis 2023/24 MATCH HOME',
        rating: '4.6'),
  ];

  // customer cart
  List<Shoe1> _cart1 = [];

  // getter methods
  List<Shoe1> get shoeShop1 => _shoeShop1;
  List<Shoe1> get cart1 => _cart1;

  // list of items in user cart
  List<Shoe> userCart = [];
  List<Shoe1> userCart1 = [];

  // get list of shoes for sale
  List<Shoe1> getShoeList1() {
    return shoeShop1;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }
  List<Shoe1> getUserCart1() {
    return userCart1;
  }

  // add item to cart
  void addItemToCart1(Shoe1 shoe1, int quntity) {
    for (int i = 0; i < quntity; i++) {
      _cart1.add(shoe1);
    }
    notifyListeners();
  }

  // remove item from cart
  void removerItemFromCart1(Shoe1 shoe1) {
    _cart1.remove(shoe1);
    notifyListeners();
  }
}
