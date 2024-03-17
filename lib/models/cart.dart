import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'shoe.dart';
import 'shoe1.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  final List<Shoe> _shoeShop = [
    Shoe(
        name: 'Real Madrid \n2023/24 MATCH HOME',
        price: '5560',
        imagePath: 'lib/images/1.png',
        description: 'Real Madrid ',
        rating: '4.9'),
    Shoe(
        name: 'Barcelona FC\n2023/24 MATCH HOME',
        price: '4890',
        imagePath: 'lib/images/2.png',
        description: 'Barcelona FC',
        rating: '4.9'),
    Shoe(
        name: 'Atletico Madrid \n2023/24 MATCH HOME ',
        price: '4290',
        imagePath: 'lib/images/3.png',
        description: 'Atletico Madrid ',
        rating: '4.8'),
    Shoe(
        name: 'Sevilla FC \n2023/24 MATCH HOME',
        price: '3098',
        imagePath: 'lib/images/6.png',
        description: 'Sevilla FC',
        rating: '4.7'),
    Shoe(
        name: 'Valencia CF \n2023/24 MATCH HOME',
        price: '5422',
        imagePath: 'lib/images/5.png',
        description: 'Valencia CF',
        rating: '4.2'),
    Shoe(
        name: 'Real betis \n2023/24 MATCH HOME',
        price: '3396',
        imagePath: 'lib/images/4.png',
        description: 'Real betis ',
        rating: '4.6'),
    Shoe(
        name: 'Girona FC \n2023/24 MATCH HOM',
        price: '2996',
        imagePath: 'lib/images/14.png',
        description: 'Girona FC',
        rating: '4.6'),
    Shoe(
        name: 'Athletic de bilbao \n2023/24 MATCH HOME',
        price: '3196',
        imagePath: 'lib/images/15.png',
        description: 'Athletic de bilbao ',
        rating: '4.6'),
    Shoe(
        name: 'Real Sociedad \n2023/24 MATCH HOME',
        price: '3376',
        imagePath: 'lib/images/16.png',
        description: 'Real Sociedad',
        rating: '4.6'),
  ];

  List<Shoe> itemsOnBag = [];
  // customer cart
  List<Shoe> _cart = [];

  // getter methods
  List<Shoe> get shoeShop => _shoeShop;
  List<Shoe> get cart => _cart;

  // list of items in user cart

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart

  // add item to cart
  void addItemToCart(Shoe shoe, int quntity) {
    for (int i = 0; i < quntity; i++) {
      _cart.add(shoe);
    }
    notifyListeners();
  }

  void clearCart(Shoe shoe) {
    _cart.clear();
    notifyListeners();
  }

  void addToCart(Shoe shoe, int quntity) {
    for (int i = 0; i < quntity; i++) {
      _cart.add(shoe);
    }
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    _cart.remove(shoe);
    notifyListeners();
  }

  // remove item from cart

  final List<Shoe1> _shoeShop1 = [
    Shoe1(
        name: 'Nike Barcelona \nStrike Drill Top ',
        price: '1,600',
        imagePath: 'lib/images/8.png',
        description: 'FC Barcelona',
        rating: '4.2'),
    Shoe1(
        name: 'Nike Barcelona \nSportswear Full Zip Hoodie',
        price: '2,395',
        imagePath: 'lib/images/7.png',
        description: 'Nike Barcelona Hoodie ',
        rating: '4.4'),
    Shoe1(
        name: 'Nike Barcelona Jdi Jacket ',
        price: '3,132',
        imagePath: 'lib/images/9.png',
        description: 'Nike Barcelona Jacket',
        rating: '4.2'),
    Shoe1(
        name: 'Youth Third \nShirt 23/24 Black',
        price: '2,926',
        imagePath: 'lib/images/10.png',
        description: 'Real Madrid Shirt 23/24 Black',
        rating: '4.0'),
    Shoe1(
        name: 'adidas LFSTLR Mens \nSweatshirt 23/24 Gold',
        price: '3,511',
        imagePath: 'lib/images/11.png',
        description: 'adidas Mens Sweatshirt ',
        rating: '4.2'),
    Shoe1(
        name: 'F.Gattoni Camiseta \n3ª 23/24 Adulto',
        price: '2,926',
        imagePath: 'lib/images/12.png',
        description: 'Sevilla Shirt',
        rating: '4.0'),
    Shoe1(
        name: 'adidas LFSTLR Mens \nOversize T-Shirt 23/24 Gold',
        price: '2,926',
        imagePath: 'lib/images/13.png',
        description: 'adidas  Mens Oversize T-Shirt ',
        rating: '4.5'),
  ];

  // customer cart
  List<Shoe1> _cart1 = [];

  // getter methods
  List<Shoe1> get shoeShop1 => _shoeShop1;
  List<Shoe1> get cart1 => _cart1;

  // list of items in user cart

  // get list of shoes for sale
  List<Shoe1> getShoeList1() {
    return shoeShop1;
  }

  // get cart

  // add item to cart
  void addItemToCart1(Shoe1 shoe1, int quntity) {
    for (int i = 0; i < quntity; i++) {
      _cart1.add(shoe1);
    }
    notifyListeners();
  }

  // remove item from cart
}
