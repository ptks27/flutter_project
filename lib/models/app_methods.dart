
import 'package:project/models/shoe.dart';

double calculateTotalPrice(List<Shoe> cart) {
  double total = 0.0;
  for (var shoe in cart) {
    double price = double.parse(shoe.price); // แปลงราคาจาก String เป็น double
    total += price;
  }
  return total;
}