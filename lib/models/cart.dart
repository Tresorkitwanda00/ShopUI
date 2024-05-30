import 'package:flutter/widgets.dart';
import 'package:shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<shoe> shoeShop = [
    shoe(
        name: 'J one',
        price: '230',
        description: 'new shoe is cool',
        imagePath: 'images/JoneBlanc.jpg'),
    shoe(
        name: 'Air Force',
        price: '230',
        description: 'original shoe',
        imagePath: 'images/airforce.jpg'),
    shoe(
        name: 'Nike',
        price: '210',
        description: 'is new made',
        imagePath: 'images/nikepagne.jpg'),
    shoe(
        name: 'Nike',
        price: '210',
        description: 'is new made',
        imagePath: 'images/nikepagne.jpg'),
  ];
  // list shoes in usercart
  List<shoe> usercart = [];
  // get list of shoes for sale
  List<shoe> getShoesList() {
    return shoeShop;
  }

  List<shoe> getUsercartlist() {
    return usercart;
  }

  void addItemToCart(shoe shoes) {
    usercart.add(shoes);
    notifyListeners();
  }

  void removeItemFromCart(shoe shoes) {
    usercart.remove(shoes);
    notifyListeners();
  }
}
